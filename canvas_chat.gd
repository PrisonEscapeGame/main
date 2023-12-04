extends CanvasLayer

@onready var sendText = $"../None"
@onready var text_history = $PanelContainer/MarginContainer/VBoxContainer/TextArea/ScrollContainer/TextHistory
@onready var timerGuard = $"../Guard2/Timer"
const InputResponse = preload("res://input_response.tscn")

func _ready():
	hide()
	
func start():
	show()

func _on_input_text_submitted(new_text):
	sendText.send_text(new_text)
	var input_response = InputResponse.instantiate()
	input_response.set_text(new_text, "response")
	text_history.add_child(input_response)
	

func _on_button_pressed():
	hide()
	timerGuard.start()
	Engine.time_scale = 1
