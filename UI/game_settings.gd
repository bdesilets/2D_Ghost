extends Node

var _sceneTree : SceneTree
var _spirit_counter_label : Label
var music_enabled : bool
var fx_enabled : bool
var music_volume : float
var fx_volume : float

var _spirits = 0


func update_scene():
	_sceneTree = get_tree()
	_spirit_counter_label = _sceneTree.root.get_node("/root/World/UI/Spirit_counter/Spirit_counter_label")
	
func reset():
	PlayerStats.health = PlayerStats.Max_health
	_spirits = 0
	_spirit_counter_label.text = "Spirits: " + str(_spirits)
	
	
func increase_spirits_by (increment):
	_spirits += increment
	_spirit_counter_label.text = "Spirits: " + str(_spirits)

func decrease_spirits_by(increment):
	_spirits -= increment
	_spirit_counter_label.text = "Spirits: " + str(_spirits)
