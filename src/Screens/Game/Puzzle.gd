extends Node2D
class_name Puzzle

# Declare member variables here. Examples:
var scene_piece = null

var need_to_setup_level = true

enum GAME_PUZZLE {LOGO, PLAY, INSTRUCTIONS, WRONG, CORRECT, OVER}
var current_puzzle = GAME_PUZZLE.LOGO

######### START AT LEVEL 1 ###############
var level = 1
const LAST_LEVEL = 10
export var ai_selected_pieces: = []

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_piece = preload("res:///src/Pieces/Piece.tscn")
	start_new_level(level)

func start_new_level(num):
	GameData.count = 0
	
	if (num >= LAST_LEVEL):
		current_puzzle = GAME_PUZZLE.OVER
	else:
		level = num
		
		for i in $Game.get_children():
			i.queue_free()
		ai_selected_pieces = []
		GameData.current_selected_pieces = []
		need_to_setup_level = true


func setup_new_level():
	for i in range(level):
		var random = make_rando_pieces()
		add_rando_pieces(i, random, level)
	need_to_setup_level = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	# load specific menu
	match current_puzzle:
		GAME_PUZZLE.LOGO:
			$Logo.visible = true
			$Instructions.visible = false
			$Correct.visible = false
			$Wrong.visible = false
			$Over.visible = false

		GAME_PUZZLE.PLAY:
			$Logo.visible = false
			$Instructions.visible = false
			$Correct.visible = false
			$Wrong.visible = false
			$Over.visible = false

			if (need_to_setup_level):
				setup_new_level()
			compare_the_selection()

		GAME_PUZZLE.INSTRUCTIONS:
			$Logo.visible = false
			$Instructions.visible = true
			$Correct.visible = false
			$Wrong.visible = false
			$Over.visible = false

		GAME_PUZZLE.WRONG:
			$Logo.visible = false
			$Instructions.visible = false
			$Correct.visible = false
			$Wrong.visible = true
			$Over.visible = false

		GAME_PUZZLE.CORRECT:
			$Logo.visible = false
			$Instructions.visible = false
			$Correct.visible = true
			$Wrong.visible = false
			$Over.visible = false

func make_rando_pieces():
	var ran = randi() % GameData.PIECES.size()
	return ran

func add_rando_pieces(count, ran, level):
	ai_selected_pieces.append(ran)
	
	var scene_piece_instance = scene_piece.instance()
	
	var y_line = 0 if (count < 5) else 300
	var x_line = 350 if (count < 5) else 350 - (5 * 300)
	var extra = 1.0
	
	scene_piece.set_meta("type", "game_piece")
	#scene_piece_instance.set_name("scene")
	scene_piece_instance.global_position.x = count * 300 + x_line
	scene_piece_instance.global_position.y = 300 + y_line
	scene_piece_instance.change_piece(ran)
	scene_piece_instance.hide()
	scene_piece_instance.time_til_fade = 1.1 * count + extra
	
	scene_piece_instance.count = count + 1 

	if (count + 1 == level):
		scene_piece_instance.last_item = true
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
		change_puzzle(GAME_PUZZLE.CORRECT)
		level = level + 1
		# do not go above 10
		start_new_level(level)
	else:
		change_puzzle(GAME_PUZZLE.WRONG)
		level -= 1
		# do not go below 1
		start_new_level(level)



func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
				match current_puzzle:
					GAME_PUZZLE.LOGO:
						change_puzzle(GAME_PUZZLE.INSTRUCTIONS)
					GAME_PUZZLE.PLAY:
						pass
					GAME_PUZZLE.WRONG:
						change_puzzle(GAME_PUZZLE.PLAY)
					GAME_PUZZLE.CORRECT:
						change_puzzle(GAME_PUZZLE.PLAY)
					GAME_PUZZLE.INSTRUCTIONS:
						change_puzzle(GAME_PUZZLE.PLAY)


func change_puzzle(new_puzzle):
	current_puzzle = new_puzzle
	match new_puzzle:
		GAME_PUZZLE.LOGO:
			pass
		GAME_PUZZLE.PLAY:
			pass
		GAME_PUZZLE.WRONG:
			GameData.inputReady = false
			get_tree().get_root().find_node("Clara", true, false).get_node("Clara_moods").play("Clara_wrong")
		GAME_PUZZLE.CORRECT:
			GameData.inputReady = false
			pass
		GAME_PUZZLE.INSTRUCTIONS:
			pass
		GAME_PUZZLE.OVER:
			pass
