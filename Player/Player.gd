extends KinematicBody2D

var velocity = Vector2.ZERO
const MAX_SPEED = 50

func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	
	input_velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = input_velocity.normalized()
	
	move_and_collide(velocity * delta * MAX_SPEED) 
