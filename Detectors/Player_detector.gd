extends Area2D

var player = null

func _physics_process(delta):
	pass


func _on_Player_detector_body_entered(body):
	pass
	#MAX_SPEED = 20
	player = body


func _on_Player_detector_body_exited(body):
	#MAX_SPEED = 10
	#velocity = Vector2.ZERO
	pass
	
func can_see_player():
	# should this be a signal?
	return player != null
