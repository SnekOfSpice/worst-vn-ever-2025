@tool
extends RichTextEffect
class_name Jiggle

var bbcode = "jiggle"

func _process_custom_fx(char_fx: CharFXTransform)->bool:
	var horizontal_magnitude = char_fx.env.get("h", 1)
	var vertical_magnitude = char_fx.env.get("v", 1)
	char_fx.offset.x += randi_range(0, horizontal_magnitude)
	char_fx.offset.y += randf_range(0, vertical_magnitude)
	
	return true
