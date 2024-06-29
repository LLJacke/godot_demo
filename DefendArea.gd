class_name DefendArea extends Area2D

func _on_body_entered(body):
	# 当物体进入区域时，将其添加到数组中
	if body is Enemy:
		(body as Enemy).set_attack_state()

