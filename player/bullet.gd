class_name Bullet extends RigidBody2D


@onready var animation_player := $AnimationPlayer as AnimationPlayer


func destroy() -> void:
	animation_player.play(&"destroy")


func _on_body_entered(body: Node) -> void:
	if body is Enemy:
		linear_velocity = Vector2(0,0)
		(body as Enemy).destroy()
