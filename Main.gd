extends Control

var fontSize = 20
var filePath = OS.get_executable_path()
var note

# Called when the node enters the scene tree for the first time.
func _ready():
	print(filePath)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save(content):
	var file = FileAccess.open(filePath + str(note) + ".txt", FileAccess.WRITE)
	file.store_string($Editor.text)

func loadNote():
	var file = FileAccess.open(filePath + "/textEdit" + str(note) + ".txt", FileAccess.READ)
	if FileAccess.file_exists(filePath + "/textEdit" + str(note) + ".txt"):
		file.store_string($Editor.text)
		var content = file.get_as_text()
		return content
	else:
		print("no file :(")

func _on_font_down_button_up():
	if fontSize >= 5:
		fontSize -= 5
		$Editor.add_theme_font_size_override("font_size", fontSize)
func _on_font_up_button_up():
	fontSize += 5
	$Editor.add_theme_font_size_override("font_size", fontSize)

func _on_load_button_button_up():
	$LoadMenu.show()


func _on_load_menu_id_pressed(id):
	note = id
	loadNote()


func _on_save_button_button_up():
	save($Editor.text)
