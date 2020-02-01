extends Node2D

signal selected_moon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_MoonArea2D_mouse_entered():
	print("_on_MoonArea2D_mouse_entered");
	pass # Replace with function body.


func _on_MoonArea2D_mouse_exited():
	print("_on_MoonArea2D_mouse_exited");
	pass # Replace with function body.


func _on_MoonArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("clicky")
	pass # Replace with function body.
