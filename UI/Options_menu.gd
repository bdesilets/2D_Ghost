extends Control

#func unhandled_input(event):
#	if event.if_action_pressed("ui_cancel"):
#		Options_menu.gueue_free()


func _on_HSlider_changed(volume: float):
	game_settings.music_volume = volume
	$TabContainer/Sound/MarginContainer/GridContainer/HSlider.text = str(volume)
	# if the volume is less than a minmum value, music_enabled = true, else =false
