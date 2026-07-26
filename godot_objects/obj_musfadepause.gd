# Auto-converted from GameMaker: obj_musfadepause
extends Node2D

func _ready():
	mysong= GS.currentsong
	volume= caster_get_volume(mysong)
	fvolume= volume
	fadespeed= 0.1
	resume= 0

func _process(delta: float):
	if(resume == 0) {
	    volume-= fadespeed
	    if(volume < 0.05) volume= 0
	    caster_set_volume(mysong, volume)
	    if(volume == 0) caster_pause(mysong)
	}
	if(resume == 1) {
	    caster_resume(mysong)
	    volume= 0
	    resume= 2
	}
	if(resume == 2) {
	    volume+= fadespeed
	    caster_set_volume(mysong, volume)
	    if(volume > fvolume) {
	        volume= fvolume
	        instance_destroy()
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
