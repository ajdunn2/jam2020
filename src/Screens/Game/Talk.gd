extends Node2D
class_name Talk

var timer

func _ready():
	$Talkbox.visible = false
	hide_talk_i()
	timer = get_node("TalkTimer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_talk_i():
	$TalkInstruct.visible = true
	
func hide_talk_i():
	$TalkInstruct.visible = false

func show_talk(string, float_time = 0.0):
	$Talkbox.visible = true
	
	var wait = 2.0;
	if (float_time > 0.0):
		wait = float_time

	match string:
		"over":
			$TalkText/Over.visible = true
		"correct":
			$TalkText/Correct.visible = true
		"wrong":
			$TalkText/Wrong.visible = true
		"annoyed":
			$TalkText/Annoyed.visible = true
		"instruct":
			$TalkText/Instruct.visible = true
	
	timer.set_wait_time(wait)
	timer.start()
	timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	$Talkbox.visible = false

	var talkers = $TalkText.get_children()
	for i in talkers:
		i.visible = false
