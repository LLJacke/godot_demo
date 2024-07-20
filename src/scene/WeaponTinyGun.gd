extends WeaponBase


func gain_buff(tp):
	if tp == BuffManager.BUFF_TYPE.TINY_GUN_ADD_DAMAGE:
		_damage *= 1.5
	elif tp == BuffManager.BUFF_TYPE.TINY_GUN_SHOOT_FAST:
		set_shoot_speed(_speed * 1.5)
	elif tp == BuffManager.BUFF_TYPE.TINY_GUN_ADD_HIT:
		_hit_count += 1
