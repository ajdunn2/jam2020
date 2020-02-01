extends Node2D

signal selected_moon

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_MoonArea2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if !event.pressed:
			emit_signal("selected_moon")
	pass # Replace with function body.
