extends Area2D

func _ready():
	self.visible = false

func _on_body_entered(_body):
	if Globals.fruit < 10:
		self.visible = true

func _on_body_exited(_body):
	self.visible = false
