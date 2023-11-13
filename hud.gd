extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal play_game

func _on_play_button_pressed():
	$PlayButton.hide()
	play_game.emit()
