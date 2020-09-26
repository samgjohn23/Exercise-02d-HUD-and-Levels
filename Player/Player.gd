extends KinematicBody2D

export var speed = 10


func _physics_process(delta):
	position += get_input()*speed
	if Input.is_action_pressed("shoot") and not $Laser.is_casting:
		$Laser.fire(get_viewport().get_mouse_position())
	elif $Laser.is_casting:
		$Laser.stop()
	


func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	return input_dir.rotated(rotation)


func _on_Damage_body_entered(body):
	body.die()
