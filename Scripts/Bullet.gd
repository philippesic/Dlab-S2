extends KinematicBody2D

var velocity
var speed = 1200

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)