extends CharacterBody2D

var speed = 200
var current_state = IDLE
var dir = Vector2.LEFT
var start_pos
var player = null
var player_chase = false

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	CHASE_PLAYER
}

func _ready():
	randomize()

func setCurrentState():
	current_state = IDLE

func _process(delta):
	if current_state == 0:
		$AnimatedSprite2D.stop()
	if current_state == 1:
		$AnimatedSprite2D.stop()
	if current_state == 2:
		$AnimatedSprite2D.play("walk")	

	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		MOVE:
			move(delta)
		CHASE_PLAYER:
			speed = 600
			position += (player.position - position) / speed
			
func move(delta):
	position += dir * speed * delta
	if dir.x == 1:
		$AnimatedSprite2D.flip_h = false
	elif dir.x == -1:
		$AnimatedSprite2D.flip_h = true
		
func choose(array):
	array.shuffle()
	return array.front()

func _on_timer_timeout():
	current_state = choose([IDLE, NEW_DIR, MOVE])
	
func _physics_process(delta):
	if player_chase:
		current_state = CHASE_PLAYER
	move_and_slide()
		
func _on_kamera_area_2d_body_entered(body):
	print("area entered")
	player = body
	player_chase = true
	

func _on_kamera_area_2d_body_exited(body):
	print("area left")
	player = null
	player_chase = false
	speed = 200
	current_state = MOVE
