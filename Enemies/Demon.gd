extends KinematicBody2D

var MAX_SPEED = null
var velocity = Vector2.ZERO
var state = MOVE
var player = null
var knockback = Vector2.ZERO

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

enum {MOVE, ATTACK}

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state()
	
	
	
func move_state(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	if player != null:
		velocity = position.direction_to(player.position) * MAX_SPEED
	
	animationTree.set("parameters/Idle/blend_position", velocity)
	animationState.travel("Idle")
	
	velocity = move_and_slide(velocity)
		
func attack_state():
	pass

func _on_Player_detector_body_entered(body):
	MAX_SPEED = 20
	player = body
	pass

func _on_Player_detector_body_exited(_body):
	MAX_SPEED = 10
	velocity = Vector2.ZERO
	pass

func _on_Hurtbox_area_entered(area):
	#death animation
	knockback = area.knockback_vector * 125
	#queue_free()
