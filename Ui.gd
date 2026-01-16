extends CanvasLayer

@onready var turn: Label = $Turn
@onready var healthP1: Label = $Health1
@onready var healthP2: Label = $Health2

@onready var GameScript: Node3D = $"../Game"

@onready var plr1 = $"../Game/Players/Player1"
@onready var plr2 = $"../Game/Players/Player2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	#if GameScript.plrTurn:
		#$"../CanvasLayer/Turn".text = "Your turn"
	#else: 
		#$"../CanvasLayer/Turn".text = "Their turn"
		#
	healthP1.text = "P1: " + str(plr1.health)
	healthP2.text = "P2: " + str(plr2.health)
	


func _on_atk_1_button_up() -> void:
	print("Func1()")
	GameScript.requestAttack(0)


func _on_atk_2_button_up() -> void:
	print("Func2()")
	GameScript.requestAttack(1)


func _on_atk_3_button_up() -> void:
	print("Func3()")
	GameScript.requestAttack(2)
