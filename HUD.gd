extends CanvasLayer

signal start_game

func update_score(score):
	$ScoreLable.text = str(score)


func show_message(text):
	$MessageLable.text = text
	$MessageLable.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLable.text = "Mr. Games Fall"
	$MessageLable.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Button.show()
	$Tutorial.show()

func _on_Button_pressed():
	$Button.hide()
	$MessageLable.hide()
	$Tutorial.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLable.hide()
