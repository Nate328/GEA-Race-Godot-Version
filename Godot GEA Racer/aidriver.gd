extends KinematicBody


# Declare member variables here. Examples:
var check
var car
var carmove
var vect
var direction
var move
var drive

var active = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	if !active:
		self.hide()
	pass # Replace with function body.
	
func _process(_delta):
	if drive:
		car = self.get_translation()
		carmove = self.transform.basis.z
		check = get_node("/root/Spatial/Tracker").ai_check()
		vect = car.direction_to(check)
		direction  = vect.cross(carmove)
		if direction.y > 0.2:
			rotate_object_local(Vector3(0,1,0), -0.3)
		elif direction.y < -0.2:
			rotate_object_local(Vector3(0,1,0), 0.3)
		else:
			var velocity = Vector3(0,0,1)
			move = move_and_slide((transform.basis * velocity), Vector3.UP)
	pass


func _on_Tracker_begin():
	if active:
		drive = true
	pass # Replace with function body.


func _on_Tracker_reset():
	drive = false
	pass # Replace with function body.
	
func _on_Area_body_entered(body):
	if body == get_node("/root/Spatial/Aicar"):
		get_node("/root/Spatial/Tracker").ainum += 1
		get_node("/root/Spatial/Tracker").aifinish()
	pass
