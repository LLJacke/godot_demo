extends Control

var player_score = 0

@export var player_hp = 200

@onready var lb_score = $lb_score as Label
@onready var lb_hp = $lb_player_hp as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.connect("add_score", _on_add_score)
	GameData.connect("change_hp", _on_change_hp)
	
	lb_score.text = 'score: %d' % player_score
	lb_hp.text = 'hp: %d' % player_hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_score(score):
	player_score += score
	lb_score.text = 'score: %d' % player_score

func _on_change_hp(hp):
	player_hp += hp
	player_hp = maxi(player_hp, 0)
	lb_hp.text = 'hp: %d' % player_hp
