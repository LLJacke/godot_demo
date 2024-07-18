# 广播通知管理
extends Node

func add_event(event : StringName, function : Callable, flags := 0):
	if not has_user_signal(event):
		add_user_signal(event)
	connect(event, function, flags)

func send_event(event : StringName, args = null):
	if has_user_signal(event):
		if args:
			emit_signal(event, args)
		else:
			emit_signal(event)

# 4.2.2还没有remove_user_signal，等到4.3后可以使用
func remove_event(_event):
	#remove_user_signal(_event)
	pass
