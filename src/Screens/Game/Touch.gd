extends Node2D

signal selected_moon

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Moon
func _on_MoonArea2D_mouse_entered():
	print("moon enter hover");
	pass # Replace with function body.


func _on_MoonArea2D_mouse_exited():
	print("moon remove hover");
	pass # Replace with function body.


func _on_MoonArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("moon clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.MOON)
		print(GameData.current_selected_pieces);
	pass # Replace with function body.


func _on_TearArea2D_mouse_entered():
	print("tear enter hover");
	pass # Replace with function body.


func _on_TearArea2D_mouse_exited():
	print("moon remove hover");
	pass # Replace with function body.


func _on_TearArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("tear clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.TEAR)
		print(GameData.current_selected_pieces);
	pass # Replace with function body.


func _on_HeartArea2D_mouse_entered():
	print("heart enter hover");
	pass # Replace with function body.


func _on_HeartArea2D_mouse_exited():
	print("heart remove hover");
	pass # Replace with function body.


func _on_HeartArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("heart clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.HEART)
		print(GameData.current_selected_pieces);
	pass # Replace with function body.


func _on_SquareArea2D_mouse_entered():
	print("square enter hover");
	pass # Replace with function body.


func _on_SquareArea2D_mouse_exited():
	print("square remove hover");
	pass # Replace with function body.


func _on_SquareArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("square clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.SQUARE)
		print(GameData.current_selected_pieces);
	pass # Replace with function body.


func _on_StarArea2D_mouse_entered():
	print("star enter hover");
	pass # Replace with function body.


func _on_StarArea2D_mouse_exited():
	print("star remove hover");
	pass # Replace with function body.


func _on_StarArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("square clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.STAR)
		print(GameData.current_selected_pieces);
	pass # Replace with function body.
