extends Button

@export var group_name : String

var bomb_hp : int
var enemies

# Called when the node enters the scene tree for the first time.
func _init():
	bomb_hp = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	modulate = Color(1, 1, 1, 1)
	if bomb_hp <= 0:
		enemies = get_tree().get_nodes_in_group(group_name)
		for i in enemies.size():
			var temp = enemies[i]
			temp.enemy_health = 0		
		queue_free()
		enemies.clear()


func _on_button_down():
	bomb_hp -= 1
