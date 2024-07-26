extends Camera2D

@export var decay = 0.8
@export var trauma = 0
@export var trauma_power = 2
@export var max_angle: float = 0.1
@export var max_offset: Vector2 = Vector2(50, 50)
@export var target: NodePath 

func _ready():
	randomize()

func _process(delta):
	if target:
		global_position = get_node(target).global_position
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_angle * amount * randf_range(-1, 1)
	offset.x = max_offset.x * amount * randf_range(-1, 1)
	offset.y = max_offset.y * amount * randf_range(-1, 1)

func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)
