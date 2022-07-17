extends KinematicBody2D

export var MAX_SPEED = 10
export var FRICTION = 500

var velocity = Vector2.ZERO
var state = IDLE
var knockback = Vector2.ZERO
var player = null

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var stats = $Stats
onready var Player_detection = $Player_detector
onready var hurtbox = $Hurtbox

const Enemy_death_effect = preload("res://Enemies/Enemy_death_effect.tscn")

enum {IDLE, WANDER, CHASE, DEAD}

func _ready():
	animationTree.active = true

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	velocity = move_and_slide(velocity)
	
	match state:
		IDLE:
			idle_state(delta)
		WANDER:
			wander_state()
		CHASE:
			chase_state()
		DEAD:
			dead_state()
			
	
func idle_state(delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)	
	seek_player()	
	
func wander_state():
	pass
		
func chase_state():
	if Player_detection.player == null:
		MAX_SPEED = 10
	else:
		MAX_SPEED = 20
		
	velocity = position.direction_to(player.position) * MAX_SPEED
	animationTree.set("parameters/Idle/blend_position", velocity)
			
func dead_state():
	velocity = Vector2.ZERO
	
func seek_player():
	if Player_detection.can_see_player():
		player = Player_detection.player
		state = CHASE
	
func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 125
	hurtbox.create_hit_effect()

func _on_Stats_no_health():
	var enemy_death_effect = Enemy_death_effect.instance()
	self.add_child(enemy_death_effect)
	enemy_death_effect.global_position = global_position
	state = DEAD
