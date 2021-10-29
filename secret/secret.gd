extends Control

export (Array, String, MULTILINE) var text


func _on_QuestionMarkButton_pressed():
	for string in text:
		get_tree().call_group("dialogue_box", "add_text_to_queue", string)
	yield(get_tree().create_timer(0.5), "timeout")
	$AnimationPlayer.play("fade_hidden")

func fade_in():
	$QuestionMarkButton.fade_in()