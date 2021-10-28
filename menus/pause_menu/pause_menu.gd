extends ColorRect



func _unhandled_input(event):
	if visible and event.is_action_pressed("pause"):
		_on_SettingsBackButton_pressed()
		_on_ResumeButton_pressed()
		get_tree().set_input_as_handled()


func _on_ResumeButton_pressed():
	get_tree().paused = false
	visible = false


func _on_SettingsButton_pressed():
	$Content.visible = false
	$SettingsMenu.visible = true


func _on_ReturnToMainMenuButton_pressed():
	var _ret = get_tree().change_scene("res://menus/main_menu/main_menu.tscn")
	get_tree().paused = false


func _on_SettingsBackButton_pressed():
	$Content.visible = true
	$SettingsMenu.visible = false
