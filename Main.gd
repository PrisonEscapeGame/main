extends Node

func play_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_start_timer_timeout():
	pass # Replace with function body.adada
