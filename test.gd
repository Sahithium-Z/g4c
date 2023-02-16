extends ColorRect

#this code is so goofy idk whats happening
#theres probably a better way but
#not worth it

onready var tween = $Tween
onready var other_tween = $Tween2
onready var other_other_tween = $Tween3
onready var tent = get_tree().get_root().find_node("Tent", true, false)
onready var player = get_tree().get_root().find_node("Player", true, false)
onready var timer = $Timer
onready var labeltimer = $labeltimer
onready var label = $RichTextLabel
onready var other_label = $RichTextLabel2
var is_sleeping = false
var which_timer = true
var is_fading = false

func _ready():
	tent.connect("next_stage", self, "_on_next_stage")
	labeltimer.connect("timeout", self, "_on_labeltimer_timeout")

func _input(event):
	if event.is_action_pressed("ui_accept") && is_sleeping && is_fading:
		tween.interpolate_property(self, "color", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		other_tween.interpolate_property(other_label, "percent_visible", 1.0, 0.0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		other_tween.start()
		other_other_tween.interpolate_property(label, "percent_visible", 1.0, 0.0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		other_other_tween.start()
		which_timer = false
		is_fading = false
		timer.start()

func _on_next_stage():
	if is_sleeping:
		return
	is_sleeping = true
	player_off()
	tween.interpolate_property(self, "color", Color(0, 0, 0, 0), Color(0, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	which_timer = true
	timer.start()
	labeltimer.start()

func player_on():
	player.set_active(true)

func player_off():
	player.set_active(false)

func _on_Timer_timeout():
	if which_timer:
		which_timer = false
		is_fading = true
	else:
		is_sleeping = false
		player_on()

func _on_labeltimer_timeout():
	tween.interpolate_property(label, "percent_visible", 0.0, 1.0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	other_tween.interpolate_property(other_label, "percent_visible", 0.0, 1.0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	other_tween.start()
