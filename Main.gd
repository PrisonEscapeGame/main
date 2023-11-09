extends Node

func play_game():
	$Player2.start($StartPosition.position)
	$Guard2.start($StartPosition.position)
	$StartTimer.start()


func _on_start_timer_timeout():
	pass # Replace with function body.adada
