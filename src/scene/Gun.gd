class_name Gun extends Marker2D

@onready var timer := $Cooldown as Timer

@export var bullet_scene : Resource


# direction应指代方向，为单位向量
func shoot(direction: Vector2 = Vector2(1,0)) -> bool:
	if not timer.is_stopped():
		return false
	var bullet := bullet_scene.instantiate() as Bullet
	bullet.global_position = global_position
	bullet.direction = direction

	bullet.set_as_top_level(true)
	add_child(bullet)
	#sound_shoot.play()
	timer.wait_time = 100.0 / PlayerInfo.shoot_speed
	timer.start()
	return true
