extends Node

## Call fetch to get the values
## declare consts as overrides

const STAGE_ROOT := "res://game/stages/"
const STAGE_MAIN := "main_menu_stage.tscn"
const STAGE_GAME := "game_stage.tscn"

const SCREEN_ROOT := "res://game/screens/"
const SCREEN_CONTENT_WARNING := "cw.tscn"
const SCREEN_CREDITS := "credits.tscn"
const SCREEN_HISTORY := "history.tscn"
const SCREEN_NOTICE := "notice.tscn"
const SCREEN_OPTIONS := "options_screen.tscn"
const SCREEN_SAVE := "save_screen.tscn"

const BACKGROUND_ROOT := "res://game/backgrounds/"
const BACKGROUND_LIDL := "lidl.png"
const BACKGROUND_LIDL_JPG := "lidl_jpg.jpg"
const BACKGROUND_KITCHEN := "kitchen.png"
const BACKGROUND_LIVING_ROOM := "living_room.jpg"

const MUSIC_ROOT := "res://game/sounds/music/"
const MUSIC_MAIN_MENU := "32239__jbum__whitneymicrotones.ogg"
const MUSIC_CASUAL := "795971__josefpres__piano-loops-185-octave-down-long-loop-120-bpm.ogg"
const MUSIC_LIDL := "564966__richwise__uk-supermarket-ambience.ogg"
const MUSIC_STREAM := "Jim Yosef - Eclipse [NCS Release].mp3"
const MUSIC_WEED := "Pufino - Vibing (Chill Lofi Royalty Free Music).mp3"

const SFX_ROOT := "res://game/sounds/sfx/"
const SFX_ZIF_IMAGE := "682635__bastianhallo__magic-spell.wav"
const SFX_ZIF_BLAST := "246253__frankyboomer__magic-harp.wav"

func fetch(type:String, key:String) -> String:
	type = type.to_upper()
	var root = get(str(type, "_ROOT"))
	var property := str(type, "_", key.to_upper())
	if get(property):
		return str(root, get(property))
	var extensions : Array
	if type == "MUSIC" or type == "SFX":
		extensions = ["mp3", "wav", "ogg"]
	elif type == "BACKGROUND":
		extensions == ["tscn", "png", "jpg"]
	elif type == "SCREEN" or type == "STAGE":
		extensions = ["tscn"]
	for extension in extensions:
		var path := str(root, key, ".", extension)
		if ResourceLoader.exists(path):
			return path
	push_error(str("Couldn't fetch ", key, " in ", type))
	return ""
