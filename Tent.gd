extends StaticBody2D

onready var area = $Area2D
onready var fade = get_tree().get_root().find_node("Fade", true, false)
onready var gameOver = get_tree().get_root().find_node("Game Over", true, false)
onready var tileMap = get_tree().get_root().find_node("TileMap", true, false)
var touching_player = false
var enabled = true

signal next_stage

func _input(event):
	if event.is_action_pressed("ui_accept") and enabled:
		position = position
		if tileMap in area.get_overlapping_bodies() and !fade.is_sleeping:
			gameOver.fade_in()
			enabled = false
		elif touching_player && !fade.is_sleeping:
			emit_signal("next_stage")


func _on_body_entered(body):
	if body is Player:
		touching_player = true

func _on_body_exited(body):
	if body is Player:
		touching_player = false
