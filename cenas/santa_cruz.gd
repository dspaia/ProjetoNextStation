extends Node2D

@onready var fade_in := $fade_in as Timer
@onready var fade_out := $fade_in/fade_out as Timer
@onready var transicao := $ColorRect
@onready var animacao := $"transição/ColorRect/animaçao"
@onready var mudar_cena := $fade_in/mudar_cena as Timer

func _ready() -> void:
	animacao.play("fade_out")
	$tvzinha.play()
	$tvzinha2.play()
	fade_in.start()
	$"som metro".play()
	

func _process(delta: float) -> void:
	pass


func _on_tempo_timeout() -> void:
	animacao.play("fade_in")
	fade_out.start()
	print("Próxima estação: São Judas")
	$"som metro".stop()





func _on_fade_in_timeout() -> void:
	animacao.play("fade_in")
	
