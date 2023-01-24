extends Node2D

func _ready():
	$Crash1.visible = false
	$Crash2.visible = true
	yield(get_tree().create_timer(6), "timeout")
	$Crash1.visible = true
	$Crash2.visible = false
