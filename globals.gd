extends Node

const SAVE_DIR = "user://saves/"
const SAVE_FILE_NAME = "data.json"
#Yeah!!
var SECURITY_KEY = ""
const SECURITY_FILE_NAME = "key"

var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0987654321'
@export
var easy_color : Color
@export
var medium_color : Color
@export
var chal_color : Color
@export
var hard_color : Color

var editing : Task 

var player_data : PlayerData = PlayerData.new()
var task_manager : TaskManager = TaskManager.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var keydir = DirAccess.make_dir_absolute(SAVE_DIR)
	load_data()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word

func get_key():
	if not FileAccess.file_exists(SECURITY_FILE_NAME):
		var writekey = FileAccess.open(SECURITY_FILE_NAME, FileAccess.WRITE)
		if writekey == null:
			print(FileAccess.get_open_error())
			return
		writekey.store_string(generate_word(characters, 50));
		writekey.close()
	var keyfile = FileAccess.open(SECURITY_FILE_NAME, FileAccess.READ)
	
	if keyfile == null:
		print(FileAccess.get_open_error())
		return
	
	var key = keyfile.get_as_text()
	keyfile.close()
	return key
	pass

func load_task(data):
	var task = Task.new()
	task.name = data["name"]
	task.type = int(data["type"])
	task.difficulty = int(data["difficulty"])
	return task

func save():
	
	#var key = get_key()
	#var file = FileAccess.open_encrypted_with_pass(SAVE_FILE_NAME, FileAccess.WRITE, key)
	var file = FileAccess.open(SAVE_FILE_NAME, FileAccess.WRITE)
	if file == null:
		print(FileAccess.get_open_error())
		return
	
	var data = {
		"player_data": {
			"points": player_data.points
		},
		"task_manager": {
			"current_tasks": [],
			"total_tasks": []
		}
	}
	for t in task_manager.current_tasks:
		data["task_manager"]["current_tasks"].append(
			{
				"name": t.name,
				"difficulty" : t.difficulty,
				"type": t.type
			}
		)
	for t in task_manager.total_tasks:
		data["task_manager"]["total_tasks"].append(
			{
				"name": t.name,
				"difficulty" : t.difficulty,
				"type": t.type
			}
		)
	var json_string = JSON.stringify(data, "\t")
	
	file.store_string(json_string)
	file.close()
	print(data)
	pass
	
func load_data():
	#var key = get_key()
	if not FileAccess.file_exists(SAVE_FILE_NAME):
		print("No save file exists :(")
		return
	
	#var file = FileAccess.open_encrypted_with_pass(SAVE_FILE_NAME, FileAccess.READ, key)
	var file = FileAccess.open(SAVE_FILE_NAME, FileAccess.READ)
	if file == null:
		print(FileAccess.get_open_error())
		return
	var content = file.get_as_text()
	var data = JSON.parse_string(content)
	if data == null:
		print("Can't parse save file :(")
		return
	
	player_data.points = int(data["player_data"]["points"])
	print(data)
	for t in data["task_manager"]["current_tasks"]:
		task_manager.current_tasks.append(load_task(t))
	for t in data["task_manager"]["total_tasks"]:
		task_manager.total_tasks.append(load_task(t))
	
	file.close()

