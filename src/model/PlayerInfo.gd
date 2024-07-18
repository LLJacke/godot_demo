extends Node

var init_damage = 30				# 子弹伤害
var init_shoot_speed = 100			# 射速
var init_move_speed = 200			# 玩家移动速度
var init_hp = 1000					# 玩家血量
var init_bullet_max_hit = 1			# 子弹穿透次数

var score = 1000

@onready var damage = init_damage
@onready var shoot_speed = init_shoot_speed
@onready var move_speed = init_move_speed
@onready var hp = init_hp
@onready var bullet_max_hit = init_bullet_max_hit

func _ready():
	EventManager.add_event("reset_game", reset_data)

func reset_data():
	damage = init_damage
	shoot_speed = init_shoot_speed
	move_speed = init_move_speed
	hp = init_hp
	bullet_max_hit = init_bullet_max_hit
	
	score = 0
