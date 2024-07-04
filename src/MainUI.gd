extends Control

@onready var lb_score = $lb_score as Label
@onready var lb_hp = $lb_player_hp as Label
@onready var lb_lose = $lb_lose as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.connect("add_score", _on_add_score)
	GameData.connect("change_hp", _on_change_hp)
	
	lb_score.text = 'score: %d' % PlayerInfo.score
	lb_hp.text = 'hp: %d' % PlayerInfo.hp

func _on_add_score(score):
	PlayerInfo.score += score
	lb_score.text = 'score: %d' % PlayerInfo.score
	
	GameData.check_score(PlayerInfo.score)

func _on_change_hp(hp):
	PlayerInfo.hp += hp
	PlayerInfo.hp = maxi(PlayerInfo.hp, 0)
	lb_hp.text = 'hp: %d' % PlayerInfo.hp
	
	if PlayerInfo.hp <= 0:
		get_tree().paused = true
		lb_lose.visible = true
