extends Area


var basemat = SpatialMaterial.new()
var newmat = SpatialMaterial.new()



func _ready():
	basemat.albedo_color = Color(1,1,1,0.4)
	newmat.albedo_color = Color(0.5,1,0.5,0.4)
	pass

func _on_Area_body_entered(body):
	if body == get_node("/root/Spatial/Car"):
		if get_node("/root/Spatial/Tracker").lap >= get_node("/root/Spatial/Tracker").max_laps:
			self.hide()
		self.get_node("CollisionShape").disabled = true
	self.get_node("MeshInstance").material_override = basemat
		

func on_next_target():
	self.get_node("MeshInstance").material_override = newmat
	self.get_node("CollisionShape").disabled = false
