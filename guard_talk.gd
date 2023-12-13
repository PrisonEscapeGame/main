extends Area2D


func _input(event):
	if event.is_action_pressed("Speak") and len(get_overlapping_bodies()) > 1:
		use_dialogue()
		print(get_overlapping_bodies())
		$"../Timer".stop()
		$"..".setCurrentState()
		Engine.time_scale = 0


func use_dialogue():
	var dialogue = $"../../CanvasChat"

	if dialogue:
		dialogue.start()

