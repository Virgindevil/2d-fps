extends Node2D

@export var group_name : String

var positions : Array
var temp_positions : Array
var current_position : Marker2D

var direction : Vector2 = Vector2.ZERO

func _ready():
	#Заполянем массив позиций из списка групп по указаному названию group_name
	positions = get_tree().get_nodes_in_group(group_name)
	get_positions()
	get_next_posotion()

func _physics_process(delta):
	#Когда объект достигает указанной точки, она меняется на следующую в массиве
	if global_position.distance_to(current_position.position) < 10:
		get_next_posotion()

func get_positions(): 
	#Перемешиваем точки для перемещения в массиве 
	temp_positions	= positions.duplicate() 
	temp_positions.shuffle()
	
func get_next_posotion():
	#Если позиции закончились, то заполняем из списка позиций
	if temp_positions.is_empty():
		get_positions()
	#Выбираем позицию из перемешки и задаём направление
	current_position = temp_positions.pop_front()
	direction = to_local(current_position.position).normalized()
