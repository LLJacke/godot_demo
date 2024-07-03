extends Node

signal add_score

var player_score = 0
var player_hp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func send_add_score(add):
	player_score += add
	emit_signal("add_score", add)

func _on_add_hp(add):
	player_hp += add
