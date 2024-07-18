extends Node

var level_list = [
	100, 300, 600, 1000, 1500, 
	2200, 3400, 5000, 7000, 10000
]
var player_level = 0


func check_score(score):
	if player_level >= level_list.size(): return
	if score >= level_list[player_level]:
		player_level += 1
		EventManager.send_event("show_buffs")

func reset_data():
	player_level = 0
	EventManager.send_event("reset_game")
