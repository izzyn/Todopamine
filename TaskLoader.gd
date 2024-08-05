extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for c in get_children():
		c.visible = false
	
	for t in Globals.task_manager.current_tasks:
		var task = preload("res://Taskname.tscn").instantiate()
		task.get_node("Taskname/Button").text = t.name
		var button = task.get_node("Taskname/Button")
		match t.difficulty:
			0:
				button.add_theme_color_override("font_color", Globals.easy_color)
			1:
				button.add_theme_color_override("font_color", Globals.medium_color)
			2:
				button.add_theme_color_override("font_color", Globals.chal_color)
			3:
				button.add_theme_color_override("font_color", Globals.hard_color)
		match t.type:
			0:
				get_node("Daily").add_child(task)
				get_node("Daily").visible = true
			1:
				get_node("Daily").add_child(task)
				get_node("Daily").visible = true
			2:
				get_node("Daily").add_child(task)
				get_node("Daily").visible = true
			3:
				get_node("Weekly").add_child(task)
				get_node("Weekly").visible = true
			4:
				get_node("Monthly").add_child(task)
				get_node("Monthly").visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
