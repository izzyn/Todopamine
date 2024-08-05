extends Label

var diff = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.editing:
		change_diff(Globals.editing.difficulty)
	for node in $"../../".get_children():
		if node is Button:
			node.pressed.connect(func(): 
				text = node.name
				match node.name:
					"Easy":
						change_diff(0)
					"Medium":
						change_diff(1)
					"Challenging":
						change_diff(2)
					"Hard":
						change_diff(3)
			)
	pass # Replace with function body.

func change_diff(tdiff):
	match tdiff:
		0:
			text = "Easy"
			diff = 0
			label_settings.font_color = Globals.easy_color
		1:
			text = "Medium"
			diff = 1
			label_settings.font_color = Globals.medium_color
		2:
			text = "Challenging"
			diff = 2
			label_settings.font_color = Globals.chal_color
		3:
			text = "Hard"
			diff = 3
			label_settings.font_color = Globals.hard_color
	pass


func difficulty_changed():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
