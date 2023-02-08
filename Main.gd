extends Node2D

onready var tileMap = $TileMap #Top tileset
onready var bottom = $Bottom   #Bottom tileset
onready var player = $Player

func shrink_island():
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

func till_dirt(cell):
	
	if tileMap.get_cellv(cell) == 6:
		#Set top tileset to dirt
		tileMap.set_cellv(cell, 5)
		#Set bottom tileset to grass
		bottom.set_cellv(cell, 6)
		tileMap.update_bitmask_area(cell)

func _input(event):
	if event.is_action_pressed("till_dirt"):
		# Get player local position
		var player_local_pos = tileMap.to_local(player.position)
		var player_cell = tileMap.world_to_map(player_local_pos)
		till_dirt(player_cell)


func _on_next_stage():
	shrink_island()
