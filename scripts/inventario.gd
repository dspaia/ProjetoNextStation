extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var Inventario = preload("res://inventario/inventarioJogador.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update()

func update():
	for i in range(min(Inventario.itens.size(), slots.size())):
		slots[i].update(Inventario.itens[i])

func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()
