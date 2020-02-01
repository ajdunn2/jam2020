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
	get_tree().get_root().find_node("MoonBtn", true, false).rotate (deg2rad(-8))
	pass # Replace with function body.


func _on_MoonArea2D_mouse_exited():
	print("moon remove hover");
	get_tree().get_root().find_node("MoonBtn", true, false).rotate (deg2rad(8))
	pass # Replace with function body.


func _on_MoonArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("moon clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.MOON)
		print(GameData.current_selected_pieces);
		get_tree().get_root().find_node("AudioStuff", true, false).get_node("MoonAudio").play()
	pass # Replace with function body.


func _on_TearArea2D_mouse_entered():
	print("tear enter hover");
	get_tree().get_root().find_node("TearBtn", true, false).rotate (deg2rad(-8))
	pass # Replace with function body.


func _on_TearArea2D_mouse_exited():
	print("moon remove hover")
	get_tree().get_root().find_node("TearBtn", true, false).rotate (deg2rad(8))
	pass # Replace with function body.


func _on_TearArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("tear clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.TEAR)
		print(GameData.current_selected_pieces);
		get_tree().get_root().find_node("AudioStuff", true, false).get_node("TearAudio").play()
	pass # Replace with function body.


func _on_HeartArea2D_mouse_entered():
	print("heart enter hover")
	get_tree().get_root().find_node("HeartBtn", true, false).rotate (deg2rad(-8))
	pass # Replace with function body.


func _on_HeartArea2D_mouse_exited():
	print("heart remove hover")
	get_tree().get_root().find_node("HeartBtn", true, false).rotate (deg2rad(8))
	pass # Replace with function body.


func _on_HeartArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("heart clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.HEART)
		print(GameData.current_selected_pieces);
		get_tree().get_root().find_node("AudioStuff", true, false).get_node("HeartAudio").play()
	pass # Replace with function body.


func _on_SquareArea2D_mouse_entered():
	print("square enter hover")
	get_tree().get_root().find_node("SquareBtn", true, false).rotate (deg2rad(-8))
	pass # Replace with function body.


func _on_SquareArea2D_mouse_exited():
	print("square remove hover")
	get_tree().get_root().find_node("SquareBtn", true, false).rotate (deg2rad(8))
	pass # Replace with function body.


func _on_SquareArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("square clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.SQUARE)
		print(GameData.current_selected_pieces);
		get_tree().get_root().find_node("AudioStuff", true, false).get_node("SquareAudio").play()
	pass # Replace with function body.


func _on_StarArea2D_mouse_entered():
	print("star enter hover")
	get_tree().get_root().find_node("StarBtn", true, false).rotate (deg2rad(-8))
	pass # Replace with function body.


func _on_StarArea2D_mouse_exited():
	print("star remove hover")
	get_tree().get_root().find_node("StarBtn", true, false).rotate (deg2rad(8))
	pass # Replace with function body.


func _on_StarArea2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.is_pressed()):
		print("square clicked")
		GameData.current_selected_pieces.append(GameData.PIECES.STAR)
		print(GameData.current_selected_pieces);
		get_tree().get_root().find_node("AudioStuff", true, false).get_node("StarAudio").play()
	pass # Replace with function body.
