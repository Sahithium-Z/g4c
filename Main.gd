extends Node2D

var current_stage = 0
onready var stages = get_node("Stages").get_children()

func _ready():
	for stage in stages:
		print(stage.get_collision_layer())

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shrink_island()

func shrink_island():
	if current_stage < 3:
		current_stage += 1
	
	for stage in stages:
		print(stage)
		if stages.find(stage) == current_stage:
			stage.visible = true
			stage.set_collision_layer(1)
			stage.set_collision_mask(1)
		else:
			stage.visible = false
			stage.set_collision_layer(2)
			stage.set_collision_mask(2)
