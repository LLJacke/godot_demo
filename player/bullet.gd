class_name Bullet extends RigidBody2D

@export var damage = 50

@onready var animation_player := $AnimationPlayer as AnimationPlayer


func destroy() -> void:
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body is Enemy:
		linear_velocity = Vector2(0,0)
		(body as Enemy).change_hp(-damage)
		
		collision_layer = 0
		collision_mask = 0
		destroy()
