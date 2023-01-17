extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	# Get inputs
	var input = Vector3.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input.x == 0:
		apply_x_friction()
	else:
		apply_x_acceleration(input.x)
	if input.y == 0:
		apply_y_friction()
	else:
		apply_y_acceleration(input.y)
	
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_x_friction():
	velocity.x = move_toward(velocity.x, 0, 4)

func apply_y_friction():
	velocity.y = move_toward(velocity.y, 0, 4)

func apply_x_acceleration(amount):
	velocity.x = move_toward(velocity.x, 50 * amount, 6)

func apply_y_acceleration(amount):
	velocity.y = move_toward(velocity.y, 50 * amount, 6)
