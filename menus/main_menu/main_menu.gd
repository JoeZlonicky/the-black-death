extends Control



func _on_BeginButton_pressed():
	$TransitionPlayer.play("fade_out")


func _on_SettingsButton_pressed():
	$TransitionPlayer.play("fade_to_settings")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_SettingsBackButton_pressed():
	$TransitionPlayer.play("fade_from_settings")


func next_scene():
	var _ret = get_tree().change_scene("res://narrative_scenes/narrative_scene.tscn")
