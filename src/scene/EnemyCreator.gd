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

@onready var delay = 0
@onready var create_idx = 0
@onready var enemy_seq = EnemyManager.get_enemy_seq()

func _ready():
	EventManager.add_event("enemy_destroy", _on_enemy_destroy)
	EventManager.add_event("reset_game", _on_reset_data)


func _process(_delta):
	if end_timer.is_stopped():
		# timer.stop()
		if enemy_list.is_empty():
			EventManager.send_event("game_win")
	else:
		# if not timer.is_stopped():
		# 	return false
		delay += _delta
		while create_idx < enemy_seq.size():
			if enemy_seq[create_idx].time <= delay:
				create_enemy(enemy_seq[create_idx].tp)
				create_idx += 1
			else:
				break
		
		# if timer2.is_stopped():
		# 	timer.wait_time = 0.7
		# timer.start()
	

func create_enemy(tp):
	var scene = EnemyManager.get_enemy_scene(tp)
	if scene:
		var enemy = scene.instantiate() as EnemyBase
		enemy.global_position = global_position
		enemy.global_position.y = randf_range(100, screen_size.y - 30)
		#enemy.linear_velocity = Vector2(-1 * ENEMY_VELOCITY, 0.0)
		enemy_list.append(enemy)

		#enemy.set_as_top_level(true)
		get_parent().add_child(enemy)
	
	

func _on_enemy_destroy(enemy):
	enemy_list.erase(enemy)

func _on_reset_data():
	delay = 0
	create_idx = 0
	EnemyManager.create_random_seq()
	enemy_seq = EnemyManager.get_enemy_seq()
