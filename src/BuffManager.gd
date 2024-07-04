extends Node

const buffs = [
	'buff1',
	'buff2',
	'buff3',
	'buff4',
	'buff5',
	'buff6',
	'buff7',
	'buff8',
	'buff9',
]

func get_random_buffs():
	var list = buffs.duplicate()
	list.shuffle()
	var res = []
	for i in range(3):
		res.append(list[i])
	return res
