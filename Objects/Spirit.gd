extends StaticBody2D

onready var animation_player = $AnimationPlayer
const Collected_effect = preload("res://Objects/collected_effect.tscn")


func _on_PlayerDetector_area_entered(area):
	game_settings.increase_spirits_by(1)
	play_animation()

	
func play_animation():
	var collected_effect = Collected_effect.instance()
	self.add_child(collected_effect)
	collected_effect.global_position = global_position
	
	animation_player.play("fadeout")

