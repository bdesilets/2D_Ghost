extends KinematicBody2D

const MAX_SPEED = 40
const DASH_MULTIPLIER = 2

var velocity = Vector2.ZERO
var state = MOVE
var dash_vector = Vector2.DOWN

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

enum {MOVE, ATTACK, DASH}

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
		DASH:
			dash_state(delta)
	
func move_state(delta):
	var input_velocity = Vector2.ZERO

	input_velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = input_velocity.normalized()
	
	if input_velocity != Vector2.ZERO:
		dash_vector = velocity
		animationTree.set("parameters/Idle/blend_position", input_velocity)
		animationTree.set("parameters/Float/blend_position", input_velocity)
		animationTree.set("parameters/Attack/blend_position", input_velocity)
		animationTree.set("parameters/Dash/blend_position", input_velocity)
		animationState.travel("Float")
	else:
		animationState.travel("Idle")
		
	move()
	
	if Input.is_action_just_pressed("Dash"):
		state = DASH
	
	if Input.is_action_just_pressed("Attack"):
		state = ATTACK
		

func attack_state(delta):
	animationState.travel("Attack")
	
func dash_state(delta):
	velocity = dash_vector * DASH_MULTIPLIER
	animationState.travel("Dash")
	move()
	
func move():
	velocity = move_and_slide(velocity * MAX_SPEED)

func attack_animation_finished():
	state = MOVE

func dash_animation_finished():
	state = MOVE

func _on_Hurtbox_area_entered(area):
	#play death animation
	game_settings.start_death_menu()
