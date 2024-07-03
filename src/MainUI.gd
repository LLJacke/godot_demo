extends Control

var player_score = 0

@export var player_hp = 100

@onready var lb_score = $lb_score as Label
@onready var lb_hp = $lb_player_hp as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.connect("add_score", _on_add_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_score(score):
	player_score += score
	lb_score.text = 'score: %d' % player_score

func set_hp(hp):
	lb_hp.text = 'hp: ' + hp
