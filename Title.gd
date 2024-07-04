extends Control

var following = false
var dragging_start_position = Vector2()

func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_viewport().get_mouse_position()

func _process(_delta):
	if following:
		var mouseNow := Vector2i(get_viewport().get_mouse_position())
		get_window().position += mouseNow - dragging_start_position
