extends KinematicBody2D

var MAX_SPEED = null
var velocity = Vector2.ZERO
var state = MOVE
var player = null
var knockback = Vector2.ZERO

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var stats = $Stats

const Enemy_death_effect = preload("res://Enemies/Enemy_death_effect.tscn")

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
	
	match int(stats.health):
		0:
			velocity = Vector2.ZERO

	velocity = move_and_slide(velocity)

		
func attack_state():
	pass

func _on_Player_detector_body_entered(body):
	MAX_SPEED = 20
	player = body

func _on_Player_detector_body_exited(_body):
	MAX_SPEED = 10
	velocity = Vector2.ZERO

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 125

func _on_Stats_no_health():
	var enemy_death_effect = Enemy_death_effect.instance()
	self.add_child(enemy_death_effect)
	enemy_death_effect.global_position = global_position

