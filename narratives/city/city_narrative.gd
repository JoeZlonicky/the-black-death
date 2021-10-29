extends "res://narratives/narrative.gd"


func _on_End_body_entered(body):
	if body.is_in_group("rat"):
		$Overlay/Fade/AnimationPlayer.play("fade_out")


func change_scene():
	var _ret = get_tree().change_scene("res://narratives/ocean/ocean_narrative.tscn")
