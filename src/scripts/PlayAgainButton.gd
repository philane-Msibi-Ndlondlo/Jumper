extends Button


func _ready():
	pass
	
func _pressed():
	get_tree().change_scene("res://src/scenes/Level1.tscn")
