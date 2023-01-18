extends KinematicBody2D

var velocity
var speed = 600

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)


func _on_Area2D_area_entered(_area):
	queue_free()
