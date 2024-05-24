extends Node2D

@export var enemy_sprite : CanvasItem
@export var time_to_shoot : int
@export var is_tank : bool
@export var is_scout : bool

var is_attack : bool
var is_charge : bool
var is_shoot : bool
var arr : Array
var original_color : Color
var timer



# Called when the node enters the scene tree for the first time.
func _ready():	
	original_color = enemy_sprite.self_modulate
	is_attack = false
	is_shoot = false
	%Timer.start(time_to_shoot)
	if is_scout:
		timer = Timer.new()
		add_child(timer)
		timer.autostart = false
		timer.wait_time = 0.35
		var callable = Callable(self, "_timeout")
		timer.connect("timeout", callable)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if enemy_sprite != null:
		
		if is_tank:
			if %Timer.get_time_left() < 3.5:		
				enemy_sprite.self_modulate = Color(1, 0, 0, 1)				
				if !is_charge: 
					is_charge = !is_charge
					instant_and_destroy_ammo("res://Prefabs/Particles/bomb.tscn",3.5,5)
					
		if is_scout:
			if %Timer.get_time_left() < time_to_shoot/2 and !is_shoot:
				enemy_sprite.self_modulate = Color(1, 0, 0, 1)	
			if %Timer.get_time_left() < timer.wait_time*8:
				is_shoot = true
				timer.start()
				
		if %Timer.get_time_left() < 1.1:		
			enemy_sprite.self_modulate = Color(1, 0, 0, 1)	

	

func _timeout():
	print("paw paw")
	instant_and_destroy_ammo("res://Prefabs/Particles/flame.tscn",0.2,0.25)

func _on_timer_timeout():
	if is_tank || is_scout:
		enemy_sprite.self_modulate = original_color
	else:
		instant_and_destroy_ammo("res://Prefabs/Particles/flame.tscn",0.2,0.5)

func instant_and_destroy_ammo(path, time, damage):		
	is_attack = true
	var flame 
	flame = load(path).instantiate()
	flame.position = position
	enemy_sprite.self_modulate = original_color
	add_child(flame)
	arr.append(flame)	
	await get_tree().create_timer(time).timeout
	GlobalVars.hp -= damage
	is_attack = false
	is_charge = false
	if arr.size() > 0:
		arr[0].queue_free()
		arr=[]	
	
