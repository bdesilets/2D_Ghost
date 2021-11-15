extends StaticBody2D


func _on_playerDetecor_body_entered(body):
	queue_free()
