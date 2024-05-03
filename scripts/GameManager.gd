extends Node
@onready var sorce_lable = $SorceLable


var sorce = 0

func add_point():
	sorce += 1
	sorce_lable.text = "Your collected " + str(sorce) + " coins."
	
