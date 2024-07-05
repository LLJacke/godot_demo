extends Node

@export var init_damage = 40
@export var init_shoot_speed = 100
@export var init_move_speed = 200
@export var init_hp = 1000

var score = 0

@onready var damage = init_damage
@onready var shoot_speed = init_shoot_speed
@onready var move_speed = init_move_speed
@onready var hp = init_hp

func reset_data():
	damage = init_damage
	shoot_speed = init_shoot_speed
	move_speed = init_move_speed
	hp = init_hp
	score = 0
