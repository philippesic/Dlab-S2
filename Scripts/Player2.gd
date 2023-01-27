extends KinematicBody2D

var direction = Vector2(0, 0)
var speed = 120

func _ready():
	$AnimationPlayer.play("idle")
	
func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		direction = Vector2(0, 80)
		$AnimationPlayer.play("moveDown")
		
	if Input.is_action_just_pressed("up"):
		direction = Vector2(0, -80)
		$AnimationPlayer.play("moveUp")
	
	if Input.is_action_just_pressed("left"):
		direction = Vector2(-80, 0)
		$AnimationPlayer.play("moveLeft")
		
	if Input.is_action_just_pressed("right"):
		direction = Vector2(80, 0)
		$AnimationPlayer.play("moveRight")
		
	move_and_slide(direction * speed * delta)
