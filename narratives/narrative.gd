extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		$Overlay/PauseMenu.visible = true
		get_tree().set_input_as_handled()


func _on_End_body_entered(body):
	if body.is_in_group("marmot"):
		body.kill()


func _on_Marmot_killed():
	$Overlay/Fade/AnimationPlayer.play("fade_out")
