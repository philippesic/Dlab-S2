extends Node2D



func _on_Area2D_area_entered(area):
	$BerryGet.play()
	yield(get_tree().create_timer(0.7), "timeout")
	queue_free()
