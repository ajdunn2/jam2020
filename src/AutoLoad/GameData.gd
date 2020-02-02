extends Node

enum PIECES {HEART, MOON, SQUARE, STAR, TEAR}

var hand_cursor2 = load("res://src/assets/final/CURSOR_HAND_1.png")
var hand_cursor = load("res://src/assets/final/CURSOR_HAND_2.png")
var timer

var inputReady = false

var count = 0

export var current_selected_pieces: = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("ClickTimer")
	randomize()
	Input.set_custom_mouse_cursor(hand_cursor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(inputReady)
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Input.set_custom_mouse_cursor(hand_cursor2)
			timer.set_wait_time(0.2)
			timer.start()
			timer.connect("timeout", self, "_on_Timer_timeout")
	if Input.is_action_pressed("quit_game"):
			get_tree().quit()

func _on_Timer_timeout():
	Input.set_custom_mouse_cursor(hand_cursor)
