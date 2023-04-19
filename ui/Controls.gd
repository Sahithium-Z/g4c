extends Control

onready var world = get_tree().get_root().find_node("World", true, false)
onready var player = get_tree().get_root().find_node("Player", true, false)
onready var label = $Panel/Label
var controls = ["How to Play:\nYou are on an island.\nYour goals are to make as much money as possible before the island sinks.", "Controls:\nR = Till Dirt\nT = Plant Seeds / Harvest Plant\nB = Open Shop","Sleep:\nPress Enter next to the tent to go to sleep.","Fertilizer:\nFor $40 you can buy fertilizer in the shop.\nThis grows all crops instantly.","Floodbarrier:\nThis upgrade can be bought for $40 in the shop.\nIt stops water from rising for 1 turn", ""]
var control_id = 0
var control_active = false
func _ready():
	world.connect("explaining_controls", self, "_on_explaining_controls")

func _input(event):
	if !control_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_line()
func _on_explaining_controls():
	self.visible = true
	player.set_active(false)
	world.control = true
	control_active = true
	control_id = -1
	next_line()
	
func next_line():
	control_id+=1
	label.text = controls[control_id]
	if control_id >= len(controls)-1:
		$Timer.start()
		self.visible = false
		player.set_active(true)
		world.control = false
		return


func _on_Timer_timeout():
	control_active = false
