extends Area2D

class_name Plant

onready var tileMap = get_tree().get_root().find_node("TileMap", true, false)
onready var tent = get_tree().get_root().find_node("Tent", true, false)

func _ready():
	tent.connect("next_stage", self, "_on_next_stage")

func get_current_cell():
	# Get local position
	var local_pos = tileMap.to_local(position)
	# Convert local position to TileMap position
	var cell = tileMap.world_to_map(local_pos)
	
	return cell

func _on_next_stage():
	var cell = get_current_cell()
	if tileMap.get_cellv(cell) == 3:
		queue_free()
