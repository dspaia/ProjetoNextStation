extends Node2D

@onready var fade_in := $fade_in as Timer
@onready var fade_out := $fade_in/fade_out as Timer
@onready var transicao := $ColorRect
@onready var animacao := $"transição/ColorRect/animaçao"
@onready var mudar_cena := $fade_in/mudar_cena as Timer
@onready var proxima_estacao := $saude/proxima_estacao

func _ready() -> void:
	$tvzinha.play()
	$tvzinha2.play()
	fade_in.start()
	animacao.play("fade_out")
	proxima_estacao.start()
	$"som metro".play()
	
	

func _process(delta: float) -> void:
	pass


func _on_tempo_timeout() -> void:
	animacao.play("fade_in")
	fade_out.start()
	print("Próxima estação: Final")
	
func _on_fade_in_timeout() -> void:
	animacao.play("fade_in")
	$"som metro".stop()


func _on_proxima_estacao_timeout() -> void:
	$saude.play()
