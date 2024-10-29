extends Node2D

@onready var tempo := $tempo as Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$tvzinha.play()
	$tvzinha2.play()
	tempo.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tempo_timeout() -> void:
	$TileMapLayer/porta.play()
	$TileMapLayer/porta2.play()
	$TileMapLayer/porta3.play()
	$TileMapLayer/porta4.play()
