class_name Enemy extends CharacterBody2D


enum State {
	WALKING,
	DEAD,
}

const WALK_SPEED = -22.0

var _state := State.WALKING

@onready var gravity: int = ProjectSettings.get("physics/2d/default_gravity")
@onready var sprite := $Sprite2D as Sprite2D
@onready var animation_player := $AnimationPlayer as AnimationPlayer


func _physics_process(delta: float) -> void:
	#motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	if _state == State.WALKING and velocity.is_zero_approx():
		velocity.x = WALK_SPEED

	move_and_slide()
	#move_and_collide(velocity * delta)

	if velocity.x > 0.0:
		sprite.scale.x = 0.8
	elif velocity.x < 0.0:
		sprite.scale.x = -0.8

	var animation := get_new_animation()
	if animation != animation_player.current_animation:
		animation_player.play(animation)


func destroy() -> void:
	_state = State.DEAD
	velocity = Vector2.ZERO


func get_new_animation() -> StringName:
	var animation_new: StringName
	if _state == State.WALKING:
		if velocity.x == 0:
			animation_new = &"idle"
		else:
			animation_new = &"walk"
	else:
		animation_new = &"destroy"
	return animation_new
