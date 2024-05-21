extends Button

@export var group_name : String

var bomb_hp : int
var enemies

# Called when the node enters the scene tree for the first time.
func _ready():
	bomb_hp = 5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bomb_hp <= 0:
		enemies = get_tree().get_nodes_in_group(group_name)
		for i in enemies:
			enemies[i].queue_free()		
		queue_free()


func _on_button_down():
	bomb_hp -= 1
