extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health = 100

@onready var GameScript: Node3D = $"../.."

@onready var animPlr: AnimationPlayer = $AnimationPlayer

@onready var slashAnimPlr: AnimationPlayer = $"blade guy 3/Slash/AnimationPlayer"

var attacks : Array[Callable] = [atk1, atk2, atk3]

func slashVFX(anim):
	slashAnimPlr.stop()
	slashAnimPlr.play(anim)

func _physics_process(delta: float) -> void:
	pass



func move(speed : float): #Make tween move it to enemy pos and back
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", GameScript.eneStartPos, speed)
	var tween2 = get_tree().create_tween()
	tween.tween_property(self, "position", GameScript.plr1StartPos, speed)


func atk1() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr1Turn = false
	GameScript.damage(GameScript.targetEnemy)
	
	animPlr.stop()
	animPlr.play("Attack1")
	
	slashVFX("slash")
	move(.10)

func atk2() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr1Turn = false
	GameScript.damage(GameScript.targetEnemy)
	
	animPlr.stop()
	animPlr.play("Attack2")
	
	slashVFX("slash")
	move(.07)

func atk3() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr1Turn = false
	GameScript.damage(GameScript.targetEnemy)
	
	animPlr.stop()
	animPlr.play("Quickcut")
	
	slashVFX("slash")
	move(.05)
