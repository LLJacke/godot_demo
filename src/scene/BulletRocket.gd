extends BulletBase

var max_damage = 0
var min_damage = 0
var max_range = 0
var min_range = 0

func _ready():
	hit_count = 1


func _on_body_entered(body: Node) -> void:
	if hit_count <= 0: return		# 避免同时触发的情况
	if body is EnemyBase:
		$damage_area.visible = true
		
		hit_count -= 1			#减少穿透次数
		if hit_count <= 0:			
			direction = Vector2(0,0)
			speed = 0
			collision_layer = 0
			collision_mask = 0
			destroy()
			

# 对爆炸范围内的enemy造成伤害
func _on_damage_area_entered(body):
	if min_range > max_range or min_damage > max_damage: return 
	if max_range <= 0 or max_damage <= 0: return
	if body is EnemyBase:
		var dis = global_position.distance_to(body.global_position)
		dis = clampf(dis, min_range, max_range)
		var rate = (dis-min_range)/(max_range-min_range)
		var dmg = lerp(min_damage, max_damage, rate)
		
		(body as EnemyBase).change_hp(-dmg)
		
