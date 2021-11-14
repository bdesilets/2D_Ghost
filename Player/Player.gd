extends KinematicBody2D

const MAX_SPEED = 30

var velocity = Vector2.ZERO
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
enum {MOVE, ATTACK, STAND}

func _ready():
	animationTree.active = true

func _process(_delta):
	var input_velocity = Vector2.ZERO

	input_velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = input_velocity.normalized()
	
	if input_velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_velocity)
		animationTree.set("parameters/Float/blend_position", input_velocity)
		animationState.travel("Float")
	else:
		animationState.travel("Idle")
		
	velocity = move_and_slide(velocity * MAX_SPEED) 
