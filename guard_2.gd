extends CharacterBody2D

const speed = 200
var current_state = IDLE
var dir = Vector2.LEFT



func _ready():
	randomize()

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _process(delta):
	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		MOVE:
			move(delta)
			
func move(delta):
	position += dir * speed * delta


func choose(array):
	array.shuffle()
	return array.front()

func _on_timer_timeout():
	current_state = choose([IDLE, NEW_DIR, MOVE])
	
func _physics_process(delta):
	move_and_slide()
