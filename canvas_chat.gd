extends CanvasLayer

@onready var sendText = $"../None"


func _ready():
	hide()
	
func start():
	show()


func _on_input_text_submitted(new_text):
	sendText.send_text(new_text)

