extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scene_piece = null

#enum PIECES {HEART, MOON, SQUARE, STAR, TEAR}


# Called when the node enters the scene tree for the first time.
func _ready():
	scene_piece = preload("res:///src/Pieces/Piece.tscn")
	
	for i in range(4):
		var ran = make_rando_pieces()
		add_rando_pieces(i, ran)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func make_rando_pieces():
	var ran = randi() % GameData.PIECES.size()
	
	match ran:
		GameData.PIECES.HEART:
			print("my heart")
		GameData.PIECES.MOON:
			print("my moon")
		GameData.PIECES.SQUARE:
			print("my square")
		GameData.PIECES.STAR:
			print("my star")
		GameData.PIECES.TEAR:
			print("my tear")
	return ran
	
func add_rando_pieces(count, ran):
	var scene_piece_instance = scene_piece.instance()
	scene_piece_instance.set_name("scene")
	scene_piece_instance.global_position.x = count * 200 + 500
	scene_piece_instance.global_position.y = 300
	scene_piece_instance.change_piece(ran)
	scene_piece_instance.hide()
	scene_piece_instance.time_til_fade = 3.0
	add_child(scene_piece_instance)
	
	
