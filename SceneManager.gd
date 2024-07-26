extends CanvasLayer

@onready var rect = $ColorRect
@onready var sfx: AudioStreamPlayer = $AudioStreamPlayer
@onready var transition_animation: AnimationPlayer = $Transition

func _ready() -> void:
	layer = 2
	transition_animation.speed_scale = 2
	rect.hide()

func change_scene(scene_path) -> void:
	# play animation
	sfx.play()
	rect.show()
	transition_animation.play("fade_in")
	await transition_animation.animation_finished

	get_tree().change_scene_to_file(scene_path)
	
	transition_animation.play_backwards("fade_in")
	await transition_animation.animation_finished
	rect.hide()
