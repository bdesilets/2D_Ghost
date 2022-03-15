extends StaticBody2D

onready var animation_player = $AnimationPlayer
onready var animated_sprite =$AnimatedSprite
onready var UI_label = get_node("../../../GUI/Spirit_counter/Spirit_counter_label")
#figure out how to get counter label corrently!

func _on_playerDetecor_body_entered(_body):
	update_counter()
	play_animation()

func update_counter():
	print("in update_counter")
	Global.spirits += 1
	UI_label.text = "Spirits: " + str(Global.spirits)
	
func play_animation():
	animated_sprite.visible = true
	animated_sprite.play("Spirit_freed")
	animation_player.play("collected")
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()


func _on_AnimatedSprite_animation_finished():
	queue_free()
