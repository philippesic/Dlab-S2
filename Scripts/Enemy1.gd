extends KinematicBody2D

var speed = 100

func _physics_process(delta):
	var velocity = Vector2(0, 1)
	velocity = velocity.normalized() * speed
# warning-ignore:return_value_discarded
	move_and_collide(velocity * delta)



func _on_Area2D_area_entered(_area):
	queue_free()
