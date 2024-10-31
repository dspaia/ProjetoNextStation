extends Node2D

@onready var interação_area: InteraçãoArea = $"interação_area"
@export var jogador = CharacterBody2D

const fala_inicial: Array[String] = [
	"Oi, tudo bom?",
	"Derrubei algumas das minhas moedas no metrô",
	"É impressionante!"
]
const fala_final: Array[String] = [
	"Você recuperou minhas moedas!",
	"muito obrigada, pode ficar com elas!",
	"Tome cuidado porque o tempo nas estações vão diminuindo."
]

func _ready() -> void:
	interação_area.interagir = Callable(self, "interagindo")
	
func interagindo():
	if not Gerentemissaosenhora.missao_ativa && not Gerentemissaosenhora.missao_completa:
		Gerentemissaosenhora.inicia_missao()
		Gerentedialogo.inicia_dialogo(global_position, fala_inicial)
	elif Gerentemissaosenhora.missao_completa:
		Gerentedialogo.inicia_dialogo(global_position, fala_final)
		concluir_missao()
	await Gerentedialogo.dialogo_acaba
	
func concluir_missao():
	Tudo.moeda = 8
	print("Moedas do jogador ajustadas para:", Tudo.moeda)
