extends Node2D

onready var tileMap = $TileMap

func shrink_island():
	# Get all sand cells
	var cells = tileMap.get_used_cells_by_id(2)
	# Store cells that are going to get flooded in this table
	var cells_to_flood = []
	
	# Loop through each sand cell to check if it is adjacent to water
	for cell in cells:
		if check_water(cell):
			cells_to_flood.append(cell)
	
	# Flood cells once water checks are done
	for cell in cells_to_flood:
		tileMap.set_cellv(cell, 3)

func check_water(cell): # Checks adjacent cells for water, trust me the really long if statement is worth it
	if tileMap.get_cellv(cell + Vector2.UP) == 3 or tileMap.get_cellv(cell + Vector2.LEFT) == 3 or tileMap.get_cellv(cell + Vector2.DOWN) == 3 or tileMap.get_cellv(cell + Vector2.RIGHT) == 3:
			return true


func _on_next_stage():
	shrink_island()
