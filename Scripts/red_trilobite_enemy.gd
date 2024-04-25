extends CharacterBody2D

@export var diraction_array : Node2D

func _physics_process(delta):
	velocity = diraction_array.direction * 200
	move_and_slide()
