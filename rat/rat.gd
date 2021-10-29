extends KinematicBody2D


export (float) var speed

var velocity := Vector2()


func _ready():
	$AnimationPlayer.set_active(false)


func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		velocity = Vector2(speed, 0.0)
		$AnimationPlayer.set_active(true)
	else:
		velocity = Vector2(0, 0)
		$AnimationPlayer.set_active(false)
	
	velocity = move_and_slide(velocity)
