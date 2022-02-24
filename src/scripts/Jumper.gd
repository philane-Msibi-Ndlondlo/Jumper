extends KinematicBody2D

var velocity  = Vector2(0,0)

var SPEED = 300
var GRAVITY = 40
var JUMP_SPEED = -1200
var coin_count = 0

onready var Bullet = preload("res://src/scenes/Bullet.tscn")
var bullet

func _physics_process(delta):
	
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
	
	if Input.is_action_just_pressed("s"):
		print("Shoot")
		bullet = Bullet.instance()
		bullet.global_position = position
		get_parent().add_child(bullet)

	velocity.y = velocity.y + GRAVITY
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.3)


func increment_coin_count():
	coin_count = coin_count + 1
	$CanvasLayer/Panel/Label2.text = str(coin_count)
	print(coin_count)
	
func die():
	queue_free()
	get_tree().change_scene("res://src/scenes/GameOverScreen.tscn")
