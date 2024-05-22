extends Button
@export var diraction_array : Node2D
@export var attack_prefab : Node2D
@export var enemy_health : int
@export var enemy_speed: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if attack_prefab.is_attack != true:
		global_position = global_position.move_toward(diraction_array.current_position.position, enemy_speed)
	if enemy_health == 0:
			var par = get_parent()
			par.clear_arr_element()
			queue_free()
	#if attack_prefab != null:			
	#	if not attack_prefab.is_attack:	
	#		pass

func _on_button_down():
	if GlobalVars.is_reloading == false:
		enemy_health -= 1
		
	


