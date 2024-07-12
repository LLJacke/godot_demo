extends Node2D

@onready var player := $Player
@onready var enemy_creator := $EnemyCreator
@onready var attack_area := $AttackArea
@onready var choose_buff := $ChooseBuff

@export var shoot_radius = 400

var circle_shape := CircleShape2D.new()

func _ready():
	GameData.connect("show_buffs", _on_show_buffs)
	
	player.position = Vector2(50, get_viewport_rect().size.y/2)
	enemy_creator.position = Vector2(get_viewport_rect().size.x - 50, get_viewport_rect().size.y/2)


func get_shoot_node(radius):
	circle_shape.radius = radius
	
	var p = PhysicsShapeQueryParameters2D.new()
	p.shape = circle_shape
	p.collide_with_bodies = true
	p.exclude = [player.get_rid()]
	p.collision_mask = 1
	p.transform = Transform2D(0, player.global_position)
	
	var arr = get_world_2d().direct_space_state.intersect_shape(p)
	return arr


func _on_show_buffs():
	get_tree().paused = true
	choose_buff.update_buffs()
	choose_buff.visible = true
