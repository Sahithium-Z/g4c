extends Control


onready var money_label = $Money
onready var seeds_label = $Seed
onready var plants_label = $Plant
onready var world = get_tree().get_root().find_node("World", true, false)
onready var money = world.money setget set_money
onready var seeds = world.seed_count setget set_seeds
onready var plants = world.harvested_count setget set_plants
func set_money(x):
	#Money is never less than 0
	money = max(x, 0)
	if money_label != null:
		#Changes label to money
		money_label.text = "$" + str(money)
		
func set_seeds(x):
	#Seeds are never less than 0
	seeds = max(x, 0)
	if seeds_label != null:
		#Changes label to seeds
		seeds_label.text = str(seeds)

func set_plants(x):
	#Plants are never less than 0
	plants = max(x, 0)
	if plants_label != null:
		#Changes label to plants
		plants_label.text = str(plants)
func _ready():
	self.money = 0
	#Connects to signals from world
	world.connect("money_changed", self, "set_money")
	world.connect("seeds_changed", self, "set_seeds")
	world.connect("plants_changed", self, "set_plants")
	
