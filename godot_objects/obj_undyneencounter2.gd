# Auto-converted from GameMaker: obj_undyneencounter2
extends Node2D

func _ready():
	cn= 0
	active= 0
	if(GS.plot < 110) {
	    undyne= instance_create(-40, 90, 1117/* obj_undynea_actor */)
	    mkid= instance_create(360, 100, 1115/* obj_mkid_actor */)
	    undyne.dsprite= 1436
	    undyne.sprite_index= 1436/* spr_undyne_starkd */
	    active= 1
	}

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
	    if(cn == 0) {
	        instance_create(0, 0, 1045/* obj_uspeargen */)
	        obj_mainchara.x+= 6
	        sl1= instance_create(4, 120, 2/* obj_solidsmall */)
	        sl2= instance_create(4, 140, 2/* obj_solidsmall */)
	        cn= 1
	    }
	    if(cn == 1 and obj_mainchara.x > 460 and instance_exists(1045/* obj_uspeargen */)) {
	        // obj_uspeargen
	        with(1045) alarm[0]++
	    }
	    if(cn == 1 and obj_mainchara.x > 510 and GS.interact == 0) {
	        GS.interact= 1
	        if(instance_exists(1045/* obj_uspeargen */)) {
	            // obj_uspeargen
	            with(1045) instance_destroy()
	        }
	        m= instance_create(0, 0, 92/* obj_musfadeout */)
	        m.fadespeed= 0.01
	        cn= 2
	        $Alarm4.start((90) / 30.0)
	    }
	    if(cn == 3) {
	        undyne.x= 290
	        undyne.sprite_index= undyne.rsprite
	        undyne.velocity.x= 1
	        undyne.image_speed= 0.1
	        cn= 4
	    }
	    if(cn == 4 and undyne.x > 480) {
	        undyne.velocity.x= 0
	        undyne.image_speed= 0
	        cn= 5
	        $Alarm4.start((90) / 30.0)
	    }
	    if(cn == 6) {
	        undyne.fun= 1
	        undyne.sprite_index= 1464/* spr_undynea_r_raise */
	        undyne.image_speed= 0.2
	        cn= 7
	    }
	    if(cn == 7 and undyne.frame == 2) {
	        undyne.image_speed= 0
	        cn= 8
	        $Alarm4.start((20) / 30.0)
	    }
	    if(cn == 9) {
	        undyne.image_speed= 0.5
	        cn= 10
	    }
	    if(cn == 10) {
	        if(undyne.frame == 2) snd_play(47/* snd_grab */)
	        if(undyne.frame == 5) {
	            undyne.d= 1
	            cn= 11
	            undyne.image_speed= 0
	            $Alarm4.start((60) / 30.0)
	        }
	    }
	    if(cn == 12) {
	        undyne.frame= 2
	        undyne.image_speed= 0.2
	        undyne.sprite_index= 1465/* spr_undynea_r_raiseup */
	        cn= 13
	    }
	    if(cn == 13 and undyne.frame >= 13) {
	        undyne.image_speed= 0
	        cn= 14
	        $Alarm4.start((120) / 30.0)
	    }
	    if(cn == 15) {
	        undyne.image_speed= -1
	        cn= 16
	    }
	    if(cn == 16 and undyne.frame <= 1) {
	        undyne.d= 0
	        undyne.sprite_index= undyne.rsprite
	        undyne.image_speed= 0
	        undyne.frame= 0
	        cn= 17
	        $Alarm4.start((30) / 30.0)
	    }
	    if(cn == 18) {
	        cn= 19
	        $Alarm4.start((40) / 30.0)
	    }
	    if(cn == 20) {
	        cn= 21
	        $Alarm4.start((30) / 30.0)
	    }
	    if(cn == 22) {
	        undyne.sprite_index= undyne.lsprite
	        undyne.velocity.x= -2
	        undyne.image_speed= 0.2
	        cn= 23
	    }
	    if(cn == 23 and undyne.x < 300) {
	        with(undyne) instance_destroy()
	        cn= 24
	        GS.interact= 0
	        GS.flag[17]= 0
	    }
	    if(cn == 24 and (collision_rectangle(200, 100, 220, 900, 1570, 0, 1) or collision_rectangle(780, 100, 790, 900, 1570, 0, 1))) {
	        caster_free(-3)
	        GS.currentsong= caster_load("music/ambientwater.ogg")
	        GS.interact= 1
	        cn= 25
	    }
	    if(cn == 25) {
	        if(obj_mainchara.y > 120) {
	            mkid.y= 100
	            up= 0
	        } else  {
	            mkid.y= 130
	            up= 1
	        }
	        if(obj_mainchara.x < 400) {
	            left= 1
	            mkid.velocity.x= -4
	            mkid.sprite_index= mkid.lsprite
	        } else  {
	            left= 0
	            mkid.velocity.x= 4
	            mkid.sprite_index= mkid.rsprite
	        }
	        cn= 27
	    }
	    if(cn == 27 and abs(mkid.x - obj_mainchara.x) < 45) {
	        mkid.velocity.x= 0
	        cn= 28
	        if(left == 1) mkid.sprite_index= mkid.lsprite
	        if(left == 0) mkid.sprite_index= mkid.rsprite
	        mkid.frame= 0
	        $Alarm4.start((20) / 30.0)
	    }
	    if(cn == 29) {
	        cn= 30
	        if(left == 1) mkid.sprite_index= mkid.rsprite
	        else  mkid.sprite_index= mkid.lsprite
	        $Alarm4.start((20) / 30.0)
	    }
	    if(cn == 31) {
	        if(up == 1) mkid.sprite_index= mkid.usprite
	        if(up == 0) mkid.sprite_index= mkid.dsprite
	        cn= 32
	        $Alarm4.start((20) / 30.0)
	    }
	    if(cn == 33) {
	        if(left == 1) mkid.sprite_index= mkid.ltsprite
	        if(left == 0) mkid.sprite_index= mkid.rtsprite
	        mkid.myinteract= 3
	        GS.typer= 5
	        GS.msc= 0
	        GS.facechoice= 0
	        GS.msg[0]= "* Yo..^1. did you see that!?/"
	        GS.msg[1]= "* Undyne just.../"
	        GS.msg[2]= "* ... TOUCHED ME!/"
	        GS.msg[3]= "* I\'m never washing my face&  ever again...!/"
	        GS.msg[4]= "* Man^1, are you unlucky./"
	        GS.msg[5]= "* If you were standing just&  a LITTLE bit to the left...!/"
	        GS.msg[6]= "* Yo^1, don\'t worry^1!&* I\'m sure we\'ll see her&  again!/%%"
	        if(GS.flag[284] == 1) {
	            GS.msg[4]= "* ... yo^1, did you notice^1?&* She seemed really mad&  about something!/"
	            GS.msg[5]= "* She looked liked she was&  gonna blast me to pieces!/"
	            GS.msg[6]= "* But..^1. sigh..^1.&* Then she decided to put&  me down.../"
	            GS.msg[7]= "* Yo^1!&* There\'s always next time^1,&  right^1? Let\'s go!/%%"
	        }
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        cn= 34
	    }
	    if(cn == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	        mkid.velocity.x= 6
	        mkid.myinteract= 0
	        mkid.image_speed= 0.3
	        mkid.sprite_index= mkid.rsprite
	        cn= 34.1
	        if(left == 1) $Alarm4.start((7) / 30.0)
	        else  $Alarm4.start((12) / 30.0)
	    }
	    if(cn == 35.1) {
	        mkid.velocity.x= 0
	        mkid.fun= 1
	        mkid.frame= 0
	        mkid.image_speed= 0.334
	        mkid.sprite_index= 1389/* spr_mkid_trip_r */
	        cn= 35.2
	    }
	    if(cn == 35.2 and mkid.frame >= 19) {
	        mkid.frame= 0
	        mkid.x+= 13
	        mkid.sprite_index= mkid.rsprite
	        cn= 35.3
	        $Alarm4.start((15) / 30.0)
	    }
	    if(cn == 36.3) {
	        cn= 37
	        mkid.velocity.x= 4
	        $Alarm4.start((30) / 30.0)
	    }
	    if(cn == 38) {
	        GS.interact= 0
	        GS.border= 0
	        GS.flag[15]= 0
	        GS.flag[16]= 0
	        SCR_BORDERSETUP()
	        caster_loop(GS.currentsong, 0.8, 1)
	        cn= 37
	        GS.plot= 110
	        instance_destroy()
	        with(sl1) instance_destroy()
	        with(sl2) instance_destroy()
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
