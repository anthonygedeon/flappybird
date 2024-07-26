extends CharacterBody2D

signal bird_collide
signal on_player_ready

var gravity = 1500

const FALL_ANGLE = deg_to_rad(90)
const FLAP_ANGLE = deg_to_rad(-35)
const FALLING_SPEED = 5.5

var is_dead = false
var one_time_touch = true

func start(target: Vector2) -> void:
	position = target
	
func die() -> void:
	$AnimatedSprite2D.stop()
	$HitSFX.play()
	is_dead = true
	bird_collide.emit()

func _ready():
	var bird_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(bird_types[randi() % bird_types.size()])

func _physics_process(delta):
	var collision: KinematicCollision2D  = move_and_collide(velocity * delta)
	if !is_dead:
		if collision:
			die()
		if Input.is_action_just_pressed("move_up"):
			if one_time_touch:
				on_player_ready.emit()
				one_time_touch = false
			rotation = FLAP_ANGLE
			velocity.y = -400 
			$FlapSFX.play()
			$AnimatedSprite2D.speed_scale = 2.0
	
	if !one_time_touch:
		velocity.y += gravity * delta
		if velocity.y > 0:
			rotation = rotate_toward(rotation, FALL_ANGLE, FALLING_SPEED * delta)
			$AnimatedSprite2D.speed_scale = 1.0
