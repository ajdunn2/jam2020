extends Node

enum PIECES {HEART, MOON, SQUARE, STAR, TEAR}
var hand_cursor2 = load("res://src/assets/final/CURSOR_HAND_1.png")
var hand_cursor = load("res://src/assets/final/CURSOR_HAND_2.png")
var timer

export var current_selected_pieces: = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("ClickTimer")
	randomize()
	Input.set_custom_mouse_cursor(hand_cursor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Input.set_custom_mouse_cursor(hand_cursor2)
			timer.set_wait_time(0.2)
			timer.start()
			timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	Input.set_custom_mouse_cursor(hand_cursor)
