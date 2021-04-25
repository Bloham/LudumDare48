extends StaticBody2D

export var min_speed = 200.0
export var max_speed = 250.0

func _process(delta):
	var direction = Vector2.ZERO
	direction.y -= 1
	position += direction * min_speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
