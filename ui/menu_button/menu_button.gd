extends HBoxContainer


func _on_Button_mouse_entered():
	$AnimationPlayer.play("mouse_entered")


func _on_Button_mouse_exited():
	$AnimationPlayer.play("default")
