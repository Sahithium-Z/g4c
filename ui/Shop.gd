extends Control


onready var world = get_tree().get_root().find_node("World", true, false)

signal bought_seeds
signal sold_plants
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	world.connect("shop_opened", self, "_on_shop_opened")


func _on_shop_opened():
	self.visible = !self.visible


func _on_Button_pressed():
	emit_signal("bought_seeds")


func _on_Button2_pressed():
	emit_signal("sold_plants")
