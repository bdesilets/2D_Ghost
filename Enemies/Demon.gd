extends KinematicBody2D

var velocity = Vector2.ZERO
var MAX_SPEED = null
var player = null


func _process(_delta):
	if player != null:
		velocity = position.direction_to(player.position) * MAX_SPEED
	velocity = move_and_slide(velocity)


func _on_Player_detector_body_entered(body):
	MAX_SPEED = 30
	player = body


func _on_Player_detector_body_exited(body):
	MAX_SPEED = 10
	velocity = Vector2.ZERO
