extends Area2D

class_name coletavel

@export var itemRes: ItensInventario

var coletado=false

func _coletado():
	coletado=true
	
func coletar(inventario: Inventario):
	inventario.inserir(itemRes)
	queue_free()
