extends PanelContainer

signal viewed()

const DESCRIPTIONS : Dictionary[String, String] = {
	"yuri" : "wow im gay"
}

const NAMES : Dictionary[String, String] = {
	"yuri" : "Yuri"
}

func set_evidence(texture_name:String):
	find_child("TextureRect").texture = load(str("res://game/stages/evidence/textures/", texture_name, ".png"))
	find_child("Label").text = NAMES.get(texture_name, "no name")
	find_child("RichTextLabel").text = DESCRIPTIONS.get(texture_name, "")

func _on_close_button_pressed() -> void:
	Parser.line_reader.instruction_handler.instruction_completed.emit()
	queue_free()
