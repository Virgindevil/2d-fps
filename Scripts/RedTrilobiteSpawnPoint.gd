extends Node2D


var numbers_of_enemies = 5

func _on_timer_timeout():
	if numbers_of_enemies > 0:
		numbers_of_enemies -= 1
		var enemy = load("res://Prefabs/red_trilobite_enemy.tscn").instantiate()
		add_child(enemy)
