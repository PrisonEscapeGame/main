extends Node

var paused = false

func play_game():
	$Player2.start($StartPosition.position)
#	$Guard2.start($StartPosition.position)
	$StartTimer.start()

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		$Player2/FollowCam/PauseMenu.hide()
		Engine.time_scale = 1
	else:
		$Player2/FollowCam/PauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused

func _on_start_timer_timeout():
	pass # Replace with function body.adada
