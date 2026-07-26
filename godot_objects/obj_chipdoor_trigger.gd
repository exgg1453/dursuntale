# Auto-converted from GameMaker: obj_chipdoor_trigger
extends Node2D

func _ready():
	if(room == 148 and GS.plot > 132) instance_destroy()
	if(room == 171 and GS.plot > 163) instance_destroy()
	con= 0
	scale.x= 5

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.interact= 1
	    // obj_chipdoor_l
	    with(1278) event_user(1)
	}
	if(con == 2) {
	    caster_loop(131, 1, 1)
	    con= 3
	    $Alarm4.start((50) / 30.0)
	    scr_conshakeinit()
	}
	if(con == 3) {
	    obj_chipdoor_l.x-= 0.4
	    obj_chipdoor_r.x+= 0.4
	    scr_conshake(1)
	}
	if(con == 4) {
	    scr_conshakeend()
	    caster_stop(131)
	    caster_play(123, 1, 1)
	    con= 5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 6) {
	    caster_resume(GS.currentsong)
	    if(room == 148) GS.plot= 133
	    if(room == 171) GS.plot= 164
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(room == 148 and GS.flag[374] == 1 and GS.flag[375] == 1 and GS.plot < 133 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    con= 1
	    $Alarm4.start((30) / 30.0)
	}
	if(room == 171 and GS.flag[399] == 1 and GS.flag[400] == 1 and GS.plot < 164 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    con= 1
	    $Alarm4.start((30) / 30.0)
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
