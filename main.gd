extends Node

signal next_pipe(distance: int)

@export var camera_speed: int = 400

var score = 0

var day_bg = load("res://assets/sprites/background_day.png") 
var night_bg = load("res://assets/sprites/background_night.png")

func _ready():
	$Flash/ColorRect.hide()
	var time = Time.get_time_dict_from_system()
	if time.hour >= 18:
		$Background/TextureRect.texture = night_bg
	else:
		$Background/TextureRect.texture = day_bg

	$Player.z_index = -2
	$Player.start($StartLocation.position)

func _process(delta):
	$Camera2D.position += Vector2.RIGHT * camera_speed * delta
	$Player.position += Vector2.RIGHT * camera_speed * delta
	
	if !$Player.is_dead:
		$ground_spawner.spawn()

func _on_player_on_player_ready():
	var start_pipe = $Player.position.x + (get_viewport().size.x * 2)
	next_pipe.emit(start_pipe)

func _on_player_bird_collide():
	$Camera2D.add_trauma(1)
	$Flash/ColorRect.show()
	$Flash/AnimationPlayer.play("flash")
	$HUD.show_game_over()
	$PipeSpawner/SpawnTimer.stop()
	camera_speed = 0
