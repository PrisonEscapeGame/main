extends LineEdit

var value = ""

func _on_text_submitted(new_text):
	value = new_text
	global.userInput = value
	release_focus()
	print(value)
	print(global.userInput)
