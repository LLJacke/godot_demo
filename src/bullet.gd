class_name Bullet extends Area2D

var speed = 400					# 速度
var direction = Vector2(1,0)	# 方向
var hit_count = 0				# 穿透次数

@onready var animation_player := $AnimationPlayer as AnimationPlayer

func _ready():
	hit_count = PlayerInfo.bullet_max_hit

func destroy() -> void:
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body is EnemyBase:
		(body as EnemyBase).change_hp(-PlayerInfo.damage)
		
		hit_count -= 1			#减少穿透次数
		if hit_count <= 0:			
			direction = Vector2(0,0)
			speed = 0
			collision_layer = 0
			collision_mask = 0
			destroy()
			

func _physics_process(delta):
	position += speed * direction * delta
