extends KinematicBody2D

var speed = 100

var health = 3

signal enemyKilled

func _physics_process(delta):
	var velocity = Vector2(0, 1)
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)



func _on_Area2D_area_entered(_area):
	health -= 1
	if health == 0:
		emit_signal("enemyKilled")
		queue_free()
