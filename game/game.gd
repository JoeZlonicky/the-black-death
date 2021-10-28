extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		$Overlay/PauseMenu.visible = true
		get_tree().set_input_as_handled()
