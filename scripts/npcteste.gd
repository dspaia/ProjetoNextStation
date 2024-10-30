extends Node2D

@onready var interação_area: InteraçãoArea = $"interação_area"

const fala_inicial: Array[String] = [
	"Oh meu jovem",
	"Derrubei minhas moedas no metrô",
	"poderia me ajudar a pegar elas, por favor?"
]
const fala_final: Array[String] = [
	"Você recuperou minhas moedas!",
	"muito obrigada meu jovem",
	"Tome aqui um pequeno agradecimento"
]

func _ready() -> void:
	interação_area.interagir = Callable(self, "interagindo")
	
func interagindo():
	if not Gerentemissaosenhora.missao_ativa && not Gerentemissaosenhora.missao_completa:
		Gerentemissaosenhora.inicia_missao()
		Gerentedialogo.inicia_dialogo(global_position, fala_inicial)
	elif Gerentemissaosenhora.missao_completa:
		Gerentedialogo.inicia_dialogo(global_position, fala_final)
	await Gerentedialogo.dialogo_acaba
