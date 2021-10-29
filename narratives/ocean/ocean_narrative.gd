extends "res://narratives/narrative.gd"


func change_scene():
	var _ret = get_tree().change_scene("res://menus/main_menu/main_menu.tscn")


func _on_End_body_entered(body):
	if body.is_in_group("boat"):
		$Overlay/Fade/AnimationPlayer.play("fade_out")
