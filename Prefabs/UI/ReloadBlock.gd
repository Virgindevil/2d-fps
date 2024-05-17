extends Panel

@export var AmmoText : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_visible_in_tree() == true and %Timer.is_stopped() == true:
		print("TimerSTART")
		%Timer.start(1.5)


func _on_timer_timeout():
	AmmoText.ammo_left = 10
	AmmoText.text = str(AmmoText.ammo_left)
	visible = false
