extends Node2D

@export var enemy_sprite : CanvasItem
@export var time_to_shoot : int
@export var is_tank : bool
@export_global_file ("res://Assets/Flame.png") var red_attack

var is_attack : bool
var is_charge : bool
var arr : Array
var original_color : Color

# Called when the node enters the scene tree for the first time.
func _ready():	
	original_color = enemy_sprite.modulate
	is_attack = false
	%Timer.start(time_to_shoot)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_sprite != null:
		if is_tank:
			if %Timer.get_time_left() < 3.5:		
				enemy_sprite.modulate = Color(1, 0, 0, 1)	
				if !is_charge: 
					is_charge = !is_charge
					instant_and_destroy_ammo("res://Prefabs/Particles/bomb.tscn",3.4)
		if %Timer.get_time_left() < 1.1:		
			enemy_sprite.modulate = Color(1, 0, 0, 1)	


func _on_timer_timeout():
	if is_tank:
		enemy_sprite.modulate = original_color
	else:
		instant_and_destroy_ammo("res://Prefabs/Particles/flame.tscn",0.2)
	

func instant_and_destroy_ammo(path, time):	
	GlobalVars.hp -= 1
	var flame 
	flame = load(path).instantiate()
	flame.position = position
	enemy_sprite.modulate = original_color
	add_child(flame)
	arr.append(flame)
	is_attack = true
	await get_tree().create_timer(time).timeout
	is_attack = false
	arr[0].queue_free()
	arr=[]
	is_charge = false
