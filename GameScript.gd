extends Node3D

@onready var players: Node3D = $Players


@onready var plr1 = $Players/Player1
@onready var plr1AnimPlr: AnimationPlayer = $Players/Player1/AnimationPlayer

@onready var plr2 = $Players/Player2
@onready var plr2AnimPlr: AnimationPlayer = $Players/Player2/AnimationPlayer

@onready var testEnemy = $Enemies/Enemy

var plr1StartPos
var plr2StartPos

var eneStartPos

@export var plr1Turn = true
@export var plr2Turn = true

@onready var enemyAttackTimer: Timer = $Timers/EnemyAttack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	plr1StartPos = plr1.position
	plr2StartPos = plr2.position
	eneStartPos = testEnemy.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Attack"):
		requestAttack(0)
			
			
	if plr1Turn:
		$"../CanvasLayer/Turn".text = "P1 turn"
	elif plr2Turn:
		$"../CanvasLayer/Turn".text = "P2 turn"
	else: 
		$"../CanvasLayer/Turn".text = "Their turn"
	
	
	
	






func plr1Attack() -> void: #Run attack stuff, then enable ene atk timer
	plr1Turn = false
	print("Player Attack")
	damage(testEnemy)
	plr1AnimPlr.stop()
	plr1AnimPlr.play("Attack1")
	plr1.move()
	
	#enemyAttackTimer.start(.8)

func plr2Attack() -> void: #Run attack stuff, then enable ene atk timer
	plr2Turn = false
	print("Player Attack")
	damage(testEnemy)
	plr2Move()
	plr2AnimPlr.stop()
	plr2AnimPlr.play("pow")
	enemyAttackTimer.start(.8)
	


func plr1Move(): #Make tween move it to enemy pos and back
	var tween = get_tree().create_tween()
	tween.tween_property(plr1, "position", eneStartPos, .10)
	var tween2 = get_tree().create_tween()
	tween.tween_property(plr1, "position", plr1StartPos, .10)

func plr2Move(): #Make tween move it to enemy pos and back
	var tween = get_tree().create_tween()
	tween.tween_property(plr2, "position", eneStartPos, .10)
	var tween2 = get_tree().create_tween()
	tween.tween_property(plr2, "position", plr2StartPos, .10)
	
	
func eneAttack() -> void: #RUn ene atk stuf then make it plr turn
	print("Ene Attack")
	var rand = randi_range(0,1)
	print(rand)
	if rand == 0:
		damage(plr1)
		eneMove(plr1StartPos)
		#print("P1: OWWWW")
	else:
		damage(plr2)
		eneMove(plr2StartPos)
		#print("P2: OWWWW")
	plr1Turn = true
	plr2Turn = true
	
	
	
func eneMove(plrPos) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(testEnemy, "position", plrPos, .10)
	var tween2 = get_tree().create_tween()
	tween.tween_property(testEnemy, "position", eneStartPos, .10)

#If timer ended and not plr turn, enemy attack
func _on_enemy_attack_timeout() -> void:
	eneAttack()
	
	
	

func damage(guy : CharacterBody3D):
	guy.health -= 20
	


func requestAttack(num) -> void:
	if plr1Turn:
		plr1.attacks[num].call()
	elif plr2Turn:
		plr2.attacks[num].call()
		enemyAttackTimer.start(.8)
	
	
