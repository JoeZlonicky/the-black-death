extends Node2D


const NUM_SECRETS = 1

var secrets_uncovered = 0

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		$Overlay/PauseMenu.visible = true
		get_tree().set_input_as_handled()



func _on_Secret_uncovered():
	secrets_uncovered += 1


func _on_DialogueBox_finished():
	if secrets_uncovered >= NUM_SECRETS:
		yield(get_tree().create_timer(1.0), "timeout")
		$Overlay/Fade/AnimationPlayer.play("fade_out")


func change_scene():
	var _ret = get_tree().change_scene("res://narratives/city/city_narrative.tscn")
