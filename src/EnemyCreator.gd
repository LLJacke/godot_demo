extends Node2D

const ENEMY_VELOCITY = 30
const ENEMY_SCENE = preload("res://resource/enemy/slime/slime.tscn")
const ENEMY_SCENE_2 = preload("res://resource/enemy/robot/robot.tscn")
const ENEMY_SCENE_3 = preload("res://resource/enemy/goblin/scout.tscn")
const PLAYER_SCENE = preload("res://resource/player/player.tscn")

var enemy_list = []

@onready var timer := $Cooldown as Timer
@onready var timer2 := $LevelUpTimer as Timer
@onready var end_timer := $EndTimer as Timer
@onready var screen_size = get_viewport_rect().size

func _ready():
	GameData.connect("enemy_destroy", _on_enemy_destroy)

func _process(_delta):
	if end_timer.is_stopped():
		timer.stop()
		if enemy_list.is_empty():
			GameData.send_game_win()
	else:
		if not timer.is_stopped():
			return false
		create_enemy()
		
		if timer2.is_stopped():
			timer.wait_time = 0.7
		timer.start()
	

func create_enemy():
	var clazz = ENEMY_SCENE
	if randf() < 0.2:
		clazz = ENEMY_SCENE_3
	var enemy = clazz.instantiate() as EnemyBase
	enemy.global_position = global_position
	enemy.global_position.y = randf_range(100, screen_size.y - 30)
	#enemy.linear_velocity = Vector2(-1 * ENEMY_VELOCITY, 0.0)
	enemy_list.append(enemy)

	#enemy.set_as_top_level(true)
	get_parent().add_child(enemy)
	
	
	#var player := PLAYER_SCENE.instantiate() as Player
	#player.global_position = global_position
	#player.global_position.y = randf_range(0, screen_size.y)
	##enemy.linear_velocity = Vector2(-1 * ENEMY_VELOCITY, 0.0)
#
	#player.set_as_top_level(true)
	#get_parent().add_child(player)
	

func _on_enemy_destroy(enemy):
	enemy_list.erase(enemy)
