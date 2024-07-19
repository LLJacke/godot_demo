extends WeaponBase

func gain_buff(tp):
	if tp == BuffManager.BUFF_TYPE.MAIN_ADD_DAMAGE:
		_damage *= 1.5
	elif tp == BuffManager.BUFF_TYPE.MAIN_SHOOT_FAST:
		set_shoot_speed(_speed * 1.5)
	elif tp == BuffManager.BUFF_TYPE.MAIN_ADD_BULLET_HIT:
		_hit_count += 1
		print()
