# Auto-converted from GameMaker: obj_quietwatermusic
# GM parent: obj_musicobjectparent
extends Node2D

func _ready():
	event_user(0)
	if(GS.flag[7] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    played= 0
	    if(caster_is_playing(GS.currentsong) != 1 and GS.flag[94] == 0) {
	        if(GS.flag[223] == 0) {
	            GS.currentsong= caster_load("music/waterquiet.ogg")
	            caster_loop(GS.currentsong, 0.8, 0.9)
	            if(scr_murderlv() >= 8 and GS.flag[27] == 0)
	                caster_set_pitch(GS.currentsong, 0.5)
	        } else  {
	            if(GS.flag[27] == 0) {
	                GS.currentsong= caster_load("music/toomuch.ogg")
	                caster_loop(GS.currentsong, 1, 1)
	            } else  {
	                GS.currentsong= caster_load("music/waterquiet.ogg")
	                caster_loop(GS.currentsong, 0.8, 0.9)
	            }
	        }
	    }
	    exit
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
