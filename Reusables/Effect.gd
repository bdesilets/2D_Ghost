extends AnimatedSprite

export(bool) var Kill_parent

func _ready():
	self.connect("animation_finished", self, "_on_animation_finished")
	play("animate")
	
func _on_animation_finished():
	queue_free()
	if Kill_parent == true:
		get_parent().queue_free()
