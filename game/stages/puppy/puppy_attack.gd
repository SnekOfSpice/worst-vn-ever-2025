extends Control

@export
var spawn_time := 1.0;
var countdown := 1.0;

var puppy_text_field = preload("uid://cf7le7y45ohg1")

var eyes := [
	[">", "<"],
	[",,>", "<,,"],
	["o", "o"],
	["O", "O"],
	["U", "U"],
	["u", "u"],
	["-", "-"],
	["^", "^"],
	["*^", "^*"],
	[".", "."],
	[";", ";"],
	["q", "q"],
	["e", "e"],
	["x", "x"],
	[",;,", ",;,"],
]

var whiskers := [
	[">", "<"],
	["-", "-"],
	["=", "="],
	["☆⌒", "⌒☆"],
]

var mouths := [
	"w",
	"w",
	"//w//",
	"w",
	"v",
	"m",
	"ω",
	"//ω//",
	"_",
	"∀",
	"▽",
	"﹏",
]

#func _ready():
	#countdown = spawn_time
#
#func _process(delta):
	#countdown -= delta
	#if countdown <= 0:
		#countdown = spawn_time
		#spawn_puppy()

func spawn_puppy() -> void:
	var puppy = puppy_text_field.instantiate()
	var vertical_jiggle = randf_range(1, 5)
	var horizontal_jiggle = randf_range(1, 5)
	puppy.text = "[jiggle v=" + str(vertical_jiggle) + " h=" + str(horizontal_jiggle) + "]"
	puppy.text += _generate_puppy()
	
	self.add_child(puppy)
	

func _generate_puppy() -> String:
	randomize()
	var has_whiskers = randf() < 0.7
	
	var puppy = ""
	var w = whiskers.pick_random()
	if has_whiskers:
		puppy += w[0]
	var e = eyes.pick_random()
	puppy += e[0]
	puppy += mouths.pick_random()
	puppy += e[1]
	if has_whiskers:
		puppy += w[1]
	return puppy

func snuff_puppies() -> void:
	for puppy in self.get_children():
		self.remove_child(puppy)
		puppy.queue_free()
