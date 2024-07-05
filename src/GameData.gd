extends Node

signal add_score
signal change_hp
signal show_buffs
signal enemy_destroy
signal game_win


var level_list = [
	100, 300, 600, 1000, 1500, 
	2200, 3400, 5000, 7000, 10000
]
var player_level = 0

func send_add_score(add):
	emit_signal("add_score", add)

func send_change_hp(add):
	emit_signal("change_hp", add)

func send_destroy_enemy(enemy):
	emit_signal("enemy_destroy", enemy)

func send_game_win():
	emit_signal("game_win")

func check_score(score):
	if player_level >= level_list.size(): return
	if score >= level_list[player_level]:
		player_level += 1
		emit_signal("show_buffs")

func reset_data():
	player_level = 0
