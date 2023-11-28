extends Area2D


var activeDialogue = false

func _input(event):
	if event.is_action_pressed("Speak") and len(get_overlapping_bodies()) > 1:
		pauseGame()
		if activeDialogue == true:
			use_dialogue()
			print(get_overlapping_bodies())
			$"../Timer".stop()
			$"..".setCurrentState()
		else:
			$"../Timer".start()
			$"../../CanvasChat".hide()

func pauseGame():
	if activeDialogue:
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
	
	activeDialogue = !activeDialogue

func use_dialogue():
	var dialogue = $"../../CanvasChat"
	
	if dialogue:
		dialogue.start()
