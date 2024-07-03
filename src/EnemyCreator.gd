extends Node2D

const ENEMY_VELOCITY = 30
const ENEMY_SCENE = preload("res://resource/enemy/enemy.tscn")
const PLAYER_SCENE = preload("res://resource/player/player.tscn")

var enemy_list = []

@onready var timer := $Cooldown as Timer
@onready var screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not timer.is_stopped():
		return false
	create_enemy()


func create_enemy():
	var enemy := ENEMY_SCENE.instantiate() as Enemy
	enemy.global_position = global_position
	enemy.global_position.y = randf_range(100, screen_size.y - 30)
	#enemy.linear_velocity = Vector2(-1 * ENEMY_VELOCITY, 0.0)

	enemy.set_as_top_level(true)
	get_parent().add_child(enemy)
	
	
	#var player := PLAYER_SCENE.instantiate() as Player
	#player.global_position = global_position
	#player.global_position.y = randf_range(0, screen_size.y)
	##enemy.linear_velocity = Vector2(-1 * ENEMY_VELOCITY, 0.0)
#
	#player.set_as_top_level(true)
	#get_parent().add_child(player)
	
	timer.start()
