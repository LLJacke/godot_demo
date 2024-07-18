extends Node

enum BUFF_TYPE {
	SHOOT_FAST,
	ADD_DAMAGE,
	ADD_HP,
	MOVE_FAST,
	ADD_BULLET_HIT,
	ADD_TINY_GUN,
}

const BUFF_TEXT = {
	SHOOT_FAST = '射的快',
	ADD_DAMAGE = '加伤害',
	ADD_HP = 'HP+200',
	MOVE_FAST = '跑得快',
	ADD_BULLET_HIT = '子弹穿透+1',
	ADD_TINY_GUN = '添加副武器\n小枪'
}

const BUFF_COUNT = {
	SHOOT_FAST = 5,
	ADD_DAMAGE = 6,
	ADD_HP = 10,
	MOVE_FAST = 5,
	ADD_BULLET_HIT = 3,
	ADD_TINY_GUN = 2,
}

const BUFF_WEIGHT = {
	SHOOT_FAST = 10,
	ADD_DAMAGE = 10,
	ADD_HP = 20,
	MOVE_FAST = 10,
	ADD_BULLET_HIT = 5,
	ADD_TINY_GUN = 50,
}

var left_buff = {}
var max_buff_count = 3

func _ready():
	left_buff = BUFF_COUNT.duplicate()
	
	EventManager.add_event("reset_game", reset_data)

func get_buff_list(num):
	num = min(num, BUFF_TYPE.size())
	
	var res = []
	for i in num:
		var b = random_buff(res)
		if b != null:
			res.append(b)
	
	return res

# 从当前剩余buff中随机一个buff，带加权运算
func random_buff(exclude_list : Array):
	var sum_weight = 0
	for item in left_buff:
		if not exclude_list.has(item):		# 判断不在排除列表
			for i in left_buff[item]:
				sum_weight += BUFF_WEIGHT[item]
	
	if sum_weight <= 0: return null
	var rand_num = randi() % sum_weight
	
	for item in left_buff:
		if not exclude_list.has(item):		# 判断不在排除列表
			for i in left_buff[item]:
				rand_num -= BUFF_WEIGHT[item]
				if rand_num < 0:
					return item
	
	return null

func get_buff_txt(buff):
	return BUFF_TEXT[buff]

func gain_buff(buff):
	if not BUFF_TYPE.has(buff): return false
	left_buff[buff] -= 1		# 扣除剩余buff个数
	buff = BUFF_TYPE[buff]
	
	if buff == BUFF_TYPE.SHOOT_FAST:
		PlayerInfo.shoot_speed += 35
	elif buff == BUFF_TYPE.ADD_DAMAGE:
		PlayerInfo.damage += 30
	elif buff == BUFF_TYPE.ADD_HP:
		PlayerInfo.hp += 200
	elif buff == BUFF_TYPE.MOVE_FAST:
		PlayerInfo.move_speed += 50
	elif buff == BUFF_TYPE.ADD_BULLET_HIT:
		PlayerInfo.bullet_max_hit += 1
	elif buff == BUFF_TYPE.ADD_TINY_GUN:
		EventManager.send_event("add_weapon", "tiny_gun")

func reset_data():
	left_buff = BUFF_COUNT.duplicate()
