extends Area2D

signal getPosition

var activeDialogue = false
#@onready var playerPos = $"root/Main/Player2".get_position()
@onready var guardPos = $"..".position

func _input(event):
	if event.is_action_pressed("Speak") and len(get_overlapping_bodies()) > 1:
		activeDialogue = !activeDialogue
		print(guardPos)
		if activeDialogue == true:
			getPosition.emit()
			use_dialogue()
			print(get_overlapping_bodies())
			$"../Timer".stop()
			$"..".setCurrentState()
		else:
			$"../Timer".start()
			$"../Dialogue".hide()

func use_dialogue():
	var dialogue = get_parent().get_node("Dialogue")
	
	if dialogue:
		dialogue.start()
