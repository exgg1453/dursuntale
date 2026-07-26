# Auto-converted from GameMaker: obj_asriellamp
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1
	if(GS.plot == 0) instance_destroy()
	active= 1
	if(GS.flag[7] == 1) active= 0
	if(active == 1) {
	    idealvolume[0]= 1
	    idealvolume[1]= 0.01
	    curvol1= caster_get_volume(GS.currentsong)
	    curvol2= caster_get_volume(GS.currentsong2)
	    crumblebaby= audio_sound_get_track_position(GS.currentsong)
	    audio_sound_set_track_position(GS.currentsong2, crumblebaby)
	}

func _on_destroy():
	snd_play(106/* snd_noise */)
	if(background_visible[1] == 1) {
	    background_visible[0]= 1
	    background_visible[1]= 0
	    idealvolume[0]= 0
	    idealvolume[1]= 1
	} else  {
	    background_visible[0]= 0
	    background_visible[2]= 0
	    background_visible[1]= 1
	    idealvolume[0]= 1
	    idealvolume[1]= 0
	}
	myinteract= 0
	GS.interact= 0

func _process_end(delta: float):
	if(active == 1) {
	    if(caster_get_volume(GS.currentsong) > idealvolume[0]) {
	        curvol1-= 0.05
	        caster_set_volume(GS.currentsong, curvol1)
	    }
	    if(caster_get_volume(GS.currentsong) < idealvolume[0]) {
	        curvol1+= 0.05
	        caster_set_volume(GS.currentsong, curvol1)
	    }
	    if(caster_get_volume(GS.currentsong2) > idealvolume[1]) {
	        curvol2-= 0.05
	        caster_set_volume(GS.currentsong2, curvol2)
	    }
	    if(caster_get_volume(GS.currentsong2) < idealvolume[1]) {
	        curvol2+= 0.05
	        caster_set_volume(GS.currentsong2, curvol2)
	    }
	    if(curvol1 < 0) curvol1= 0.051
	    if(curvol2 < 0) curvol2= 0.051
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
