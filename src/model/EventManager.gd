extends Object

var event_list : Dictionary = {}

func add_event(event : StringName, function : Callable):
    add_user_signal(event)
    connect(event, function)
    event_list[event] = function

func send_event(event : StringName):
    if has_user_signal(event):
        emit_signal(event)