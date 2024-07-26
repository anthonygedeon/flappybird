extends Node

var pipes = []
var pipe: PackedScene = preload("res://pipe_pair.tscn")

var gap: int

func spawn(gap_distance: int) -> void:
	var new_pipe = pipe.instantiate()
	new_pipe.position.x = gap_distance
	new_pipe.position.y = randi_range(150, 450)
	pipes.append(new_pipe)
	add_child(new_pipe)

func _on_main_next_pipe(distance):
	gap = distance
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	spawn(gap)
	gap += 370

func _on_player_bird_collide():
	if !pipes.is_empty():
		for pipe in pipes:
			if pipe != null:
				pipe.get_node("TopPipe/CollisionShape2D").disabled = true
				pipe.get_node("BottomPipe/CollisionShape2D").disabled = true
