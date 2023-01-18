extends KinematicBody2D

#Galaga Player

onready var bullet = preload("res://Scenes/Bullet.tscn")
var shot

signal onShoot

onready var ammo = 20

const SPEED = 210
const ACCELERATION = 99999
const FRICTION = 99999


enum {
	MOVE,
	DEAD,
	STILL
}

var state
var velocity = Vector2.ZERO

func _ready():
	state = MOVE

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		DEAD:
			velocity = Vector2.ZERO
		
		STILL:
			velocity = Vector2.ZERO
			
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	if Input.is_action_just_pressed("lmb"):
		if ammo > 0:
			shoot()
			emit_signal("onShoot")

	velocity = move_and_slide(velocity)
	
func shoot():
	shot = bullet.instance()
	get_parent().add_child(shot)
	shot.position = $BulletSpawn.global_position
	shot.velocity = $Target.global_position - shot.position
	ammo -= 1


func _on_Area2D_area_entered(_area):
	state = DEAD


func _on_DeathArea_area_entered(_area):
	state = DEAD

func _on_Level1_updateAmmo():
	ammo += 4
