extends Node2D
class_name Piece

var piece = null

var time_til_fade = 2.0

var tear = preload("res://src/assets/puzzle/PUZZLE_SHAPES_TEAR.png")
var heart = preload("res://src/assets/puzzle/PUZZLE_SHAPES_HEART.png")
var moon = preload("res://src/assets/puzzle/PUZZLE_SHAPES_MOON.png")
var square = preload("res://src/assets/puzzle/PUZZLE_SHAPES_SQUARE.png")
var star = preload("res://src/assets/puzzle/PUZZLE_SHAPES_STAR.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	fade_up()
	#change_piece(GameData.PIECES.HEART)
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimationPlayer.is_playing():
		show()

func change_piece(num):
	piece = num
	match num:
		GameData.PIECES.HEART:
			change_drawn(heart)
			#print("draw heart")
		GameData.PIECES.MOON:
			change_drawn(moon)
			#print("draw moon")
		GameData.PIECES.SQUARE:
			change_drawn(square)
			#print("draw square")
		GameData.PIECES.STAR:
			change_drawn(star)
			#print("draw star")
		GameData.PIECES.TEAR:
			change_drawn(tear)
			#print("draw tear")

func change_drawn(image):
	$ShapePiece.set_texture(image)

func fade_up():
	yield(get_tree().create_timer(time_til_fade), "timeout")
	$AnimationPlayer.play("fade_in")
	sound_for_piece()
	
func sound_for_piece():
	match piece:
		GameData.PIECES.HEART:
			get_tree().get_root().find_node("AudioStuff", true, false).get_node("HeartAudio").play()
		GameData.PIECES.MOON:
			get_tree().get_root().find_node("AudioStuff", true, false).get_node("MoonAudio").play()
		GameData.PIECES.SQUARE:
			get_tree().get_root().find_node("AudioStuff", true, false).get_node("SquareAudio").play()
		GameData.PIECES.STAR:
			get_tree().get_root().find_node("AudioStuff", true, false).get_node("StarAudio").play()
		GameData.PIECES.TEAR:
			get_tree().get_root().find_node("AudioStuff", true, false).get_node("TearAudio").play()
	pass

func hide():
	$ShapePiece.visible = false
	
func show():
	$ShapePiece.visible = true
