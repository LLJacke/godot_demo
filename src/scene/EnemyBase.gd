class_name EnemyBase extends CharacterBody2D

enum State {
	WALKING,
	ATTACK,
	DEAD,
}


var _state := State.WALKING
 
@export var hp_limit = 100
@export var score = 50
@export var damage = 60
@export var walk_speed = 60

@onready var sprite := $Sprite2D
@onready var animation_player := $AnimationPlayer as AnimationPlayer
@onready var cur_hp = hp_limit


func _physics_process(_delta: float) -> void:
	#motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	if _state == State.WALKING and velocity.is_zero_approx():
		velocity.x = -walk_speed
	elif _state == State.ATTACK:
		velocity = Vector2.ZERO

	move_and_slide()
	#move_and_collide(velocity * delta)

	if velocity.x > 0.0:
		sprite.scale.x = abs(sprite.scale.x)
	elif velocity.x < 0.0:
		sprite.scale.x = -abs(sprite.scale.x)

	var animation := get_new_animation()
	if animation != animation_player.current_animation:
		animation_player.play(animation)


func destroy() -> void:
	_state = State.DEAD
	velocity = Vector2.ZERO
	collision_layer = 0
	collision_mask = 0
	EventManager.send_event("add_score", score)
	EventManager.send_event("enemy_destroy", self)


func get_new_animation() -> StringName:
	var animation_new: StringName
	if _state == State.WALKING:
		if velocity.x == 0:
			animation_new = &"idle"
		else:
			animation_new = &"walk"
	elif _state == State.ATTACK:
		animation_new = &"attack"
	else:
		animation_new = &"destroy"
	return animation_new


func change_hp(diff) -> void:
	cur_hp += diff
	if diff < 0:
		get_hit()
	if cur_hp <= 0:
		destroy()


func set_attack_state() -> void:
	_state = State.ATTACK

func do_attack() -> void:
	EventManager.send_event("change_hp", -damage)

func get_hit():
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", Color.WHITE, 0.1)
