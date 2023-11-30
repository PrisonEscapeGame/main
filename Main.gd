extends Node

var paused = false
var canvasVisibility = true

func play_game():
	$Player2/FollowCam/PauseMenu.hide()
	$Player2.start($StartPosition.position)
	$StartTimer.start()

func _input(event):
	if event.is_action_pressed("pause") and canvasVisibility == false:
		pauseMenu()
		print(canvasVisibility, " pausemenu")

func pauseMenu():
	if paused:
		$Player2/FollowCam/PauseMenu.hide()
		Engine.time_scale = 1
	else:
		$Player2/FollowCam/PauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused


func _on_canvas_chat_visibility_changed():
	canvasVisibility = !canvasVisibility
	print("main: ", canvasVisibility)
