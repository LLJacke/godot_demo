extends Control

var btns = []
var cur_buffs = {}

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	var vsize = get_viewport_rect()
	var center = Vector2(vsize.size.x/2, vsize.size.y/2)
	for i in 3:
		var btn = Button.new()
		btn.text = "new"
		btn.set_size(Vector2(192, 256))
		btn.position = center + Vector2(288*(i-1), 0) - Vector2(192, 256)/2
		add_child(btn)
		btn.pressed.connect(on_btn_press.bind(btn, i))
		btns.append(btn)
		

func update_buffs():
	var buffs = BuffManager.get_buff_list(BuffManager.max_buff_count)
	if buffs and buffs.size() > 0:
		for i in btns.size():
			btns[i].text = BuffManager.get_buff_txt(buffs[i])
			cur_buffs[i] = buffs[i]


func on_btn_press(btn, idx):
	print(btn.text)
	BuffManager.gain_buff(cur_buffs[idx])
	visible = false
	get_tree().paused = false
