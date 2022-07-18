extends Node2D

onready var death_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	death_menu = $UI/Death_menu
	var player = $YSort/Player
	game_settings.update_scene()
	player.connect("death", self, "open_death_menu")
	
func open_death_menu():
	death_menu.start_death_menu()
