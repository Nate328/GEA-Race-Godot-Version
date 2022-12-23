extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var num = 0
var max_check = 0
var nextpos
var lap = 0
var max_laps = 0

var ainum = 0
var ailap = 0

signal reset
signal onelap
signal begin

func _ready():
	max_check = get_child_count()
	for i in range(1,max_check):
		self.get_child(i).hide()
		self.get_child(i).get_node("CollisionShape").disabled = true
	max_laps = 2
	
func begin():
	for i in range(1,max_check):
		self.get_child(i).show()
		self.get_child(i).get_node("CollisionShape").disabled = false
		emit_signal("begin")
	

func finish():
	if num > ainum:
		ainum = num
	if num >= max_check:
		num = 0
		lap += 1
		ainum = 0
		ailap += 1
		self.get_node("Start").show()
		self.get_node("Start/CollisionShape").disabled = false
		emit_signal("onelap")
		if lap >= max_laps:
			lap = 0
			ailap = 0
			emit_signal("reset")
		
func get_check():
	nextpos = self.get_child(num).transform.origin
	self.get_child(num).on_next_target()
	return nextpos
	
func aifinish():
	if ainum >= max_check:
		num = 0
		lap += 1
		ainum = 0
		ailap += 1
		if ailap >= max_laps:
			lap = 0
			ailap = 0
			emit_signal("reset")
		
func ai_check():
	nextpos = self.get_child(ainum).transform.origin
	self.get_child(ainum).on_next_target()
	return nextpos
	
func lapcheck():
	if (lap + 1) >= max_laps:
		return true
	else:
		return false
	
