extends Node2D

func _ready():
	$Label.visible = false

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Sprite.visible = false
		$Sprite2.visible = false
		$Sprite3.visible = false
		$Label.visible = true
		yield(get_tree().create_timer(5), "timeout")
		get_tree().change_scene("res://Scenes/Level1.tscn")
