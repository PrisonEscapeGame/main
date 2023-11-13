extends CharacterBody2D


@export var SPEED = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
#var _smoothed_mouse_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()

func start(pos):
	SPEED = 0
	show()

