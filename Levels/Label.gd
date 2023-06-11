extends Label

func _process(_delta):
	text = "Fruits: " + str(Globals.fruit)
#	text = "Health: " + str(Globals.player_health)
	
