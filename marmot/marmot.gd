extends KinematicBody2D

signal killed

export (float) var speed
export (bool) var active = false

var velocity := Vector2()

onready var camera = $Camera2D


func _ready():
	$AnimationPlayer.set_active(false)


func _physics_process(_delta):
	if not active:
		return
	
	if Input.is_action_pressed("move_right"):
		velocity = Vector2(speed, 0.0)
		$AnimationPlayer.set_active(true)
	else:
		velocity = Vector2(0, 0)
		$AnimationPlayer.set_active(false)
	
	velocity = move_and_slide(velocity)


func _on_Hitbox_body_entered(body):
	if body.is_in_group("flea"):
		get_tree().paused = true
		var tween = Tween.new()
		add_child(tween)
		
		tween.pause_mode = Node.PAUSE_MODE_PROCESS
		tween.interpolate_property(body.camera, "global_position",
			body.camera.global_position, camera.global_position, 1.0)
		tween.start()
		yield(tween, "tween_completed")
		
		remove_child(tween)
		get_tree().paused = false
		
		body.queue_free()
		active = true
		$Camera2D.current = true


func kill():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "speed",
		speed, 0, 3.0)
	tween.start()
	yield(tween, "tween_completed")
	remove_child(tween)
	
	$AnimationPlayer.play("die")
	$AnimationPlayer.set_active(true)
	active = false
	yield($AnimationPlayer, "animation_finished")
	emit_signal("killed")
