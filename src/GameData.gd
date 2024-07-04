extends Node

signal add_score
signal change_hp
signal show_buffs

var level_list = [
	100, 300, 600, 1000, 1500, 
	2200, 3400, 5000, 7000, 1000
]
var player_level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func send_add_score(add):
	emit_signal("add_score", add)

func send_change_hp(add):
	emit_signal("change_hp", add)

func check_score(score):
	if score >= level_list[player_level-1]:
		player_level += 1
		player_level = min(player_level, level_list.size())
		emit_signal("show_buffs")
