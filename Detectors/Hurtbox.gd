extends Area2D

const Hit_effect = preload("res://Enemies/Hit_effect.tscn")
onready var timer = $Timer

var invincible = false

signal invivibility_started
signal invicibility_ended

func start_invinciblity(duration):
	emit_signal("invivibility_started")
	timer.start(duration)
	invincible = true

func _on_Timer_timeout():
	emit_signal("invicibility_ended")
	invincible = false
	
func create_hit_effect():
	var hit_effect = Hit_effect.instance()
	var current_node = get_tree().current_scene
	current_node.add_child(hit_effect)
	hit_effect.global_position = global_position

func _on_Hurtbox_invicibility_ended():
	monitoring = true

func _on_Hurtbox_invivibility_started():
	set_deferred("monitoring", false)
