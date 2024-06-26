extends Panel

@export var AmmoText : TextEdit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_visible_in_tree() == true and %Timer.is_stopped() == true:
		GlobalVars.is_reloading = true
		%Timer.start(1.5)

func _on_timer_timeout():
	if GlobalVars.is_automata_active:
		reload(30)
	else:	
		reload(10)

func reload(ammo_count):
	AmmoText.ammo_left = ammo_count
	AmmoText.text = str(AmmoText.ammo_left)
	visible = false
	GlobalVars.is_reloading = false
