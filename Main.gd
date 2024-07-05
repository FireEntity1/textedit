extends Control

var fontSize = 20
var note1 = ""
var note2 = ""
var note3 = ""
var note4 = ""

var currentNote = 1

func _ready():
	pass

func _process(delta):
	pass

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
	match currentNote:
		1:note1=$Editor.text
		2:note2=$Editor.text
		3:note3=$Editor.text
		4:note4=$Editor.text
	match id:
		1 : $Editor.text = note1 ; currentNote = 1
		2 : $Editor.text = note2 ; currentNote = 2
		3 : $Editor.text = note3 ; currentNote = 3
		4 : $Editor.text = note4 ; currentNote = 4

func _on_close_button_button_up():
	get_tree().quit()
