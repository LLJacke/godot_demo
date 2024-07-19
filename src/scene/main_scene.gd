extends Node2D

@onready var player := $Player
@onready var enemy_creator := $EnemyCreator
@onready var attack_area := $AttackArea
@onready var choose_buff := $ChooseBuff

@export var shoot_radius = 400

var circle_shape := CircleShape2D.new()

func _ready():
	EventManager.add_event("show_buffs", _on_show_buffs)
	
	player.position = Vector2(50, get_viewport_rect().size.y/2)
	enemy_creator.position = Vector2(get_viewport_rect().size.x - 50, 0)

func _on_show_buffs():
	get_tree().paused = true
	choose_buff.update_buffs()
	choose_buff.visible = true
