extends Area2D

signal getPosition

var activeDialogue = false
@onready var guardPos = $"..".position

func _input(event):
	if event.is_action_pressed("Speak") and len(get_overlapping_bodies()) > 1:
		pauseGame()
		print(guardPos)
		if activeDialogue == true:
			getPosition.emit()
			use_dialogue()
			print(get_overlapping_bodies())
			$"../Timer".stop()
			$"..".setCurrentState()
		else:
			$"../Timer".start()
			$"../../Chat".hide()

func pauseGame():
	if activeDialogue:
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
	
	activeDialogue = !activeDialogue

func use_dialogue():
	var dialogue = $"../../Chat"
	
	if dialogue:
		dialogue.start()
