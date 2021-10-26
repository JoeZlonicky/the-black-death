extends KinematicBody2D


export (float) var speed
export (float) var jump_force
export (float) var gravity
export (float) var terminal_velocity

var velocity := Vector2()


func _physics_process(delta):
	if is_on_floor():
		if Input.is_action_pressed("move_right"):
			velocity = Vector2(speed, -jump_force)
		else:
			velocity = Vector2(0, 0)
	
	velocity.y = min(velocity.y + gravity * delta, terminal_velocity)
	move_and_slide(velocity, Vector2.UP)
	
