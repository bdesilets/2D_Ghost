extends Control


func _ready():
	$VBoxContainer/Start_button.grab_focus()

func _on_Start_button_pressed():
	get_tree().change_scene("res://World/World.tscn")

func _on_Options_button_pressed():
	var options = load("res://UI/Options_menu.tscn").instance()
	get_tree().current_scene.add_child(options)


func _on_Quit_button_pressed():
	get_tree().quit()
