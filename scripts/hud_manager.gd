extends Control

@onready var contadormoeda = $container/moedacontainer/contadormoeda as Label
@onready var contadortime = $container/timecontainer/contadortime as Label
@onready var clock_timer = $clock_timer as Timer

var minutos = 9
var segundos = 0
@export_range(0, 23) var default_minutos := 9
@export_range(0, 59) var default_segundos := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	contadormoeda.text = str(Tudo.moeda)
	contadortime.text = str("%02d" % default_minutos) + ":" + str("%02d" % default_segundos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contadormoeda.text = str(Tudo.moeda)



func _on_clock_timer_timeout() -> void:
	if minutos < 24:
		segundos += 0.1
		
		if segundos == 59:
			minutos += 1
			segundos = 0
	contadortime.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
		
