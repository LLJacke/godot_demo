extends Node

enum BUFF_TYPE {
	SHOOT_FAST = 0,
	ADD_DAMAGE = 1,
	ADD_HP = 2,
	MOVE_FAST = 3,
	ADD_BULLET_HIT = 4,
}

const BUFF_TEXT = [
	'射的快',
	'加伤害',
	'加血',
	'跑得快',
	'子弹穿透+1'
]

func get_random_buffs(num):
	num = min(num, BUFF_TYPE.size())
	var list = BUFF_TYPE.values()
	list.shuffle()
	var res = []
	var i = 0
	for b in list:
		res.append(b)
		i += 1
		if i >= num: break
	return res

func get_buff_txt(buff):
	return BUFF_TEXT[buff]

func gain_buff(buff):
	if buff == BUFF_TYPE.SHOOT_FAST:
		PlayerInfo.shoot_speed += 20
	elif buff == BUFF_TYPE.ADD_DAMAGE:
		PlayerInfo.damage += 40
	elif buff == BUFF_TYPE.ADD_HP:
		PlayerInfo.hp += 200
	elif buff == BUFF_TYPE.MOVE_FAST:
		PlayerInfo.move_speed += 50
	elif buff == BUFF_TYPE.ADD_BULLET_HIT:
		PlayerInfo.bullet_max_hit += 1
