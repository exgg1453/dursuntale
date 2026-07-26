# Auto-converted from GameMaker: obj_tundramusicspecial1
# GM parent: obj_musicobjectparent
extends Node2D

func _ready():
	event_user(0)
	played= 0
	if(caster_is_playing(GS.currentsong) != 1) {
	    if(GS.plot <= 35) {
	        GS.currentsong= caster_load("music/tone2.ogg")
	        caster_loop(GS.currentsong, 0.2, 1)
	        instance_create(0, 0, 152/* obj_musfadein */)
	        $Alarm0.start((5) / 30.0)
	    }
	    if(GS.plot > 35) {
	        GS.currentsong= caster_load("music/snowy.ogg")
	        caster_loop(GS.currentsong, 1, 0.95)
	    }
	}
	if(GS.plot <= 35) {
	    $Alarm0.start((5) / 30.0)
	    GS.currentsong2= caster_load("music/tone3.ogg")
	}

func _on_destroy():
	if(GS.flag[47] == -1) {
	    caster_free(GS.currentsong2)
	    exit
	} else  {
	    if(GS.flag[47] > 0 and played == 0 and obj_mainchara.x > 660) {
	        caster_loop(GS.currentsong2, 0.2, 1.58)
	        played= 1
	    }
	    if(GS.flag[47] > 0 and played == 1 and obj_mainchara.x > 1350) {
	        caster_loop(GS.currentsong2, 0.2, 1.68)
	        played= 2
	    }
	    if(GS.flag[47] > 2 and played == 2 and obj_mainchara.x > 1600) {
	        ex2= caster_loop(GS.currentsong2, 0.1, 2.12)
	        played= 3
	    }
	    $Alarm0.start((5) / 30.0)
	    if(GS.flag[47] > 2 and played == 3 and obj_mainchara.x > 1610) {
	        $Alarm0.start((3) / 30.0)
	        caster_set_volume(GS.currentsong2, 0.2 + (obj_mainchara.x - 1610) / 860)
	        caster_set_volume(ex2, 0.1 + (obj_mainchara.x - 1610) / 860)
	    }
	    exit
	}

func _gm_event_7_5():
	if(played > 0) caster_free(GS.currentsong2)

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
