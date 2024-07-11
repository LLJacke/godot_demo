class_name AttackArea extends Area2D

var enemy_in_area = []


func _on_body_entered(body):
	# 当物体进入区域时，将其添加到数组中
	if body is EnemyBase:
		enemy_in_area.append(body)

func _on_body_exited(body):
	# 当物体离开区域时，从数组中移除它
	enemy_in_area.erase(body)

func get_enemy_in_area():
	# 返回当前在区域内的所有对象
	return enemy_in_area
