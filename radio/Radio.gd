extends StaticBody2D

onready var area = $Area2D
var close_to_human = false
signal interacted_with_radio
#onready var player = get_tree().get_root().find_node("Player", true, false)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if close_to_human:
			emit_signal("interacted_with_radio")


func _on_Area2D_body_entered(body):
	if body is Player:
		close_to_human = true


func _on_Area2D_body_exited(body):	
	if body is Player:
		close_to_human = false
