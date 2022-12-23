extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var num = 0
var lap = 0
var maxnum
var maxlap

# Called when the node enters the scene tree for the first time.
func _ready():
	maxnum = get_node("/root/Spatial/Tracker").max_check
	maxlap = get_node("/root/Spatial/Tracker").max_laps
	pass # Replace with function body.

func _on_Car_next():  #Labelnum2's signal for this isnt set up.
	num += 1
	self.text = str(num)+"/"+str(maxnum)
	pass # Replace with function body.

func _on_Tracker_onelap():
	num = 0
	self.text = str(num)+"/"+str(maxnum)
	pass

func _on_Lap_onelap():
	lap += 1
	self.text = "\n\n\n\n"+str(lap)+"/"+str(maxlap)
	pass # Replace with function body.


func _on_Tracker_reset():
	num = 0
	self.text = "Race Done!"
	pass # Replace with function body.

func _on_Lap_reset():
	lap = 0
	pass
