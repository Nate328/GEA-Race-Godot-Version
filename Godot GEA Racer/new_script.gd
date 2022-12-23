extends KinematicBody
#Vector3 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector3.ZERO
var turnlocity = 0
var move
var carpos
signal next

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("drive"):
		if velocity.z < 4:
			velocity.z += 0.2
	elif velocity.z > 0:
		velocity.z -= 0.1
	if Input.is_action_pressed("turn_left"):
		if turnlocity < 0.5:
			turnlocity += 0.005
	elif Input.is_action_pressed("turn_right"):
		if turnlocity > -0.5:
			turnlocity -= 0.005
	else:
		if turnlocity > 0:
			turnlocity -= 0.01
		elif turnlocity < 0:
			turnlocity += 0.01
	if velocity.z < 0.01:
		velocity.z = 0
	if turnlocity < 0.005 and turnlocity > -0.005:
		turnlocity = 0
	rotate_object_local(Vector3(0,1,0), turnlocity)
	move = move_and_slide((transform.basis * velocity)/2, Vector3.UP)

func _on_Area_body_entered(body):
	if body == get_node("/root/Spatial/Car"):
		get_node("/root/Spatial/Tracker").num += 1
		emit_signal("next")
		get_node("/root/Spatial/Tracker").finish()
	
	

