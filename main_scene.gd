extends Node2D

@export var player_pos_x = 100
@export var player_pos_y = 200

var mudarc = 0

func _ready():
	_iniciar_player()

func _iniciar_player():
	var player = $Player
	if player:
		player.position = Vector2(100, 580)

func _process(delta):
	if Global.apertou == 1 and Global.interagir == 1:
		interacao_estatua()
	controlar_fala()

func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.interagir = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	Global.interagir = 0

func interacao_estatua():
	Global.apertou = 0
	$Inicio.position.y = 2000
	$Iara.position.y = 2000
	$Norte.position.y = 0
	$Ribeirinho.position.y = 410
	$Player.position = Vector2(100, 580)

func _on_timer_timeout() -> void:
	$Control/Label.hide()
	$Control/Label2.show()
	$Control/Timer2.start()

func _on_timer_2_timeout() -> void:
	$Control/Label2.hide()

func _on_ribeirinho_body_entered(body: Node2D) -> void:
	$Control/Label.show()
	$Control/Timer.start()

func controlar_fala():
	$Control/Label.position.x = $Ribeirinho.position.x - 35
	$Control/Label.position.y = $Ribeirinho.position.y - 60
	$Control/Label2.position.x = $Player.position.x - 30
	$Control/Label2.position.y = $Player.position.y - 60
