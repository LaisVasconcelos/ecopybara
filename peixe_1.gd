extends CharacterBody2D


const speed = 100
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE, 
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position
	
func _process(delta: float) -> void:
	if current_state == 0  or current_state == 1:
		$AnimatedSprite2D.play("l1")

			
	elif current_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("l1")
		if dir.x == 1:
			$AnimatedSprite2D.play("l2")
			
#	if is_roaming:
#		match current_state:
#			IDLE:
		#		pass
#			NEW_DIR:
#				dir = choose([Vector2.RIGHT,Vector2.LEFT])
#			MOVE:
#				move(delta)
				
				

#func choose(array):
#	array.shuffle()
	
#	return array.front()

#func move(delta):
#	if !is_chatting:
#		position += dir * speed * delta
		# Verifica e corrige a posição no eixo X
#		if position.x < 1117:
	#		position.x = 1117
#		elif position.x > 1700:
	#		position.x = 1700
			
#		if position.y > 668:
#			position.y = 668		


func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.has_method("Player"):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
		if body.has_method("Player"):
			player = body
			player_in_chat_zone = false
			



#func _on_timer_timeout() -> void:
#	$Timer.wait_time = choose([0.5,1,1.5])
#	current_state = choose([IDLE, NEW_DIR, MOVE])
