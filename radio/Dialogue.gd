extends Control

onready var radio = get_tree().get_root().find_node("Radio", true, false)
onready var player = get_tree().get_root().find_node("Player", true, false)
onready var label = $Label
#trust don't worry abt it
var dialogues = ["", "*bzzt*","...you're listening to ... news.","...decade hundreds of hurricanes and tsunamis have ravaged our shores. Many places around the world are sinking...","...burned too many fossil fuels and we have cut down too many forests, and now we pay the price...","...technology is not good enough ... use renewable energy instead but ... out of time...","...weather ... only ... worse from here...", "...this is ... end...","*bzzt*", ""]
var diaglogue_id = 0
var dialogue_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	radio.connect("interacted_with_radio", self, "_on_interacted_with_radio")

func _input(event):
	if !dialogue_active:
		return
	#When pressing enter, the next line shows
	if event.is_action_pressed("ui_accept"):
		next_line()

func _on_interacted_with_radio():
	#only plays if it has interacted for the first time
		play_dialogue()

func play_dialogue():
	#doesnt activate if dialogue is already active
	if dialogue_active:
		return
	#turns off movement
	player_off()
	dialogue_active = true
	self.visible = true
	diaglogue_id = -1
	next_line()

func next_line():
	#advances dialogue to next line
	diaglogue_id += 1
	print(diaglogue_id)
	print(len(dialogues))
	label.text = dialogues[diaglogue_id]
	#if it reaches the end, it stops
	if diaglogue_id >= len(dialogues)-1:
		$Timer.start()
		self.visible = false
		player_on()
		return

func _on_Timer_timeout():
	dialogue_active = false

func player_on():
	player.set_active(true)

func player_off():
	player.set_active(false)
