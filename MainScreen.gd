extends CanvasLayer

var info = 0

func _ready():
	pass

func _on_Iniciar_pressed():
	get_tree().change_scene_to_file("res://MainScene.tscn")

func _on_Info_pressed():
	if info == 0:
		$Info2.show()
		info = 1
	else:
		$Info2.hide()
		info = 0
