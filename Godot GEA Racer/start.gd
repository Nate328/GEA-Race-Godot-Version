extends Area

var basemat = SpatialMaterial.new()
var newmat = SpatialMaterial.new()

func _ready():
	basemat.albedo_color = Color(1,1,1,0.4)
	newmat.albedo_color = Color(0.5,1,0.5,0.4)
	pass

func _on_Start_body_entered(_body):
	self.hide()
	self.get_node("MeshInstance").material_override = basemat
	self.get_node("CollisionShape").disabled = true
	get_node("/root/Spatial/Tracker").begin()

func on_next_target():
	self.get_node("MeshInstance").material_override = newmat
