extends Node

var is_reloading : bool
var is_automata_pickup : bool
var is_automata_active : bool

var hp : int
var ammo : int

# Called when the node enters the scene tree for the first time.
func _ready():
	is_automata_pickup = false
	ammo = 30
	hp = 10
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_bonus(enemy_core):
	var number = randi()%10
	if number <=1:
		print("automat")
		var automat 
		automat = load("res://Prefabs/Bonuses/automata.tscn").instantiate()
		automat.position = enemy_core
		add_child(automat)
