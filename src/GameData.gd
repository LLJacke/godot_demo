extends Node

signal add_score
signal change_hp
signal show_buffs

var level_list = [
	200, 500, 1000, 2000
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
	if score >= level_liswt[player_level-1]:
		player_level += 1
		emit_signal("show_buffs")
