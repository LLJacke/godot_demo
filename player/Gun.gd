class_name Gun extends Marker2D
## Represents a weapon that spawns and shoots bullets.
## The Cooldown timer controls the cooldown duration between shots.


const BULLET_SCENE = preload("res://player/bullet.tscn")

#@onready var sound_shoot := $Shoot as AudioStreamPlayer2D
@onready var timer := $Cooldown as Timer

@export var bullet_velocity := 500


# direction应指代方向，为单位向量
func shoot(direction: Vector2 = Vector2(1,0)) -> bool:
	if not timer.is_stopped():
		return false
	var bullet := BULLET_SCENE.instantiate() as Bullet
	bullet.global_position = global_position
	bullet.linear_velocity = direction * bullet_velocity

	bullet.set_as_top_level(true)
	add_child(bullet)
	#sound_shoot.play()
	timer.start()
	return true
