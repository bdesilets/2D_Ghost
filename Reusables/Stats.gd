extends Node

export var Max_health = 1 setget set_max_health
var health = Max_health setget set_health

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func _ready():
	self.health = Max_health

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		health = 0
		emit_signal("no_health")

func set_max_health(value):
	Max_health = value
	self.health = min(health, Max_health)
	emit_signal("max_health_changed")
