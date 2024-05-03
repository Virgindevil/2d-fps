extends Node2D

@export var enemy_sprite : CanvasItem

var is_attack : bool
var arr : Array
var original_color : Color

# Called when the node enters the scene tree for the first time.
func _ready():	
	original_color = enemy_sprite.modulate
	is_attack = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_sprite != null:
		if %Timer.get_time_left() < 1.1:		
			enemy_sprite.modulate = Color(1, 0, 0, 1)
	


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
	enemy_sprite.modulate = original_color
