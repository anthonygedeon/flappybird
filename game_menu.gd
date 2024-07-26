extends CanvasLayer

const GAME_SCENE = "res://main.tscn"

const SPEED = -200

var time: float = 0.0

@export var amplitude: float = 1.0
@export var frequency: float = 1.0

func _ready() -> void:
	$Bird/AnimatedSprite2D.play()
	SaveScore.create_save_file()

func _process(delta: float) -> void:
	time += delta
	($Bird as Node2D).position.y += sin(2 * PI * frequency * time) * amplitude
	$Foreground/ParallaxLayer.motion_offset += Vector2(SPEED, 0) * delta

	
func _on_start_button_pressed():
	SceneManager.change_scene(GAME_SCENE)
