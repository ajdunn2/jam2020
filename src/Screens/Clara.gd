extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Clara_moods.play("Clara_blink")
	#$Clara_blink.play("Clara_wrong")
	#$Clara_blink.play("Clara_correct")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Clara_moods_animation_finished():
	$Clara_moods.play("Clara_blink")
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		$Clara_moods.play("Clara_funny")
		get_tree().get_root().find_node("Talk", true, false).show_talk("annoyed", 2.0)
		print('you touched me')
	pass # Replace with function body.
