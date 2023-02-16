extends Area2D

class_name Plant

onready var tileMap = get_tree().get_root().find_node("TileMap", true, false)
onready var tent = get_tree().get_root().find_node("Tent", true, false)
onready var animatedSprite = $AnimatedSprite
onready var timer = $Timer

var growth_stage = 0

func _ready():
	tent.connect("next_stage", self, "_on_next_stage")

func get_current_cell():
	# Get local position
	var local_pos = tileMap.to_local(position)
	# Convert local position to TileMap position
	var cell = tileMap.world_to_map(local_pos)
	
	return cell

func _on_next_stage():
	timer.start()



func _on_Timer_timeout():
	# Checking if the plant is going to be destroyed by water
	var cell = get_current_cell()
	if tileMap.get_cellv(cell) == 3:
		queue_free()
	
	# Grow
	if growth_stage < 1:
		growth_stage += 1
	animatedSprite.frame = growth_stage
