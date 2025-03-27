extends RichTextLabel

func _ready():
	self.position = Vector2(randi_range(0, get_viewport().get_visible_rect().size.x), randi_range(0, get_viewport().get_visible_rect().size.y))
	self.rotation_degrees = (randf_range(-360, 360))
	self.scale = Vector2(randf_range(1, 11), randf_range(1, 11))
