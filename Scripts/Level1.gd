extends Node2D

var spawn_timer = 0
var spawn_interval = 1

signal updateAmmo

func _process(delta):
	spawn_timer += delta
	if spawn_timer > spawn_interval:
		spawn_timer = 0
		spawn_enemy()

func spawn_enemy():
	var enemy = load("res://Scenes/Enemy1.tscn").instance()
	add_child(enemy)
	enemy.position = Vector2(rand_range(0, get_viewport().size.x), 60)
	enemy.connect("enemyKilled", self, "_on_enemy_died")
	
func _on_enemy_died():
	emit_signal("updateAmmo")
