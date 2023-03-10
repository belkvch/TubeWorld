extends Area2D

signal hit

export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func start(pos):
	position = pos
	show()
	$AnimatedSprite.play("down"+String(Game.PlayerSelect))
	$CollisionShape2D.disabled = false

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"+String(Game.PlayerSelect)
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down"+String(Game.PlayerSelect)
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"+String(Game.PlayerSelect)

func _on_Player_body_entered(body):
	hide() 
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
