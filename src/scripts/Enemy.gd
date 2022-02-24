extends Area2D

var velocity = Vector2()

const SPEED = 1

func _physics_process(delta):
	position.x -= SPEED


func _on_Enemy_body_entered(body):
		
	if body.name == "Jumper":
		body.die()
		queue_free()
		get_tree().change_scene("res://src/scenes/GameOverScreen.tscn")
