extends CanvasLayer

@onready var turn: Label = $Turn
@onready var health: Label = $Health

@onready var GameScript: Node3D = $"../Game"

@onready var plr = $"../Game/Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if GameScript.plrTurn:
		$"../CanvasLayer/Turn".text = "Your turn"
	else: 
		$"../CanvasLayer/Turn".text = "Their turn"
		
	health.text = str(plr.health)
