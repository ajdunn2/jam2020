extends Node2D
class_name Puzzle

# Declare member variables here. Examples:
var scene_piece = null

######### START AT LEVEL 1 ###############
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
	return ran


func add_rando_pieces(count, ran):
	ai_selected_pieces.append(ran)
	
	var scene_piece_instance = scene_piece.instance()
	
	var y_line = 0 if (count < 5) else 300
	var x_line = 350 if (count < 5) else 350 - (5 * 300)
	var extra = 1.0
	
	scene_piece.set_meta("type", "gamer")
	scene_piece_instance.set_name("scene")
	scene_piece_instance.global_position.x = count * 300 + x_line
	scene_piece_instance.global_position.y = 300 + y_line
	scene_piece_instance.change_piece(ran)
	scene_piece_instance.hide()
	scene_piece_instance.time_til_fade = 1.1 * count + extra
	$Game.add_child(scene_piece_instance)

	

func sound_for_piece(ran):
	match ran:
		GameData.PIECES.HEART:
			$AudioStuff/HeartAudio.play()
		GameData.PIECES.MOON:
			$AudioStuff/MoonAudio.play()
		GameData.PIECES.SQUARE:
			$AudioStuff/SquareAudio.play()
		GameData.PIECES.STAR:
			$AudioStuff/StarAudio.play()
		GameData.PIECES.TEAR:
			$AudioStuffAudioStuff/TearAudio.play()
	pass


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

