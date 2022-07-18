extends Control

onready var heart_empty = $Heart_empty
onready var heart_full = $Heart_full

var hearts = 1 setget set_hearts
var max_hearts = 1 setget set_max_hearts
# dont have to use these variables, can just use variables from player stats
# making new variables allows this code to be more modular

func _ready():
	self.max_hearts = PlayerStats.Max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heart_full != null:
		heart_full.rect_size.x = hearts * 32
	
func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heart_empty != null:
		heart_empty.rect_size.x = max_hearts * 32
	

