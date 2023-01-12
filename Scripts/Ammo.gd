extends Control


onready var label = get_node("AmmoLabel")

var ammo = 20
var ammoText

func _ready():
	ammoText = str(ammo)
	label.set_text("Ammo: " + ammoText)

func _on_Player1_onShoot():
	ammo -= 1
	ammoText = str(ammo)
	label.set_text("Ammo: " + ammoText)


func _on_Level1_updateAmmo():
	ammo += 2
	ammoText = str(ammo)
	label.set_text("Ammo: " + ammoText)
