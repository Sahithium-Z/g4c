extends Node2D

onready var tileMap = $TileMap #Top tileset
onready var bottom = $Bottom   #Bottom tileset
onready var player = $Player
onready var ray = $Player/RayCast2D
onready var seeds = load("res://plant/plant.tscn")
onready var timer = $Timer
onready var shop = $CanvasLayer/Shop
signal money_changed
signal seeds_changed
signal plants_changed
signal explaining_controls
signal shop_opened

var seed_count = 30
var harvested_count = 0
var money = 0
var control = false

var times_to_rise = 1

var used_fertilizer = false
signal fertilizer

func _ready():
	emit_signal("explaining_controls")
	shop.connect("bought_seeds", self, "buy_seeds")
	shop.connect("sold_plants", self, "sell_plants")
	shop.connect("bought_fertilizer", self, "fertilizer")
	shop.connect("bought_floodbarrier", self, "floodbarrier")


func shrink_island():
	for i in range(times_to_rise):
		# Get all floodable cells
		var cells = tileMap.get_used_cells_by_id(4)
		cells.append_array(tileMap.get_used_cells_by_id(5))
		cells.append_array(tileMap.get_used_cells_by_id(6))
		# Store cells that are going to get flooded in this table
		var cells_to_flood = []
		
		# Loop through each sand cell to check if it is adjacent to water
		for cell in cells:
			if check_water(cell):
				cells_to_flood.append(cell)
		
		# Flood cells once water checks are done
		for cell in cells_to_flood:
			tileMap.set_cellv(cell, 3)
		
		# Update autotiles
		tileMap.update_bitmask_region()

func check_water(cell): # Checks adjacent cells for water, trust me the really long if statement is worth it
	if tileMap.get_cellv(cell + Vector2.UP) == 3 or tileMap.get_cellv(cell + Vector2.LEFT) == 3 or tileMap.get_cellv(cell + Vector2.DOWN) == 3 or tileMap.get_cellv(cell + Vector2.RIGHT) == 3:
		return true
	else:
		return false

func get_player_cell():
	# Get player local position
	var player_local_pos = tileMap.to_local(player.position)
	# Convert local position to TileMap position
	var player_cell = tileMap.world_to_map(player_local_pos)
	
	return player_cell

func till_dirt(cell):
#must be on grass
	if tileMap.get_cellv(cell) == 6:
		#Set top tileset to dirt
		tileMap.set_cellv(cell, 5)
		#Set bottom tileset to grass
		bottom.set_cellv(cell, 6)
		tileMap.update_bitmask_area(cell)

func touching_plant():
	return ray.get_collider() is Plant

func plant_seed(cell):
	# must be planted on dirt
	if tileMap.get_cellv(cell) == 5 and not touching_plant() and seed_count > 0:
		seed_count -= 1
		emit_signal("seeds_changed", seed_count)
		# instance the seeds scene
		var seed_instance = seeds.instance()
		add_child(seed_instance)
		# position the seed
		var local_pos = tileMap.map_to_world(cell)
		var global_pos = tileMap.to_global(local_pos)
		seed_instance.position = global_pos + Vector2(8, 8)

func harvest_plant(plant):
	if plant.growth_stage == 1:
		harvested_count += 1
		emit_signal("plants_changed", harvested_count)
		plant.queue_free()

func sell_plants():
	money += harvested_count * 3
	harvested_count = 0
	emit_signal("plants_changed", harvested_count)
	#emit signal and variable
	emit_signal("money_changed", money)
	print(money)

func buy_seeds():
	if seed_count < 30 and money > 30 - seed_count:
		money -= 30 - seed_count
		seed_count += 30 - seed_count
	else:
		seed_count += money
		money -= money
	emit_signal("money_changed", money)
	emit_signal("seeds_changed", seed_count)
	
	print(money)

func floodbarrier():
	if times_to_rise > 0 and money > 40:
		times_to_rise = 0
		money -= 40
		emit_signal("money_changed", money)

func fertilizer():
	print(used_fertilizer)
	if not used_fertilizer and money > 40:
		emit_signal("fertilizer")
		money -= 40
		emit_signal("money_changed", money)
		used_fertilizer = true
		print(used_fertilizer)
		
func open_shop():
	emit_signal("shop_opened")

func _input(event):
	if event.is_action_pressed("till_dirt"):
		# till dirt on player tile
		till_dirt(get_player_cell())
	
	if event.is_action_pressed("plant_seeds"):
		if not touching_plant():
			# plant a seed on player tile
			plant_seed(get_player_cell())
		else:
			# harvest plant player is touching
			harvest_plant(ray.get_collider())
	
	if event.is_action_pressed("buy_seeds") && !control:
		open_shop()
	


func _on_next_stage():
	timer.start()

func _on_Timer_timeout():
	shrink_island()
	times_to_rise = 1
	used_fertilizer = false
