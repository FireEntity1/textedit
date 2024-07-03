extends Control

var fontSize = 20
var filePath = OS.get_executable_path()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save(content):
	var file = FileAccess.open(filePath + "/textEdit.txt", FileAccess.WRITE)
	file.store_string($Editor.text)

func load():
	var file = FileAccess.open(filePath + "/textEdit.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content

func _on_font_down_button_up():
	if fontSize >= 5:
		fontSize -= 5
		$Editor.add_theme_font_size_override("font_size", fontSize)
func _on_font_up_button_up():
	fontSize += 5
	$Editor.add_theme_font_size_override("font_size", fontSize)


func _on_menu_button_button_up(id : int) -> void:
	match id:
		0: print("ONE")
		1: print("TWO")
