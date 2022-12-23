extends Sprite


# Declare member variables here. Examples:
var check
var car
var carmove
var vect
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	car = get_node("/root/Spatial/Car").get_translation()
	carmove = get_node("/root/Spatial/Car").transform.basis.z
	check = get_node("/root/Spatial/Tracker").get_check()
	vect = car.direction_to(check)
	direction  = vect.cross(carmove)
	if direction.y > 2:
		self.set_rotation_degrees(180)
	elif direction.y < -2:
		self.set_rotation_degrees(0)
	else:
		self.set_rotation_degrees(-90)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
