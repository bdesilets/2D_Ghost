extends Node

export var Max_health = 1
onready var health = Max_health setget set_health

signal no_health

func set_health(value):
	health = value
	if health <= 0:
		health = 0
		emit_signal("no_health")
