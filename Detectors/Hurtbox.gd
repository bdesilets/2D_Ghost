extends Area2D

const Hit_effect = preload("res://Enemies/Hit_effect.tscn")


func _on_Hurtbox_area_entered(area):
	print("area ", area)
	var hit_effect = Hit_effect.instance()
	var current_node = get_tree().current_scene
	print ("current node ", current_node)
	current_node.add_child(hit_effect)
	hit_effect.global_position = global_position
