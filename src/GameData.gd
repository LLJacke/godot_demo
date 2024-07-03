extends Node

signal add_score
signal change_hp


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
