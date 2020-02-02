extends Node2D
class_name Talk

var timer

func _ready():
	$Talkbox.visible = false
	timer = get_node("TalkTimer")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func show_talk(string):
	$Talkbox.visible = true
	
	match string:
		"annoyed":
			$TalkText/Annoyed.visible = true
		"instruct":
			#$TalkText/Instruct.visible = true
			pass
	
	timer.set_wait_time(0.2)
	timer.start()
	timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	$Talkbox.visible = false

	var talkers = $TalkText.get_children()
	for i in talkers:
		i.visible = false
