extends Node

var init_move_speed = 200			# 玩家移动速度
var init_hp = 1000					# 玩家血量

var score = 1000

@onready var move_speed = init_move_speed
@onready var hp = init_hp

func _ready():
	EventManager.add_event("reset_game", reset_data)

func reset_data():
	move_speed = init_move_speed
	hp = init_hp
	
	score = 0
