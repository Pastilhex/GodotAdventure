extends TextureProgressBar

func _ready():
	self.value = Globals.player_health


func _on_mask_dude_update_health():
	# Atualiza a barra da vida com a variavel global
	self.value = Globals.player_health
