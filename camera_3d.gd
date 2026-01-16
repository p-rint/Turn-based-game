extends Camera3D

var t : float = 0 # time

var speed = 30
var strength = .3

var decay : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#shake()
	#t += delta # time
	#
	#strength = clamp(strength - delta/10, 0, 1000)
	#print(strength)
	
	

func shake():
	h_offset = sin(t * speed) * (strength) # time
	strength *= decay
	

func startShake():
	pass
	
