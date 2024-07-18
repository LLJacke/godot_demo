class_name WeaponBase extends Node2D

var _timer : Timer
var _speed = 100
var _damage = 30
var _hit_count = 1
var _fire_point : Marker2D

@export var bullet_scene : PackedScene

func _ready():
	_timer = Timer.new()
	_timer.wait_time = 1
	_timer.one_shot = true
	_timer.timeout.connect(shoot)
	add_child(_timer)
	
	_fire_point = find_child("FirePoint")
	assert(_fire_point, "FirePoint is not exist.")
	
	EventManager.add_event("add_buff", gain_buff)


func set_shoot_speed(speed):
	if speed and speed > 0:
		_speed = speed
		_timer.wait_time = 100.0/speed

func fire():
	_timer.start()

# direction应指代方向，为单位向量
func shoot(direction: Vector2 = Vector2(1,0)) -> bool:
	if not _timer.is_stopped():
		return false
	
	var bullet := bullet_scene.instantiate() as BulletBase
	bullet.global_position = _fire_point.global_position
	bullet.direction = direction
	bullet.damage = _damage
	bullet.hit_count = _hit_count
	bullet.set_as_top_level(true)
	add_child(bullet)

	_timer.start()
	return true


func set_damage(dam):
	_damage = dam


func gain_buff(_tp):
	pass
