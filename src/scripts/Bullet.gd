extends Area2D

const SPEED = 10

func _physics_process(delta):
	
	position.x += SPEED

func _on_Bullet_body_entered(body):
	pass
