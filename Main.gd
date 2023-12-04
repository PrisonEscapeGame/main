extends Node

var paused = false

func play_game():
	$Player2/FollowCam/PauseMenu.hide()
	$Player2.start($StartPosition.position)
	$StartTimer.start()

func _input(event):
	if event.is_action_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		$Player2/FollowCam/PauseMenu.hide()
		Engine.time_scale = 1
	else:
		$Player2/FollowCam/PauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused

