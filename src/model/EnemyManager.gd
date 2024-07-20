extends Node

const config_file = preload("res://src/data/enemy_create_config.gd")

var SEQ_CONFIG = config_file.NORMAL_CONFIG_1

const ENEMY_SCENE = {
	slime = preload("res://resource/enemy/slime/slime.tscn"),
	robot = preload("res://resource/enemy/robot/robot.tscn"),
	goblin_scout = preload("res://resource/enemy/goblin/scout.tscn"),
}

var enemy_seq = []

func _ready():
	create_random_seq()

# 根据配置随机创建enemy生成时间序列
func create_random_seq():
	enemy_seq = []
	var base_time = 0
	for config : Dictionary in SEQ_CONFIG:
		var seq = []
		if config.has("list"):
			for en in config.list:
				for i in config.list[en]:
					seq.append({tp = en, time = base_time + randf_range(0, config.during)})
			seq.sort_custom(func (a, b): if a.time < b.time: return true else: return false)

		enemy_seq.append_array(seq)
		base_time += config.during
		
func get_enemy_seq():
	return enemy_seq    

func get_enemy_scene(tp):
	return ENEMY_SCENE[tp]
