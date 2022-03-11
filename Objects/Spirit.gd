extends StaticBody2D

onready var animation_player = $AnimationPlayer
onready var animated_sprite =$AnimatedSprite

func _on_playerDetecor_body_entered(_body):
	spirit_counter()
	play_animation()

func spirit_counter():
	Global.spirit_collected = true
	Global.spirits += 1
	#update counter label UI
	
func play_animation():
	animated_sprite.visible = true
	animated_sprite.play("Spirit_freed")
	animation_player.play("collected")
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()


func _on_AnimatedSprite_animation_finished():
	queue_free()
