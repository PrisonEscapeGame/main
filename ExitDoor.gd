extends Sprite2D

@onready var ending = $"../You WON!"

# When variable named value from PinLineEdit.gd is provided and is equal to global variable pinCode
# the collision of the door will be disabled and the player is able to exit the map.
func _physics_process(delta):
	if global.userInput == global.pinCode:
		$StaticBody2D/DoorCollisionShape.disabled = true
		ending.show()
		Engine.time_scale = 0
		

