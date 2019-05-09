extends Area2D

var velocity := Vector2(100, 0)
var jump_speed := 1000
var target : Area2D = null

func _unhandled_input(event):
	if target and event is InputEventScreenTouch and event.pressed:
		jump()

func jump():
	target = null
	velocity = transform.x * jump_speed

func _on_Jumper_area_entered(area):
	target = area
	velocity = Vector2.ZERO

func _process(delta):
	if target:
		transform = target.orbit_position.global_transform
	else:
		position += velocity * delta
