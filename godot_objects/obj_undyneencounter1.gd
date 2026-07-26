# Auto-converted from GameMaker: obj_undyneencounter1
extends Node2D

func _ready():
	obj_mainchara.cutscene= 1
	view_yview[0]= 60
	cn= 0
	active= 0
	ld= 0
	if(GS.plot < 110) {
	    undyne= instance_create(x, 14, 1117/* obj_undynea_actor */)
	    undyne.dsprite= 1436
	    undyne.modulate.a= 0
	    undyne.sprite_index= 1436/* spr_undyne_starkd */
	    stk= instance_create(0, 0, 1093/* obj_starker */)
	    stk.subject= undyne
	    stk.sprite_index= 1443/* spr_undyne_shad */
	    stk.modulate.a= 0
	    active= 1
	    usong= caster_load("music/undynefast.ogg")
	    ushock= caster_load("music/fearsting.ogg")
	    ld= 1
	}
	stopper= 0

func _gm_event_2_4():
	cn++

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    // obj_mainchara
	    with(1570)
	        view_xview[0]= round(x - view_wview[0] / 2 + sprite_width / 2)
	    if(GS.flag[85] == 1) {
	        // obj_mainchara
	        with(1570)
	            view_xview[0]= floor(x - 160 + sprite_width / 2)
	    }
	}

func _process(delta: float):
	if(active == 1) {
	    if(instance_exists(1570/* obj_mainchara */) and cn == 0 and GS.interact == 0 and obj_mainchara.x > x) {
	        GS.interact= 1
	        undyne.modulate.a= 0
	        cn= 0.1
	        ou= instance_create(0, 0, 92/* obj_musfadeout */)
	        ou.fadespeed= 0.05
	        snd_play(20/* snd_arrow */)
	        ar= instance_create(x + 30, -220, 1363/* obj_npc_marker */)
	        ar.visible= 1
	        ar.sprite_index= 1449/* spr_undynespear */
	        ar.rotation_degrees= -90
	        ar.velocity.y= 24
	        ar.friction= -0.3
	    }
	    if(cn == 0.1 and ar.y > 160) {
	        ar.rotation_degrees= 0
	        ar.sprite_index= 1451/* spr_undynespear_stabbed */
	        ar.y+= ar.velocity.y
	        ar.velocity.y= 0
	        snd_play(21/* snd_impact */)
	        instance_create(0, 0, 118/* obj_flasher */)
	        scr_shake(4, 4, 2)
	        cn= 0.2
	        $Alarm4.start((50) / 30.0)
	        instance_create(40, 180, 2/* obj_solidsmall */)
	        instance_create(40, 200, 2/* obj_solidsmall */)
	        instance_create(40, 220, 2/* obj_solidsmall */)
	        yad= 0
	        repeat(5)  {
	            ar2= instance_create(50 - yad, 210 - yad * 6, 1363/* obj_npc_marker */)
	            ar2.visible= 1
	            ar2.sprite_index= 1451/* spr_undynespear_stabbed */
	            yad+= 2
	        }
	    }
	    if(cn == 1.2) {
	        if(ar.modulate.a > 0.02)
	            ar.modulate.a-= 0.1
	        if(view_yview[0] > 10) view_yview[0]-= 5
	        else  cn= 2
	    }
	    if(cn == 2) {
	        caster_play(ushock, 1, 1)
	        cn= 3
	        $Alarm4.start((30) / 30.0)
	    }
	    if(cn == 3 and undyne.modulate.a < 1)
	        undyne.modulate.a+= 0.05
	    if(cn == 4) {
	        GS.currentsong= usong
	        caster_loop(GS.currentsong, 1, 1)
	        GS.interact= 0
	        GS.flag[17]= 1
	        GS.flag[77]= GS.armor
	        cn= 5
	    }
	    if(cn == 5) {
	        undyne.velocity.y= 4
	        undyne.image_speed= 0.25
	        cn= 6
	        $Alarm4.start((6) / 30.0)
	    }
	    if(cn == 7) {
	        undyne.image_speed= 0
	        undyne.velocity.y= 0
	        sp= instance_create(undyne.x, undyne.y, 1045/* obj_uspeargen */)
	        cn= 8
	    }
	    if(cn > 7) {
	        sp.x= undyne.x + 24
	        sp.y= undyne.y + 20
	    }
	    if(cn == 8) {
	        if(stk.modulate.a < 1)
	            stk.modulate.a+= 0.1
	        if(stopper == 1) {
	            $Alarm4.start((-1) / 30.0)
	            cn= 10
	            stopper= 0
	        }
	        if(obj_mainchara.x > undyne.x + 80 and undyne.x < get_viewport_rect().size.x) {
	            undyne.velocity.x= 3
	            undyne.image_speed= 0.2
	            $Alarm4.start((20) / 30.0)
	            cn= 9
	        }
	        if(obj_mainchara.x < undyne.x - 60) {
	            undyne.velocity.x= -3
	            undyne.image_speed= 0.2
	            $Alarm4.start((20) / 30.0)
	            cn= 9
	        }
	    }
	    if(cn == 10) {
	        if(obj_mainchara.x > undyne.x + 80 or obj_mainchara.x < undyne.x - 60)
	            cn= 8
	        else  {
	            undyne.image_speed= 0
	            undyne.velocity.x= 0
	            cn= 8
	        }
	    }
	    if(cn == 9 and alarm[4] <= 0) cn= 10
	}

func _gm_event_7_5():
	if(GS.entrance == 2 and ld == 1) {
	    caster_free(usong)
	    caster_free(ushock)
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
