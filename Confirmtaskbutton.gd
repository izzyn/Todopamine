extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	var root = get_tree().get_root().get_node("MarginContainer")
	var tname = root.get_node("VBoxContainer/HBoxContainer/LineEdit").get_text()
	print(tname)
	for t : Task in Globals.task_manager.total_tasks:
		if t.name == tname: 
			#handle same name error
			return
	if tname == "":
		#handle empty name error
		return
	if len(tname) > 25:
		#Handle too long name error
		return
	var diff = root.get_node("VBoxContainer/VBoxContainer/HBoxContainer/Difficulty_label").diff
	
	if diff == -1:
		#handle no difficulty error
		return

	print(Task.Difficulty.keys()[diff])
	
	var occurance = root.get_node("VBoxContainer/HBoxContainer2/OptionButton").get_selected()

	if occurance == 5:
		#no occurence error
		return
	
	print(Task.Type.keys()[occurance])
	
	var task = Task.new()
	task.name = tname
	task.difficulty = diff
	task.type = occurance
	Globals.task_manager.total_tasks.append(task)
	Globals.task_manager.current_tasks.append(task)
	Globals.save()
	get_tree().change_scene_to_file("res://Main.tscn")
	pass
