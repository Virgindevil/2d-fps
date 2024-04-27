extends Node2D

var is_attack : bool
var arr : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	is_attack = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var flame = load("res://Prefabs/flame.tscn").instantiate()
	flame.position = position
	add_child(flame)
	arr.append(flame)
	is_attack = true
	await get_tree().create_timer(0.2).timeout
	is_attack = false
	arr[0].queue_free()
	arr=[]
