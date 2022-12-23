extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mins = 0
var secs = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Timer_timeout():
	secs += 1
	if secs >= 60:
		mins += 1
		secs = 0
	self.text = str(mins).pad_zeros(2)+":"+str(secs).pad_zeros(2)
	pass # Replace with function body.


func _on_Tracker_begin():
	self.get_child(0).start(1)
	self.text = str(mins).pad_zeros(2)+":"+str(secs).pad_zeros(2)
	pass # Replace with function body.


func _on_Tracker_reset():
	self.get_child(0).stop()
	mins = 0
	secs = 0
	pass # Replace with function body.
