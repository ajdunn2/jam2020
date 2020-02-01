extends Node2D
class_name Puzzle

# Declare member variables here. Examples:
var scene_piece = null

var level = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_piece = preload("res:///src/Pieces/Piece.tscn")
	for i in range(level):
		var ran = make_rando_pieces()
		add_rando_pieces(i, ran)
		
func start_new_level(num):
	level  = num
	var getType = self.get_meta("type")    # get the type of myNode
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	var scene_piece_instance = scene_piece.instance()
	scene_piece.set_meta("type", "gamer")
	scene_piece_instance.set_name("scene")
	scene_piece_instance.global_position.x = count * 300 + 500
	scene_piece_instance.global_position.y = 300
	scene_piece_instance.change_piece(ran)
	scene_piece_instance.hide()
	scene_piece_instance.time_til_fade = 1.1 * count
	$Game.add_child(scene_piece_instance)
	
	
