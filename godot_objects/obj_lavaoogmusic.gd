# Auto-converted from GameMaker: obj_lavaoogmusic
# GM parent: obj_musicobjectparent
extends Node2D

func _gm_event_7_4():
	event_user(0)
	ok= 1
	if(caster_is_playing(GS.currentsong) == 1) ok= 0
	if(instance_exists(1118/* obj_undynea_chaser */)) ok= 0
	if(instance_exists(1296/* obj_undynetrigger_dry */)) ok= 0
	if(ok == 1) {
	    played= 0
	    if(caster_is_playing(GS.currentsong) != 1) {
	        if(GS.flag[224] == 0) {
	            GS.currentsong= caster_load("music/oogloop.ogg")
	            caster_loop(GS.currentsong, 0.7, 0.9)
	            if(scr_murderlv() >= 12 and GS.flag[27] == 0)
	                caster_set_pitch(GS.currentsong, 0.5)
	        } else  {
	            if(GS.flag[27] == 0) {
	                GS.currentsong= caster_load("music/toomuch.ogg")
	                caster_loop(GS.currentsong, 1, 1)
	            } else  {
	                GS.currentsong= caster_load("music/oogloop.ogg")
	                caster_loop(GS.currentsong, 0.7, 0.9)
	            }
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
