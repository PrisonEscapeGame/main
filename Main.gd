extends Node

var paused = false
#var checkDialogue = get_node("yourNode").get("yourVariable")
@onready var guardTalk = $"res://guard_talk.gd"
var checkDialogue = guardTalk.activeDialogue

func play_game():
	$Player2/FollowCam/PauseMenu.hide()
	$Player2.start($StartPosition.position)
	$StartTimer.start()

func _process(delta):
	if Input.is_action_just_pressed("pause") and checkDialogue == false:
		pauseMenu()

func pauseMenu():
	if paused:
		$Player2/FollowCam/PauseMenu.hide()
		Engine.time_scale = 1
	else:
		$Player2/FollowCam/PauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused
