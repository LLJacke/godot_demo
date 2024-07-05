class_name Bullet extends RigidBody2D

@onready var animation_player := $AnimationPlayer as AnimationPlayer


func destroy() -> void:
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body is EnemyBase:
		linear_velocity = Vector2(0,0)
		(body as EnemyBase).change_hp(-PlayerInfo.damage)
		
		collision_layer = 0
		collision_mask = 0
		destroy()
