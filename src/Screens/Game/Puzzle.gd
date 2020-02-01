extends Node2D
class_name Puzzle

# Declare member variables here. Examples:
var scene_piece = null
var level = 3
export var ai_selected_pieces: = []

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_piece = preload("res:///src/Pieces/Piece.tscn")
	start_new_level(1)


func start_new_level(num):
	level  = num
	
	for i in $Game.get_children():
		i.queue_free()
		
	ai_selected_pieces = []
	GameData.current_selected_pieces = []
	
	for i in range(level):
		var ran = make_rando_pieces()
		add_rando_pieces(i, ran)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		print("right")
	# algo
	compare_the_selection()


func make_rando_pieces():
	var ran = randi() % GameData.PIECES.size()
#	match ran:
#		GameData.PIECES.HEART:
#			print("my heart")
#		GameData.PIECES.MOON:
#			print("my moon")
#		GameData.PIECES.SQUARE:
#			print("my square")
#		GameData.PIECES.STAR:
#			print("my star")
#		GameData.PIECES.TEAR:
#			print("my tear")
	return ran


func add_rando_pieces(count, ran):
	ai_selected_pieces.append(ran)
	
	var scene_piece_instance = scene_piece.instance()
	
	var y_line = 0 if (count < 5) else 300
	var x_line = 350 if (count < 5) else 350 - (5 * 300)
	
	scene_piece.set_meta("type", "gamer")
	scene_piece_instance.set_name("scene")
	scene_piece_instance.global_position.x = count * 300 + x_line
	scene_piece_instance.global_position.y = 300 + y_line
	scene_piece_instance.change_piece(ran)
	scene_piece_instance.hide()
	scene_piece_instance.time_til_fade = 1.1 * count
	$Game.add_child(scene_piece_instance)


func compare_the_selection():
	if (GameData.current_selected_pieces.size() == level):
		if(GameData.current_selected_pieces == ai_selected_pieces):
			level_complete(true)
		else:
			level_complete(false)


func level_complete(correct):
	if (correct):
		level = level + 1
		# do not go above 10
		start_new_level(level)
	else:
		level -= 1
		# do not go below 1
		start_new_level(level)

