extends Node

var seq_config = [
	{
		during = 20,
		list = {
			slime = 10,
			goblin_scout = 5
		}
	},
	{
		during = 60,
		list = {
			slime = 120,
			goblin_scout = 50
		}
	},
	{
		during = 100,
		list = {
			slime = 200,
			goblin_scout = 200
		}
	},
]

const ENEMY_SCENE = {
	slime = preload("res://resource/enemy/slime/slime.tscn"),
	robot = preload("res://resource/enemy/robot/robot.tscn"),
	goblin_scout = preload("res://resource/enemy/goblin/scout.tscn"),
}

var enemy_seq = []

func _ready():
	create_random_seq()

func create_random_seq():
	enemy_seq = []
	var base_time = 0
	for config in seq_config:
		var seq = []
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
