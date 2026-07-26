# Auto-converted from GameMaker: obj_housemusic
# GM parent: obj_musicobjectparent
extends Node2D

func _ready():
	event_user(0)
	if(GS.flag[45] != 4) {
	    if(caster_is_playing(GS.currentsong) != 1) {
	        GS.currentsong= caster_load("music/house1.ogg")
	        GS.currentsong2= caster_load("music/house2.ogg")
	        caster_loop(GS.currentsong, 1, 1)
	        caster_loop(GS.currentsong2, 0.01, 1)
	    }
	} else  {
	    if(caster_is_playing(GS.currentsong) != 1) {
	        GS.currentsong= caster_load("music/toriel.ogg")
	        GS.currentsong2= caster_load("music/toriel.ogg")
	        caster_loop(GS.currentsong, 1, 0.4)
	        caster_loop(GS.currentsong2, 0.01, 0.4)
	    }
	}

func _spawn(scene_name: String, px: float, py: float) -> Node:
	var scene = load("res://godot_objects/" + scene_name + ".tscn")
	if scene:
		var inst = scene.instantiate()
		inst.position = Vector2(px, py)
		get_parent().add_child(inst)
		return inst
	return null

func _play_sound(snd: String) -> void:
	var p := AudioStreamPlayer.new()
	add_child(p)
	var s = load("res://sound/audio/" + snd + ".ogg")
	if not s: s = load("res://sound/audio/" + snd + ".wav")
	if s:
		p.stream = s; p.play()
		p.finished.connect(p.queue_free)

func _stop_sound(_snd: String) -> void:
	pass  # TODO: track AudioStreamPlayer by name
