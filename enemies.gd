extends Node3D

var enemy = preload("res://enemy.tscn")

var startPos = Vector3(0 ,2.2, -4.5)

var activeWave = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_children().size() == 0 and activeWave == true:
		activeWave = false
		for i in randi_range(1, 6):
			spawn()
		$"../Players/Player1".health += 20
		$"../Players/Player2".health += 20
		print("AAA")




func spawn():
	var new = enemy.instantiate()
	new.position = startPos + Vector3((randf()- .5) * 10, 0, randf_range(-2, 2))
	add_child(new)
	activeWave = true
	
