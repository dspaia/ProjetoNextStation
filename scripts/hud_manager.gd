extends Control

@onready var contadormoeda = $container/moedacontainer/contadormoeda as Label
@onready var contadortime = $container/timercontainer/contadortime as Label
@onready var clock_timer = $clock_timer as Timer

var minutos = 9
var segundos = 0
@export_range(0, 23) var default_minutos := 9
@export_range(0, 59) var default_segundos := 0

# Chamado quando o nó entra na árvore da cena pela primeira vez
func _ready():
	contadormoeda.text = str(Tudo.moeda)
	contadortime.text = str("%02d" % default_minutos) + ":" + str("%02d" % default_segundos)
	reset_clock_timer()

# Chamado a cada frame
func _process(delta):
	contadormoeda.text = str(Tudo.moeda)

# Chamado quando o clock_timer dá timeout (a cada intervalo definido)
func _on_clock_timer_timeout():
	segundos += 0.1  # Incrementar segundos

	if segundos == 60:  # Se chegou a 60 segundos
		minutos += 1
		segundos = 0  # Reseta os segundos
		
	if minutos == 24:  # Se chegou a 24 minutos, reseta para 0 (ou faça outra ação)
		minutos = 0  # Reseta os minutos
	
	# Atualiza o display do timer
	contadortime.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)

# Função para resetar o timer para os valores padrões
func reset_clock_timer():
	minutos = default_minutos
	segundos = default_segundos
	contadortime.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	
	# Certifique-se de que o timer está configurado para acionar a cada 1 segundo
	clock_timer.wait_time = 1  # Define o tempo de espera como 1 segundo
	clock_timer.start()  # Inicia o timer
