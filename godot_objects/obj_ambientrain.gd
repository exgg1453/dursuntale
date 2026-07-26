# Auto-converted from GameMaker: obj_ambientrain
# GM parent: obj_musicobjectparent
extends Node2D

func _ready():
	event_user(0)
	if(GS.flag[7] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    played= 0
	    ok= 0
	    if(room == 104 or room == 105 or room == 106 or room == 107 or room == 108 or room == 109 or room == 110)
	        ok= 1
	    if(GS.flag[360] == 0 and ok == 1) {
	        GS.flag[361]= 0.5
	        GS.flag[362]= 0
	        if(room == 104 or room == 110) {
	            GS.flag[361]= 0
	            GS.flag[362]= 0.5
	        }
	        GS.flag[363]= caster_load("music/rain.ogg")
	        GS.flag[364]= caster_load("music/rain_deep.ogg")
	        GS.currentsong= -999
	        caster_loop(GS.flag[363], GS.flag[361], 0.9)
	        caster_loop(GS.flag[364], GS.flag[362], 0.9)
	        GS.flag[360]= 1
	    }
	    exit
	}

func _process(delta: float):
	if(ok == 0 and GS.flag[360] == 1) {
	    GS.flag[361]-= 0.02
	    GS.flag[362]-= 0.02
	    if(GS.flag[361] < 0) GS.flag[361]= 0
	    if(GS.flag[362] < 0) GS.flag[362]= 0
	    caster_set_volume(GS.flag[363], GS.flag[361])
	    caster_set_volume(GS.flag[364], GS.flag[362])
	    if(GS.flag[361] < 0.1 and GS.flag[362] < 0.1) {
	        GS.flag[360]= 0
	        caster_free(GS.flag[363])
	        caster_free(GS.flag[364])
	        GS.flag[363]= -1
	        GS.flag[364]= -1
	        instance_destroy()
	    }
	}
	if(GS.flag[360] == 1 and room == 105 or room == 108 or room == 104 or room == 110) {
	    if(GS.flag[361] > 0.08) GS.flag[361]-= 0.02
	    if(GS.flag[362] < 0.5) GS.flag[362]+= 0.02
	    caster_set_volume(GS.flag[363], GS.flag[361])
	    caster_set_volume(GS.flag[364], GS.flag[362])
	}
	if(GS.flag[360] == 1 and room == 106 or room == 107 or room == 109) {
	    if(GS.flag[362] > 0.02) GS.flag[362]-= 0.02
	    if(GS.flag[361] < 0.5) GS.flag[361]+= 0.02
	    caster_set_volume(GS.flag[363], GS.flag[361])
	    caster_set_volume(GS.flag[364], GS.flag[362])
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
