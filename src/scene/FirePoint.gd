class_name FirePoint extends Marker2D

var _timer : Timer
var _speed = 100

@export var bullet_scene : PackedScene

func _ready():
	_timer = Timer.new()
	_timer.wait_time = 1
	_timer.one_shot = true
	_timer.timeout.connect(shoot)
	add_child(_timer)


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
	var bullet := bullet_scene.instantiate() as Bullet
	bullet.global_position = global_position
	bullet.direction = direction
	bullet.set_as_top_level(true)
	add_child(bullet)

	_timer.start()
	return true
