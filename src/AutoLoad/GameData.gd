extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum PIECES {HEART, MOON, SQUARE, STAR, TEAR}
var hand_cursor = load("res://src/assets/final/CURSOR_HAND_1.png")

export var current_selected_pieces: = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	Input.set_custom_mouse_cursor(hand_cursor)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
