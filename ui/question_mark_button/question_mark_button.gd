extends TextureButton


export (String, MULTILINE) var text

const DEFAULT_TRANSPARENCY = 0.25
const HOVERED_TRANSPARENCY = 0.6


func _ready():
	self_modulate.a = DEFAULT_TRANSPARENCY


func _on_mouse_entered():
	if not $FadeAnimator.is_playing():
		self_modulate.a = HOVERED_TRANSPARENCY
	$ScaleAnimator.play("hover")


func _on_mouse_exited():
	if not $FadeAnimator.is_playing():
		self_modulate.a = DEFAULT_TRANSPARENCY
	$ScaleAnimator.play("unhovered")


func _on_button_down():
	$ScaleAnimator.play("press")


func _on_button_up():
	$ScaleAnimator.play("hover")


func _on_pressed():
	$FlashAnimation.stop()
	$FloatAnimation.stop()
	$FadeAnimator.play("fade")
