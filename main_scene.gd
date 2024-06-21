extends Node2D

@onready var player := $Player
@onready var enemy_creator := $EnemyCreator

@export var shoot_radius = 400

var circle_shape := CircleShape2D.new()

func _ready():
	player.position = Vector2(50, get_viewport_rect().size.y/2)
	enemy_creator.position = Vector2(get_viewport_rect().size.x - 50, get_viewport_rect().size.y/2)

func _process(delta):
	var arr = get_shoot_node(shoot_radius)
	#if arr.size() > 0:
		#var dist = 9999999
		#var target_enemy
		#for ene in arr:
			#var pos = ene.collider.global_position
			#if pos.distance_to(global_position) < dist:
				#dist = pos.distance_to(global_position)
				#target_enemy = ene.collider
		#player.gun.shoot((target_enemy.global_position - player.global_position).normalized())

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
