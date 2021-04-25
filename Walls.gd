extends ParallaxBackground

export (float) var scrolling_speed = 200.0

func _process(delta):
	scroll_offset.y -= scrolling_speed * delta
