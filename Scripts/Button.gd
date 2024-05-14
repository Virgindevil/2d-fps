extends Button
@export var diraction_array : Node2D
@export var attack_prefab : Node2D
@export var enemy_health : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if attack_prefab.is_attack != true:
		global_position = global_position.move_toward(diraction_array.current_position.position, 3.5)
	#if attack_prefab != null:			
	#	if not attack_prefab.is_attack:	
	#		pass

func _on_button_down():
	enemy_health -= 1
	if enemy_health == 0:
		var par = get_parent()
		par.clear_arr_element()
		queue_free()
	


