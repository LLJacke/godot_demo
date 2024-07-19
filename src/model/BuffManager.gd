extends Node


var cur_buff = {}
# var left_buff = {}
var max_buff_count = 3

const buff_data = preload("res://src/data/buff_data.gd")

const BUFF_TYPE = buff_data.BUFF_TYPE
const BUFF_DATA = buff_data.BUFF_DATA

func _ready():
	for tp in BUFF_TYPE:
		cur_buff[BUFF_TYPE[tp]] = 0
	
	EventManager.add_event("reset_game", reset_data)

func get_buff_list(num : int):
	var enable_buffs = []
	for tp in BUFF_DATA:
		var d : Dictionary = BUFF_DATA[tp]
		if d.count - cur_buff[tp] > 0:			# buff剩余数量大于0
			var enable = true
			if d.has("precondition") and d.precondition.size() > 0:		# 前置buff存在
				for pt in d.precondition:
					if cur_buff[pt] <= 0:
						enable = false
						break
			if enable:
				enable_buffs.append(tp)


	num = min(num, enable_buffs.size())
	
	var res = []
	for i in num:
		var b = random_buff(enable_buffs, res)
		if b != null:
			res.append(b)
	
	return res

# 从当前剩余buff中随机一个buff，带加权运算
func random_buff(enable_list : Array, exclude_list : Array):
	var sum_weight = 0
	for tp in enable_list:
		if not exclude_list.has(tp):		# 判断不在排除列表
			var ct = BUFF_DATA[tp].count - cur_buff[tp]
			for i in ct:
				sum_weight += BUFF_DATA[tp].weight
	
	if sum_weight <= 0: return null
	var rand_num = randi() % sum_weight
	
	for tp in enable_list:
		if not exclude_list.has(tp):		# 判断不在排除列表
			var ct = BUFF_DATA[tp].count - cur_buff[tp]
			for i in ct:
				rand_num -= BUFF_DATA[tp].weight
				if rand_num < 0:
					return tp
	
	return null

func get_buff_txt(buff):
	return BUFF_DATA[buff].txt

func gain_buff(buff):
	if not BUFF_TYPE.find_key(buff): return false
	cur_buff[buff] += 1		# 扣除剩余buff个数
	
	if buff == BUFF_TYPE.MAIN_SHOOT_FAST:
		EventManager.send_event("add_buff", buff)
	elif buff == BUFF_TYPE.MAIN_ADD_DAMAGE:
		EventManager.send_event("add_buff", buff)
	elif buff == BUFF_TYPE.ADD_HP:
		PlayerInfo.hp += 500
	elif buff == BUFF_TYPE.MOVE_FAST:
		PlayerInfo.move_speed += 50
	elif buff == BUFF_TYPE.MAIN_ADD_BULLET_HIT:
		EventManager.send_event("add_buff", buff)
	elif buff == BUFF_TYPE.ADD_TINY_GUN:
		EventManager.send_event("add_weapon", "tiny_gun")

func reset_data():
	for tp in cur_buff:
		cur_buff[tp] = 0
