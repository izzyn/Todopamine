extends Label

var diff = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	for node in $"../../".get_children():
		if node is Button:
			node.pressed.connect(func(): 
				text = node.name
				match node.name:
					"Easy":
						diff = 0
						label_settings.font_color = Globals.easy_color
					"Medium":
						diff = 1
						label_settings.font_color = Globals.medium_color
					"Challenging":
						diff = 2
						label_settings.font_color = Globals.chal_color
					"Hard":
						diff = 3
						label_settings.font_color = Globals.hard_color
			)
	pass # Replace with function body.

func difficulty_changed():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
