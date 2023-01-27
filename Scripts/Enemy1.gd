extends KinematicBody2D


var turn1 = false
var turn2 = false
var direction = Vector2(0,0)
var speed = 120

func _ready():
	$Sprite.visible = true
	$glitchSprite.visible = false

func _physics_process(delta):
		
	if turn2 == true:
		while true:
			direction = Vector2(-80, 0)
			move_and_slide(direction * speed * delta)
			yield(get_tree().create_timer(0.1), "timeout")
			direction = Vector2(80, 0)
			move_and_slide(direction * speed * delta)
			yield(get_tree().create_timer(0.1), "timeout")
	else:
		if turn1 == true:
			direction = Vector2(-80, 0)
		else:
			direction = Vector2(0, -80) 
			
	move_and_slide(direction * speed * delta)


func _on_Turn1_area_entered(area):
	turn1 = true


func _on_Turn2_area_entered(area):
	turn2 = true
	yield(get_tree().create_timer(0.4), "timeout")
	$Sprite.visible = false
	$glitchSprite.visible = true
