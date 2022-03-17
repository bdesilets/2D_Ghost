extends Control

func _ready():
	$VBoxContainer/Resume_button.grab_focus()

var is_paused = false setget set_is_paused

func unhandled_input(event):
	if event.if_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Resume_button_pressed():
	self.is_paused = false


func _on_Quit_button_pressed():
	get_tree().quit()
