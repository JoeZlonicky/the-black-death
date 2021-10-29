extends "res://narratives/narrative.gd"

const NUM_SECRETS = 4

var secrets_uncovered = 0


func _on_Secret_uncovered():
	secrets_uncovered += 1


func _on_DialogueBox_finished():
	if secrets_uncovered >= NUM_SECRETS:
		yield(get_tree().create_timer(1.0), "timeout")
		$Overlay/Fade/AnimationPlayer.play("fade_out")


func change_scene():
	var _ret = get_tree().change_scene("res://narratives/city/city_narrative.tscn")
