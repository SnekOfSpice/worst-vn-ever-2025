extends Sprite2D


func _ready() -> void:
	ParserEvents.instruction_completed.connect(on_instruction_completed)
	if randf() < 0.5:
		texture = load("res://game/characters/sprites/ZifPog.png")
	else:
		texture = load("res://game/characters/sprites/ZifVision.png")

func on_instruction_completed(
	instruction_name : String,
	args : Array,
	delay : float,
):
	if instruction_name == "black_fade":
		queue_free()
