extends KinematicBody2D

const MAX_SPEED = 40

var velocity = Vector2.ZERO
var state = MOVE
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

enum {MOVE, ATTACK, DASH}

func _ready():
	animationTree.active = true

func _process(_delta):
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()
		DASH:
			dash_state()
	
func move_state():
	var input_velocity = Vector2.ZERO

	input_velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = input_velocity.normalized()
	
	if input_velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_velocity)
		animationTree.set("parameters/Float/blend_position", input_velocity)
		animationTree.set("parameters/Attack/blend_position", input_velocity)
		animationState.travel("Float")
	else:
		animationState.travel("Idle")
		
	velocity = move_and_slide(velocity * MAX_SPEED)
	
	if Input.is_action_just_pressed("Attack"):
		state = ATTACK

func attack_state():
	animationState.travel("Attack")
	
func dash_state():
	pass

func attack_animation_finished():
	state = MOVE

func _on_Hurtbox_area_entered(area):
	#play death animation
	queue_free()
