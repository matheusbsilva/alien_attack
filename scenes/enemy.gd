extends Area2D

signal died
@export var speed = 600
@export var has_sin_movement = true
@export var amplitude = 10
@export var frequency = 0.011

func _physics_process(delta):
	global_position.x -= speed * delta
	
	if has_sin_movement:
		var y_movement = amplitude * sin(frequency * (-global_position.x))
		global_position.y += y_movement

func die():
	queue_free()
	emit_signal("died")

func _on_body_entered(body):
	body.take_damage()
	die()
