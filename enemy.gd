extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health : float = 100

@onready var healthProgBar = $Healthbar/SubViewport/ProgressBar

@onready var startPos = global_position


@onready var GameScript: Node3D = $"../.."

@onready var plr1: CharacterBody3D = $"../../Players/Player1"
@onready var plr2: CharacterBody3D = $"../../Players/Player2"



func _physics_process(delta: float) -> void:
	healthBar()
	pass


func healthBar() -> void:
	healthProgBar.value = health #healthProgBar.value = lerp(healthProgBar.value, health, .1)

	if health <= 0:
		queue_free()
	

func attack() -> void: #RUn ene atk stuf then make it plr turn
	print("Ene Attack")
	var rand = randi_range(0,1)
	if rand == 0:
		GameScript.damage(plr1)
		move(GameScript.plr1StartPos, .1)
		#print("P1: OWWWW")
	else:
		GameScript.damage(plr2)
		move(GameScript.plr2StartPos, .1)
		#print("P2: OWWWW")
	GameScript.plr1Turn = true
	GameScript.plr2Turn = true

func move(plrPos, speed) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", plrPos, speed)
	var tween2 = get_tree().create_tween()
	tween.tween_property(self, "position", startPos, speed)
