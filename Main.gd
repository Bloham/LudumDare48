extends Node

export (Array, PackedScene) var obstacle_scene
var score = 0

func new_game():
	score = 0
	$HUD.update_score(score)
	
	get_tree().call_group("obstacles", "queue_free")
	$Player.start($StartPosition.position)
	
	$StartTimer.start()
	$HUD.show_message("Get ready...")
	yield($StartTimer, "timeout")
	$SpawnTimer.wait_time = 1
	$SpawnTimer.start()
	

func game_over():
	$SpawnTimer.stop()
	$HUD.show_game_over()

func _on_SpawnTimer_timeout():
	var obstacle_spawn_location = $Spawner/SpawnLocation
	obstacle_spawn_location.unit_offset = randf()
	
	randomize()
	var random_obstacle = randi() % obstacle_scene.size()
	var obstacle = obstacle_scene[random_obstacle].instance()
	add_child(obstacle)
	
	obstacle.position = obstacle_spawn_location.position
	
	var velocity = Vector2(rand_range(obstacle.min_speed, obstacle.max_speed), 0)
	
	#score
	score += 1
	$HUD.update_score(score)
	
	#difficulty
	if $SpawnTimer.wait_time >= 0.4:
		$SpawnTimer.wait_time -= 0.01
