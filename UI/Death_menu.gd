extends Control


func _ready():
	$VBoxContainer/Restart_button.grab_focus()

func _on_Restart_button_pressed():
	get_tree().change_scene("res://World/World.tscn")


func _on_Quit_button_pressed():
	get_tree().quit()
