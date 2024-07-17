class_name Player extends CharacterBody2D

const WEAPON_SCENE = {
	TINY_GUN = preload("res://resource/player/tiny_gun.tscn"),
}


@export var action_suffix := ""
@export var shoot_radius = 400

@onready var sprite = $Sprite2D as Sprite2D
@onready var gun = sprite.get_node("Gun") as WeaponBase
@onready var weapons = [gun]
@onready var weapons_point = [get_node("weapon_1"), get_node("weapon_2")]

var circle_shape := CircleShape2D.new()

func _ready():
	gun.fire()
	get_tree().add_user_signal("add_weapon")
	get_tree().connect("add_weapon", add_weapon)

func _physics_process(_delta):
	var direction = Input.get_axis("move_left" + action_suffix, "move_right" + action_suffix) * PlayerInfo.move_speed
	if direction:
		velocity.y = direction
	else:
		velocity.y = move_toward(velocity.y, 0, PlayerInfo.move_speed)

	move_and_slide()
	
	#if Input.is_action_just_pressed("shoot" + action_suffix):
		#gun.shoot(sprite.scale.x)
	
func add_weapon(wp_type):
	if wp_type == 'tiny_gun':
		if weapons.size()-1 < weapons.size():
			var new_wp = WEAPON_SCENE.TINY_GUN.instantiate()
			weapons_point[weapons.size()-1].add_child(new_wp)
			weapons.append(new_wp)
			new_wp.set_shoot_speed(80)
			new_wp.fire()

#func _process(delta):
	#var arr = get_shoot_node(shoot_radius)
	#if arr.size() > 0:
		#var dist = 9999999
		#var target_enemy
		#for ene in arr:
			#var pos = ene.collider.global_position
			#if pos.distance_to(global_position) < dist:
				#dist = pos.distance_to(global_position)
				#target_enemy = ene.collider
		#gun.shoot((target_enemy.global_position - global_position).normalized())

# func get_shoot_node(radius):
# 	circle_shape.radius = radius
	
# 	var p = PhysicsShapeQueryParameters2D.new()
# 	p.shape = circle_shape
# 	p.collide_with_bodies = true
# 	p.exclude = [get_rid()]
# 	p.collision_mask = 3
# 	p.transform = Transform2D(0, global_position)
	
# 	var arr = get_world_2d().direct_space_state.intersect_shape(p)
# 	return arr
