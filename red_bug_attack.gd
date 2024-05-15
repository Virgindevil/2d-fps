extends Node2D

@export var enemy_sprite : CanvasItem
@export var time_to_shoot : int
@export var is_tank : bool
@export_global_file ("res://Assets/Flame.png") var red_attack

var is_attack : bool
var arr : Array
var original_color : Color

# Called when the node enters the scene tree for the first time.
func _ready():	
	print(red_attack)		
	original_color = enemy_sprite.modulate
	is_attack = false
	%Timer.start(time_to_shoot)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_sprite != null:
		if %Timer.get_time_left() < 1.1:		
			enemy_sprite.modulate = Color(1, 0, 0, 1)	


func _on_timer_timeout():
	var flame 
	if is_tank:
		flame = load("res://Prefabs/bomb.tscn").instantiate()
	else:
		flame = load("res://Prefabs/flame.tscn").instantiate()
	flame.position = position
	enemy_sprite.modulate = original_color
	add_child(flame)
	arr.append(flame)
	is_attack = true
	await get_tree().create_timer(0.2).timeout
	is_attack = false
	arr[0].queue_free()
	arr=[]
	
