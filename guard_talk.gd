extends Area2D


var activeDialogue = false

func _input(event):
	if event.is_action_pressed("Speak") and len(get_overlapping_bodies()) > 0 and activeDialogue == false:
		changeDialogueStatus()
		use_dialogue()
		print(get_overlapping_bodies())
		$"../Timer".stop()
		$"..".setCurrentState()
	if event.is_action_pressed("pause") and activeDialogue == true:
		$"../Timer".start()
		$"../../CanvasChat".hide()
		changeDialogueStatus()
		

func changeDialogueStatus():
	if activeDialogue:
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
	
	activeDialogue = !activeDialogue
	print("guard: ", activeDialogue)

func use_dialogue():
	var dialogue = $"../../CanvasChat"
	
	if dialogue:
		dialogue.start()
