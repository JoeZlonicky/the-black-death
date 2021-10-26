extends HBoxContainer


func _ready():
	$Button.set_focus_mode(Control.FOCUS_NONE)
	
func _on_Button_mouse_entered():
	$AnimationPlayer.play("mouse_entered")


func _on_Button_mouse_exited():
	$AnimationPlayer.play("default")


func _on_Button_button_down():
	$AnimationPlayer.play("button_down")


func _on_Button_button_up():
	$AnimationPlayer.play("button_up")
	$AnimationPlayer.queue("mouse_entered")
