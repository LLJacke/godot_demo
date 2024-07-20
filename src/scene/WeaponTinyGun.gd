extends WeaponBase

var max_damage = 500
var min_damage = 200
var max_range = 200
var min_range = 50

func gain_buff(tp):
	if tp == BuffManager.BUFF_TYPE.TINY_GUN_ADD_DAMAGE:
		_damage *= 1.5
	elif tp == BuffManager.BUFF_TYPE.TINY_GUN_SHOOT_FAST:
		set_shoot_speed(_speed * 1.5)
	elif tp == BuffManager.BUFF_TYPE.TINY_GUN_ADD_HIT:
		_hit_count += 1

func set_bullet_data(bullet):
	bullet.damage = _damage
	bullet.hit_count = _hit_count
	
