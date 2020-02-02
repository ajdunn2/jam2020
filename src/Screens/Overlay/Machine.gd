extends Node

enum gameStates {HOME, WAIT, GAME}
var gameState = gameStates.HOME

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if (gameStates.HOME):
		$AnimationCamera.play("tv");

	$Glow_02.play()
	$Glow_03.play()
	$Glow_04.play()
	$Glow_05.play()
	$AnimationBG_blinds.play("light")
	#$AnimationPuzzle.play("Puzzle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (GameData.inputReady == false):
		$Touch.visible = false
	else:
		$Touch.visible = true

func _input(event):
	if event is InputEventMouseButton && (gameState == gameStates.HOME):
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				gameState = gameStates.WAIT
				$AnimationCamera.play("tv_to_room");

func start_game():
	#print('game playing')
	gameState = gameStates.GAME
