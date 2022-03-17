extends Node

var _sceneTree : SceneTree
var _UI_label : Label
var music_enabled : bool
var fx_enabled : bool
var music_volume : float
var fx_volume : float

var _spirits = 0

func update_scene():
	_sceneTree = get_tree()
	_UI_label = _sceneTree.root.get_node("/root/World/GUI/Spirit_counter/Spirit_counter_label")
	
func increase_spirits_by (increment):
	_spirits += increment
	_UI_label.text = "Spirits: " + str(_spirits)

func decrease_spirits_by(increment):
	_spirits -= increment
	_UI_label.text = "Spirits: " + str(_spirits)