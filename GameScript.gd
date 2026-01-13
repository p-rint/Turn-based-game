extends Node3D

@onready var plr = $Player
@onready var plrAnimPlr: AnimationPlayer = $Player/AnimationPlayer


@onready var testEnemy = $Enemies/Enemy

var plrStartPos

var eneStartPos

@export var plrTurn = true

@onready var enemyAttackTimer: Timer = $Timers/EnemyAttack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	plrStartPos = plr.position
	eneStartPos = testEnemy.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Attack"):
		if plrTurn:
			plrAttack()
			
			
	if plrTurn:
		$"../CanvasLayer/Turn".text = "Your turn"
	else: 
		$"../CanvasLayer/Turn".text = "Their turn"
	
	
	
	






func plrAttack() -> void: #Run attack stuff, then enable ene atk timer
	plrTurn = false
	print("Player Attack")
	damage(testEnemy)
	plrMove()
	plrAnimPlr.play("pow")
	enemyAttackTimer.start(.8)
	


func plrMove(): #Make tween move it to enemy pos and back
	var tween = get_tree().create_tween()
	tween.tween_property(plr, "position", eneStartPos, .10)
	var tween2 = get_tree().create_tween()
	tween.tween_property(plr, "position", plrStartPos, .10)
	
	
func eneAttack() -> void: #RUn ene atk stuf then make it plr turn
	print("Ene Attack")
	damage(plr)
	eneMove()
	plrTurn = true
	
	
	
func eneMove() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(testEnemy, "position", plrStartPos, .10)
	var tween2 = get_tree().create_tween()
	tween.tween_property(testEnemy, "position", eneStartPos, .10)

#If timer ended and not plr turn, enemy attack
func _on_enemy_attack_timeout() -> void:
	eneAttack()
	
	
	

func damage(guy : CharacterBody3D):
	guy.health -= 20
		
	
	


	
