extends "res://narratives/narrative.gd"


func _on_End_body_entered(body):
	if body.is_in_group("marmot"):
		body.kill()


func _on_Marmot_killed():
	$Overlay/Fade/AnimationPlayer.play("fade_out")


func next_scene():
	var _ret = get_tree().change_scene("res://narratives/travelling/travelling_narrative.tscn")
	print("Changed scene")
