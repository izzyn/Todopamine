extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	
	match text:
		"Easy":
			add_theme_color_override("font_color", Globals.easy_color)
		"Medium":
			add_theme_color_override("font_color", Globals.medium_color)
		"Challenging":
			add_theme_color_override("font_color", Globals.chal_color)
		"Hard":
			add_theme_color_override("font_color", Globals.hard_color)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
