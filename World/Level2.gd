extends Spatial



func _on_House_body_entered(body):
	$LevelCompleted.popup_centered()
	$LevelCompleted.show_button()
