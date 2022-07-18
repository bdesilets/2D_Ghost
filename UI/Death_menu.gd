extends Control



func _on_Restart_button_pressed():
	game_settings.reset()
	get_tree().change_scene("res://World/World.tscn")

func _on_Quit_button_pressed():
	get_tree().quit()

func start_death_menu():
	$VBoxContainer/Restart_button.grab_focus()
	self.visible = true
