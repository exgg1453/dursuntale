# Auto-converted from GameMaker: obj_xoxocontroller1
extends Node2D

func _ready():
	vic= 0
	fvic= 0
	image_speed= 0
	if(scr_murderlv() >= 4 and GS.flag[27] == 0) {
	    if(GS.plot < 57) GS.plot= 57
	    if(room == 63 and GS.plot < 63) GS.plot= 63
	}

func _gm_event_2_2():
	frame= 0

func _process_end(delta: float):
	if(vic == instance_number(975)) fvic= 1
	if(fvic == 0) vic= 0
	if(room == 63 and instance_exists(1570/* obj_mainchara */) and obj_mainchara.x > 540 and obj_mainchara.x < 560 and not instance_exists(1503/* obj_snowhat */))
	    instance_create(obj_mainchara.x, obj_mainchara.y, 1503/* obj_snowhat */)

func _on_alarm_0_timeout():
	ii= frame
	if(room == 59) {
	    if(instance_exists(1001/* obj_papyrus5 */) and fvic == 1) {
	        GS.plot= obj_papyrus5.xplot + 1
	        obj_mainchara.cutscene= 0
	        obj_xoxo.frame= 3
	        if(obj_papyrus5.conversation < 9) {
	            obj_papyrus5.conversation= 9
	            sans= instance_create(620, 80, 1022/* obj_sans_room */)
	        }
	    } else  {
	        if(GS.plot <= 55) {
	            if(vic > 0) GS.flag[63]++
	            obj_xoxo.frame= 0
	            fvic= 0
	            vic= 0
	        }
	    }
	    frame= 1
	    $Alarm2.start((3) / 30.0)
	}
	if(room == 58) {
	    if(fvic == 1 and GS.plot < 53) {
	        GS.plot= 53
	        obj_xoxo.frame= 3
	    } else  {
	        if(GS.plot < 53) {
	            obj_xoxo.frame= 0
	            fvic= 0
	            vic= 0
	        }
	    }
	    frame= 1
	    $Alarm2.start((3) / 30.0)
	}
	if(room == 63 and GS.phasing == 0) {
	    if(fvic == 1 and GS.plot < 63) {
	        GS.plot= 63
	        fb= instance_create(obj_specialdrophole.x + 3, obj_specialdrophole.y, 1376/* obj_fakebridge */)
	        fb.justdoit= 1
	        fb.$Alarm3.start((-1) / 30.0)
	        obj_xoxo.frame= 3
	    } else  {
	        if(GS.plot < 63) {
	            obj_xoxo.frame= 0
	            fvic= 0
	            vic= 0
	        }
	    }
	    frame= 1
	    $Alarm2.start((3) / 30.0)
	}
	if(ii == 0 and ii != frame) snd_play(132/* snd_switchpull_n */)

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
