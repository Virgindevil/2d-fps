extends Button
@export var diraction_array : Node2D
#@export var attack_prefab : Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position = global_position.move_toward(diraction_array.current_position.position, 3.5)
	#if attack_prefab != null:			
	#	if not attack_prefab.is_attack:	
	#		pass

func _on_button_down():
	queue_free()


func _on_pressed():
	print("pressed")
	pass # Replace with function body.
