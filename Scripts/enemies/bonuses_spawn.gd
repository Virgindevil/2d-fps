extends Control

@onready var automata = load("res://Prefabs/Bonuses/automata.tscn")
@onready var heal


func spawn_bonus(enemy_position):
	var number = randi()%10
	if number <=1:
		print("automat")
		var automat 
		automat = automata.instantiate()
		automat.global_position = enemy_position
		add_child(automat)
