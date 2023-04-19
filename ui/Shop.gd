extends Control


onready var world = get_tree().get_root().find_node("World", true, false)
onready var panel = $Panel
onready var panel_two = $Panel2


signal bought_seeds
signal sold_plants
signal bought_fertilizer
signal bought_floodbarrier
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	panel.visible = false
	panel_two.visible = false
	world.connect("shop_opened", self, "_on_shop_opened")


func _on_shop_opened():
	if self.visible == false:
		self.visible = true
		panel.visible = true
		panel_two.visible = false
	else:
		self.visible = false
		panel.visible = false
		panel_two.visible = false


func _on_Button_pressed():
	emit_signal("bought_seeds")


func _on_Button2_pressed():
	emit_signal("sold_plants")


func _on_Button3_pressed():
	panel_two.visible = true
	panel.visible = false


func _on_Floodbarrier_pressed():
	emit_signal("bought_floodbarrier")


func _on_Fertilizer_pressed():
	emit_signal("bought_fertilizer")


func _on_plants_pressed():
	panel.visible = true
	panel_two.visible = false
