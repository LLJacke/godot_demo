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

func _process(_delta):
	#var _arr = attack_area.get_enemy_in_area()
	#if arr.size() > 0:
		#var dist = 9999999
		#var target_enemy
		#for ene in arr:
			#var pos = ene.global_position
			#if pos.x - player.global_position.x < dist:
				#dist = pos.x - player.global_position.x
				#target_enemy = ene
		#player.gun.shoot((target_enemy.global_position - player.global_position).normalized())
	player.gun.shoot()

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
	choose_buff.set_buffs(BuffManager.get_random_buffs(3))
	choose_buff.visible = true
