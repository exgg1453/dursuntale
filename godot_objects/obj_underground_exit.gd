# Auto-converted from GameMaker: obj_underground_exit
extends Node2D

func _ready():
	con= 0
	wht= 0
	mus= 0

func _on_alarm_0_timeout():
	if(con == 0) {
	    other.x= other.xprevious
	    other.y= other.yprevious
	    con= 1
	}

func _gm_event_7_0():
	if(con == 1) {
	    GS.interact= 1
	    con= 2
	    GS.msc= 812
	    GS.typer= 5
	    GS.facechoice= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.y+= 5
	    GS.facing= 0
	    GS.interact= 0
	    con= 0
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 11
	    vol= caster_get_volume(GS.currentsong)
	}
	if(con == 11) {
	    vol-= 0.02
	    caster_set_volume(GS.currentsong, vol)
	    if(vol <= 0.02) {
	        caster_free(-3)
	        con= 12
	        cym= caster_load("music/cymbal.ogg")
	        caster_play(cym, 1, 1)
	        zr= 0
	    }
	}
	if(con == 12) {
	    z= instance_create(0, 0, 557/* obj_screenwhiter */)
	    z.ex= 2
	    con= 13
	}
	if(con == 13) {
	    zr++
	    if(zr >= 136) {
	        get_tree().change_scene_to_file("res://godot_rooms/241.tscn")
	        con= 14
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
