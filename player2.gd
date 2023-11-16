extends CharacterBody2D


@export var SPEED = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var gameOn = false
#var _smoothed_mouse_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func start(pos):
	gameOn = true
	position = pos
	show()
	

func _physics_process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if !gameOn:
		return
	else:
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	move_and_slide()
	#_smoothed_mouse_pos = lerp(_smoothed_mouse_pos, get_global_mouse_position(), 0.3)
	#look_at(_smoothed_mouse_pos)

