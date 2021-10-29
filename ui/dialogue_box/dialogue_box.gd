extends TextureRect


signal finished

var dialogue_queue = []
var text_progress = 0.0
var text_speed = 16

func _ready():
	visible = false


func add_text_to_queue(text):
	if visible and $Label.visible_characters < $Label.text.length():
		dialogue_queue.append(text)
	else:
		$Label.text = text
		visible = true
		reset_text_progress()


func _physics_process(delta):
	if visible and $Label.visible_characters < $Label.text.length():
		text_progress += delta * text_speed
		$Label.visible_characters = int(text_progress)
		if $Label.visible_characters >= $Label.text.length() and not dialogue_queue:
			emit_signal("finished")
	
	elif visible and dialogue_queue:
		$Prompt.visible = true


func _on_gui_input(event):
	if event.is_action_pressed("left_click"):
		if $Label.visible_characters < $Label.text.length():
			text_progress = $Label.text.length()
			$Label.visible_characters = -1
		elif dialogue_queue:
			$Label.text = dialogue_queue.pop_front()
			reset_text_progress()


func reset_text_progress():
	$Label.visible_characters = 0
	text_progress = 0.0
	$Prompt.visible = false
