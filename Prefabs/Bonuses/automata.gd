extends Button

func _process(delta):
	global_position = global_position.move_toward(Vector2(global_position.x,global_position.y+1000), 2)

func _on_button_down():
	GlobalVars.ammo = 30
	GlobalVars.is_automata_pickup = true	
	visible = false
	disabled = true

func _on_timer_timeout():
	GlobalVars.is_automata_active = false
	queue_free()
