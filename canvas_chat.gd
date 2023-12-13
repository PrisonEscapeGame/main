extends CanvasLayer

@onready var ollama = $"None"
@onready var text_history = $PanelContainer/MarginContainer/VBoxContainer/TextArea/ScrollContainer/TextHistory
@onready var timerGuard = $"../Guard2/Timer"
const UserInput = preload("res://user_input.tscn")
const AIResponse = preload("res://ai_response.tscn")

func _ready():
	hide()
	get_node("None").connect("response_received" , on_response_received)
	
func start():
	show()

func _on_input_text_submitted(new_text):
	ollama.send_text(new_text)
	var user_input = UserInput.instantiate()
	user_input.set_text(new_text)
	text_history.add_child(user_input)
	
func on_response_received(response):
	var ai_res = AIResponse.instantiate()
	ai_res.set_res(response)
	text_history.add_child(ai_res)
	
func _on_button_pressed():
	hide()
	timerGuard.start()
	Engine.time_scale = 1
