# Auto-converted from GameMaker: obj_amalgam_exc
extends Node2D

func _ready():
	image_speed= 0
	con= -1
	visible= 0
	if(GS.flag[488] == 1) instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == -1 and obj_mainchara.x > x and GS.interact == 0) {
	    GS.facing= 2
	    caster_pause(GS.currentsong)
	    GS.interact= 1
	    visible= 1
	    snd_play(29/* snd_b */)
	    x= obj_mainchara.x + 6
	    y= obj_mainchara.y - 16
	    con= 0
	}
	if(con == 0) {
	    GS.facing= 2
	    tr= caster_load("music/sfx_generate.ogg")
	    con= 0.9
	    $Alarm4.start((55) / 30.0)
	}
	if(con == 0.9) GS.facing= 2
	if(con == 1.9) {
	    caster_play(tr, 0.8, 1.2)
	    con= 2
	}
	if(con == 2) {
	    image_speed= 0.25
	    if(frame >= 3) {
	        image_speed= 0
	        con= 2.9
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 3.9) {
	    caster_play(tr, 0.9, 0.7)
	    con= 4
	}
	if(con == 4) {
	    image_speed= 0.5
	    if(frame >= 11) {
	        image_speed= 0
	        con= 5
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 6) {
	    caster_free(tr)
	    GS.battlegroup= 83
	    GS.mercy= 1
	    GS.border= 0
	    GS.flag[16]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 7
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 8) {
	    GS.interact= 0
	    GS.mercy= 0
	    caster_resume(GS.currentsong)
	    myinteract= 0
	    GS.flag[488]= 1
	    scr_tempsave()
	    instance_destroy()
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
