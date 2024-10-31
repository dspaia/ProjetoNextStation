extends Node2D

@onready var interação_area: InteraçãoArea = $"interação_area"
@export var jogador = CharacterBody2D

const fala: Array[String] = [
	"É...oi(?)",
	"Você viu que saiu o resultado da 5ª fase da OBMEP?",
	"*eiπ+1=0",
	"Vou ali tocar um",
	"METAL BRUTAL",
	"Aceitas acompanhar-me?"
]


func _ready() -> void:
	interação_area.interagir = Callable(self, "interagindo")
	
func interagindo():
	Gerentedialogo.inicia_dialogo(global_position, fala)
	await Gerentedialogo.dialogo_acaba
