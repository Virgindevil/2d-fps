extends TextEdit

@export var ReloadBlock : Panel
@export var number_of_ammo : int
var ammo_left

# Called when the node enters the scene tree for the first time.
func _ready():
	ReloadBlock.visible = false
	text = str(number_of_ammo)
	ammo_left = number_of_ammo
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if ammo_left > 1:
				print(ammo_left)
				ammo_left -= 1
				text= str(ammo_left)
			else:
				text= str(0)
				ReloadBlock.visible = true
				
	#if event is Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		
		
