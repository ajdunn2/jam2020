extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Clara_blink.play("Clara_blink")
	#$Clara_blink.play("Clara_wrong")
	#$Clara_blink.play("Clara_correct")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
