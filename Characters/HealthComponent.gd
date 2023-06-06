extends Node2D

@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH


func damage(attack: Attack):
	health -= attach.attack_damage
