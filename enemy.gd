extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var health : float = 100

@onready var healthProgBar = $Healthbar/SubViewport/ProgressBar

@onready var startPos = global_position

func _physics_process(delta: float) -> void:
	healthBar()
	pass


func healthBar() -> void:
	healthProgBar.value = health #healthProgBar.value = lerp(healthProgBar.value, health, .1)

	if health <= 0:
		queue_free()
	
