extends "res://Size.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	super(delta)
	var sibling : Button = $"../Button3"
	position = sibling.position
	position.x += size.x + 5
	pass

func _pressed():
	var task = get_node("../Button").task
	Globals.editing = task
	get_tree().change_scene_to_file("res://Newtask.tscn")
