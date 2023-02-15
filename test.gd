extends ColorRect

onready var tween = $Tween

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("your mother")
		tween.interpolate_property(self, "color", Color(0, 0, 0, 0), Color(0, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
