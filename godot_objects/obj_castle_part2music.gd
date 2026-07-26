# Auto-converted from GameMaker: obj_castle_part2music
# GM parent: obj_musicobjectparent
extends Node2D

func _ready():
	event_user(0)
	played= 0
	if(caster_is_playing(GS.currentsong) != 1 and GS.flag[493] < 12) {
	    if(scr_murderlv() < 16) {
	        GS.currentsong= caster_load("music/endarea_partb.ogg")
	        caster_play(GS.currentsong, 1, 0.85)
	    } else  {
	        if(GS.flag[450] < 17) {
	            GS.currentsong= caster_load("music/smallshock.ogg")
	            caster_loop(GS.currentsong, 1, 0.6)
	        } else  {
	            GS.currentsong= caster_load("music/prebattle1.ogg")
	            caster_loop(GS.currentsong, 1, 0.2)
	        }
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
