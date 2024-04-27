extends CharacterBody2D

@export var diraction_array : Node2D
@export var attack_prefab : Node2D

func _physics_process(delta):
	if not attack_prefab.is_attack:	
		velocity = diraction_array.direction * 200
		move_and_slide()
