extends CharacterBody3D

@export var health = 100

@onready var GameScript: Node3D = $"../.."

@onready var animPlr: AnimationPlayer = $AnimationPlayer

var attacks : Array[Callable] = [atk1, atk2, atk3]


func _physics_process(delta: float) -> void:
	pass


func move(speed : float): #Make tween move it to enemy pos and back
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", GameScript.eneStartPos, speed)
	var tween2 = get_tree().create_tween()
	tween.tween_property(self, "position", GameScript.plr2StartPos, speed)


func atk1() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr2Turn = false
	GameScript.damage(GameScript.targetEnemy, 20)
	
	animPlr.stop()
	animPlr.play("Slash1")
	move(.10)

func atk2() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr2Turn = false
	GameScript.damage(GameScript.targetEnemy, 30)
	
	animPlr.stop()
	animPlr.play("Slash2")
	move(.07)

func atk3() -> void: #Run attack stuff, then enable ene atk timer
	GameScript.plr2Turn = false
	GameScript.damage(GameScript.targetEnemy, 40)
	
	animPlr.stop()
	animPlr.play("HeavySlash")
	move(.4)
