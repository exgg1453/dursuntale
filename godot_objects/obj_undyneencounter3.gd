# Auto-converted from GameMaker: obj_undyneencounter3
extends Node2D

func _ready():
	obj_mainchara.cutscene= 1
	view_yview[0]= 0
	cn= 0
	active= 0
	if(GS.plot < 114) {
	    undyne= instance_create(x, 140, 1119/* obj_undynea_actor2 */)
	    undyne.dsprite= 1436
	    undyne.d= 1
	    undyne.z_index= 1000090
	    undyne.modulate.a= 0
	    undyne.sprite_index= 1436/* spr_undyne_starkd */
	    stk= instance_create(0, 0, 1093/* obj_starker */)
	    stk.subject= undyne
	    stk.sprite_index= 1443/* spr_undyne_shad */
	    stk.modulate.a= 0
	    active= 1
	    usong= caster_load("music/undynefast.ogg")
	    ushock= caster_load("music/fearsting.ogg")
	}
	stopper= 0

func _gm_event_2_4():
	cn++

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    // obj_mainchara
	    with(1570)
	        view_xview[0]= round(x - view_wview[0] / 2 + sprite_width / 2)
	}

func _process(delta: float):
	if(active == 1 and instance_exists(1570/* obj_mainchara */)) {
	    if(cn == 0 and GS.interact == 0 and obj_mainchara.x > x - 20) {
	        GS.interact= 1
	        undyne.modulate.a= 0
	        cn= 0.2
	        if(caster_is_playing(GS.currentsong)) {
	            ou= instance_create(0, 0, 92/* obj_musfadeout */)
	            ou.fadespeed= 0.05
	        }
	        ar= instance_create(340, 80, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((30) / 30.0)
	        ar.$Alarm6.start((260) / 30.0)
	        ar= instance_create(240, 60, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((80) / 30.0)
	        ar= instance_create(260, 100, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((130) / 30.0)
	        ar= instance_create(300, 60, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((200) / 30.0)
	        ar= instance_create(320, 80, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((203) / 30.0)
	        ar= instance_create(240, 80, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((206) / 30.0)
	        ar= instance_create(300, 80, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((209) / 30.0)
	        ar= instance_create(260, 80, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((212) / 30.0)
	        ar= instance_create(300, 100, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((215) / 30.0)
	        ar= instance_create(320, 60, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((218) / 30.0)
	        ar= instance_create(260, 60, 1047/* obj_speartilefake */)
	        ar.$Alarm5.start((221) / 30.0)
	    }
	    if(cn == 0.2 and instance_number(1047) == 0) {
	        cn= 0.3
	        $Alarm4.start((20) / 30.0)
	        instance_create(40, 80, 2/* obj_solidsmall */)
	        instance_create(40, 100, 2/* obj_solidsmall */)
	        instance_create(40, 120, 2/* obj_solidsmall */)
	        yad= 0
	        repeat(5)  {
	            ar2= instance_create(50 - yad, 100 - yad * 6, 1363/* obj_npc_marker */)
	            ar2.visible= 1
	            ar2.sprite_index= 1571/* spr_tilespear */
	            ar2.frame= 3
	            ar2.image_speed= 0
	            yad+= 2
	        }
	    }
	    if(cn == 1.3) cn= 2
	    if(cn == 2) {
	        caster_play(ushock, 1, 1)
	        cn= 3
	        $Alarm4.start((30) / 30.0)
	    }
	    if(cn == 3 and undyne.modulate.a < 1)
	        undyne.modulate.a+= 0.05
	    if(cn == 4) {
	        caster_loop(usong, 1, 1)
	        GS.currentsong= usong
	        GS.interact= 0
	        obj_mainchara.cutscene= 0
	        GS.flag[17]= 1
	        cn= 5
	    }
	    if(cn == 5) {
	        undyne.vvelocity.x= 4
	        undyne.image_speed= 0.25
	        cn= 6
	        $Alarm4.start((6) / 30.0)
	    }
	    if(cn == 7) {
	        undyne.image_speed= 0
	        undyne.vvelocity.x= 0
	        sp= instance_create(undyne.x, undyne.y, 1046/* obj_speartilegen */)
	        cn= 8
	    }
	    if(cn >= 8 and cn < 9) {
	        if(stk.modulate.a < 1)
	            stk.modulate.a+= 0.1
	        if(stopper == 1) {
	            $Alarm4.start((-1) / 30.0)
	            stopper= 0
	        }
	        if(cn == 8) {
	            if(obj_mainchara.x > undyne.x + 40 and undyne.xhome < 1110) {
	                undyne.hvelocity.x= 3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9
	            }
	            if(obj_mainchara.x < undyne.x - 40) {
	                undyne.hvelocity.x= -3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9
	            }
	            if(undyne.xhome >= 1110) {
	                undyne.hvelocity.x= 0
	                undyne.yhome= 161
	                undyne.image_speed= 0
	                cn= 8.1
	            }
	        }
	        if(cn == 8.1) {
	            if(obj_mainchara.y > undyne.y + 60 and undyne.yhome < 550) {
	                undyne.vvelocity.x= 3
	                undyne.image_speed= 0.2
	                $Alarm4.start((10) / 30.0)
	            }
	            if(obj_mainchara.y < undyne.y - 60 and undyne.yhome > 160) {
	                undyne.vvelocity.x= -3
	                undyne.image_speed= 0.2
	                $Alarm4.start((10) / 30.0)
	            }
	            if(undyne.yhome <= 160) {
	                undyne.vvelocity.x= 0
	                undyne.image_speed= 0
	                if(obj_mainchara.x < undyne.x - 60) {
	                    cn= 8
	                    undyne.xhome= 1109
	                    $Alarm4.start((-1) / 30.0)
	                }
	            }
	            if(undyne.yhome >= 550) {
	                undyne.vvelocity.x= 0
	                undyne.image_speed= 0
	                undyne.xhome= 1109
	                cn= 8.2
	                $Alarm4.start((-1) / 30.0)
	            }
	        }
	        if(cn == 8.2) {
	            if(obj_mainchara.x > undyne.x + 40 and undyne.xhome < 1110) {
	                undyne.hvelocity.x= 3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9.2
	            }
	            if(obj_mainchara.x < undyne.x - 20 and undyne.xhome > 800) {
	                undyne.hvelocity.x= -3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9.2
	            }
	            if(undyne.xhome <= 800) {
	                undyne.hvelocity.x= 0
	                undyne.image_speed= 0
	                cn= 8.3
	                undyne.yhome= 551
	            }
	            if(undyne.xhome >= 1110) {
	                undyne.hvelocity.x= 0
	                undyne.image_speed= 0
	                undyne.yhome= 549
	                cn= 8.1
	            }
	        }
	        if(cn == 8.3) {
	            if(obj_mainchara.y > undyne.y + 60 and undyne.yhome > 550) {
	                undyne.vvelocity.x= 3
	                undyne.image_speed= 0.2
	                $Alarm4.start((10) / 30.0)
	            }
	            if(obj_mainchara.y < undyne.y - 10 and undyne.yhome < 800) {
	                undyne.vvelocity.x= -3
	                undyne.image_speed= 0.2
	                $Alarm4.start((10) / 30.0)
	            }
	            if(undyne.yhome <= 550) {
	                undyne.vvelocity.x= 0
	                undyne.image_speed= 0
	                if(obj_mainchara.x > undyne.x + 60) {
	                    cn= 8.2
	                    undyne.yhome= 551
	                    undyne.xhome= 801
	                    $Alarm4.start((-1) / 30.0)
	                }
	            }
	            if(undyne.yhome >= 800) {
	                undyne.vvelocity.x= 0
	                undyne.image_speed= 0
	                if(obj_mainchara.x > undyne.x + 40) {
	                    undyne.xhome= 801
	                    cn= 8.4
	                    $Alarm4.start((-1) / 30.0)
	                }
	            }
	        }
	        if(cn == 8.4) {
	            if(obj_mainchara.x > undyne.x + 40 and undyne.xhome < 1110) {
	                undyne.hvelocity.x= 3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9.4
	            }
	            if(obj_mainchara.x < undyne.x - 20 and undyne.xhome > 800) {
	                undyne.hvelocity.x= -3
	                undyne.image_speed= 0.2
	                $Alarm5.start((15) / 30.0)
	                cn= 9.4
	            }
	            if(undyne.xhome <= 800) {
	                undyne.hvelocity.x= 0
	                undyne.image_speed= 0
	                if(obj_mainchara.y < undyne.y - 10) {
	                    undyne.yhome= 799
	                    cn= 8.3
	                }
	            }
	            if(undyne.xhome >= 1110) {
	                undyne.hvelocity.x= 0
	                undyne.image_speed= 0
	            }
	        }
	    }
	    if(cn == 10) {
	        if(obj_mainchara.x > undyne.x + 40 or obj_mainchara.x < undyne.x - 40)
	            cn= 8
	        else  {
	            undyne.image_speed= 0
	            undyne.hvelocity.x= 0
	            cn= 8
	        }
	    }
	    if(cn == 9) {
	        if(undyne.xhome > 1110) undyne.hvelocity.x= 0
	        if(alarm[5] <= 1) cn= 10
	    }
	    if(cn == 9.1) cn= 12
	    if(cn == 9.2) {
	        if(undyne.xhome > 1110 or undyne.xhome < 800)
	            undyne.hvelocity.x= 0
	        if(alarm[5] <= 1) cn= 13
	    }
	    if(cn == 9.3) cn= 14
	    if(cn == 9.4) {
	        if(undyne.xhome > 1110 or undyne.xhome < 800)
	            undyne.hvelocity.x= 0
	        if(alarm[5] <= 1) cn= 15
	    }
	    if(cn == 12) {
	        if(obj_mainchara.y > undyne.y + 60 or obj_mainchara.y < undyne.y - 60)
	            cn= 8.1
	        else  {
	            undyne.image_speed= 0
	            undyne.vvelocity.x= 0
	            cn= 8.1
	        }
	    }
	    if(cn == 13) {
	        if(obj_mainchara.x > undyne.x + 40 or obj_mainchara.x < undyne.x - 20)
	            cn= 8.2
	        else  {
	            undyne.image_speed= 0
	            undyne.hvelocity.x= 0
	            cn= 8.2
	        }
	    }
	    if(cn == 14) {
	        if(obj_mainchara.y > undyne.y + 60 or obj_mainchara.y < undyne.y - 60)
	            cn= 8.3
	        else  {
	            undyne.image_speed= 0
	            undyne.vvelocity.x= 0
	            cn= 8.3
	        }
	    }
	    if(cn == 15) {
	        if(obj_mainchara.x > undyne.x + 40 or obj_mainchara.x < undyne.x - 20)
	            cn= 8.4
	        else  {
	            undyne.image_speed= 0
	            undyne.hvelocity.x= 0
	            cn= 8.4
	        }
	    }
	}

func _gm_event_7_5():
	if(GS.entrance == 2) {
	    caster_free(usong)
	    caster_free(ushock)
	}

func _gm_event_9_75():
	if(GS.debug == 1) GS.hp= 999

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
