extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationCamera.play("tv_to_room");
	
	$Glow_02.play()
	$Glow_03.play()
	$Glow_04.play()
	$Glow_05.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

