extends Node2D

var numbers_of_enemies = 25
var limit_of_enemies = 5
var arr : Array

func _on_timer_timeout():
	if numbers_of_enemies > 0 and arr.size() <= (limit_of_enemies-1):
		numbers_of_enemies -= 1
		var enemy = load("res://Prefabs/enemies/redBug.tscn").instantiate()
		add_child(enemy)
		arr.append(enemy)

func clear_arr_element():
	arr.resize(arr.size() - 1)
