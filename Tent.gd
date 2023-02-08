extends StaticBody2D

onready var area = $Area2D
var touching_player = false

signal next_stage

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if touching_player:
			emit_signal("next_stage")


func _on_body_entered(body):
	if body is Player:
		touching_player = true

func _on_body_exited(body):
	if body is Player:
		touching_player = false
