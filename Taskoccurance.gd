extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.editing:
		selected = Globals.editing.type
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
