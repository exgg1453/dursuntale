# Auto-converted from GameMaker: obj_undynea_chaser
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	STOPPER= 0
	image_speed= 0.334
	dsprite= 1427
	usprite= 1432
	lsprite= 1426
	rsprite= 1425
	dtsprite= 1427
	utsprite= 1432
	ltsprite= 1426
	rtsprite= 1425
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0
	con= 0
	active= 1
	new= 1
	sans= 0
	if(GS.flag[67] == 1) sans= 1
	if(room == 134) new= 0
	i= 0
	while(i < 60) {
	    rememberx[i]= x
	    remembery[i]= y
	    i++
	}
	GS.flag[17]= 1
	if(GS.plot > 121) instance_destroy()
	if(room == 135) {
	    if(GS.entrance == 1) y= obj_mainchara.y + 100
	    if(GS.entrance == 2) y= obj_mainchara.y - 100
	}
	if(room == 136) {
	    if(GS.entrance == 1) x= obj_mainchara.x - 100
	    if(GS.entrance == 2) x= obj_mainchara.x + 100
	}
	if(room == 137) {
	    if(GS.entrance == 1) x= obj_mainchara.x - 60
	    if(GS.entrance == 2) x= obj_mainchara.x + 60
	}

func _gm_event_1_0():
	GS.flag[17]= 0
	if(GS.flag[7] == 0) audio_stop_all()

func _gm_event_2_4():
	con++

func _process(delta: float):
	GS.flag[17]= 1
	if(STOPPER == 0) {
	    if(d == 0) scr_depth()
	    if(fun == 0) {
	        myinteract= 0
	        if(speed == 0) {
	            frame= 0
	            image_speed= 0
	        }
	        if(speed > 0) {
	            image_speed= 0.2
	            if(frame == 1 or frame == 3) snd_play(16/* snd_undynestep */)
	        }
	    }
	    if(fun == 3 and (frame == 1 or frame == 3))
	        snd_play(16/* snd_undynestep */)
	    if(con == 0) {
	        $Alarm4.start((32) / 30.0)
	        con= 1
	        if(new == 1) {
	            $Alarm4.start((20) / 30.0)
	            blc= instance_create(999, 999, 1337/* obj_cosmeticblcon */)
	            new= 0
	            con= 3
	        }
	    }
	    if(con == 2) {
	        blc= instance_create(x, y, 1337/* obj_cosmeticblcon */)
	        snd_play(29/* snd_b */)
	        con= 3
	        $Alarm4.start((25) / 30.0)
	    }
	    if(con == 4 and room != 137) {
	        with(blc) instance_destroy()
	        spd= 5
	        if(GS.flag[99] > 3) spd= 4
	        move_towards_point(obj_mainchara.x - 4, obj_mainchara.y - 20, spd)
	        if(abs(velocity.y) > abs(velocity.x)) {
	            if(velocity.y < 0) sprite_index= usprite
	            else  sprite_index= dsprite
	        } else  {
	            if(velocity.x < 0) sprite_index= lsprite
	            else  sprite_index= rsprite
	        }
	    }
	    if(con == 4 and room == 137) {
	        with(blc) instance_destroy()
	        if(obj_mainchara.x > x + 20) {
	            velocity.x= 3
	            image_speed= 0.2
	            sprite_index= rsprite
	        }
	        if(obj_mainchara.x <= x + 20) {
	            velocity.x= -3
	            image_speed= 0.2
	            sprite_index= lsprite
	        }
	        if(x > 140 and x < 160 and sans == 0) {
	            con= 8
	            sans= 1
	        }
	    }
	    if(active == 1 and GS.interact == 0 and collision_rectangle(x + 6, y + sprite_height - 20, x + sprite_width - 6, y + sprite_height - 2, 1570, 0, 1)) {
	        speed= 0
	        con= 5
	    }
	    if(active == 1 and GS.interact == 0 and room == 137 and collision_rectangle(x + 6, y + sprite_height + 60, x + sprite_width - 6, y + sprite_height - 80, 1570, 0, 1)) {
	        speed= 0
	        con= 5
	    }
	    if(con == 5) {
	        $Alarm4.start((-1) / 30.0)
	        active= 0
	        speed= 0
	        GS.interact= 1
	        con= 6
	        GS.border= 12
	        GS.battlegroup= 47
	        GS.mercy= 1
	        instance_create(0, 0, 142/* obj_battler */)
	        talkedto= 0
	    }
	    if(con == 6 and GS.interact == 0) {
	        active= 1
	        con= 0
	        if(room == 134) {
	            if(obj_mainchara.y > 600) y= 500
	            else  y= 640
	            x= 160
	        }
	        if(room == 135) {
	            if(GS.entrance == 1) y= obj_mainchara.y + 130
	            if(GS.entrance == 2) y= obj_mainchara.y - 100
	        }
	        if(room == 136) {
	            if(GS.entrance == 1) x= obj_mainchara.x - 100
	            if(GS.entrance == 2) x= obj_mainchara.x + 100
	        }
	        if(room == 137) {
	            if(GS.entrance == 1) x= obj_mainchara.x - 60
	            if(GS.entrance == 2) x= obj_mainchara.x + 60
	        }
	        if(GS.flag[350] == 1) {
	            GS.mercy= 0
	            caster_free(-3)
	            GS.plot= 122
	            instance_destroy()
	        }
	    }
	    if(con == 8) {
	        velocity.x= 0
	        con= 9
	        $Alarm4.start((15) / 30.0)
	    }
	    if(con == 10) {
	        sprite_index= usprite
	        con= 11
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 12) {
	        sprite_index= 1430/* spr_undyne_helmet_d_pissed */
	        image_speed= 0.2
	        con= 13
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 14) {
	        sans= 1
	        con= 4
	        active= 1
	    }
	    if(con == 20 and distance_to_object(1570) < 60) {
	        speed= 0
	        frame= 0
	        image_speed= 0
	        active= 0
	        con= 21
	    }
	    if(not instance_exists(782/* OBJ_WRITER */) and con == 21) {
	        active= 1
	        con= 4
	    }
	    if(active == 4) {
	        rememberx[i]= x
	        remembery[i]= y
	        i= 60
	        while(i > 0) {
	            rememberx[i]= rememberx[i - 1]
	            remembery[i]= remembery[i - 1]
	            i--
	        }
	    }
	    if(GS.flag[350] == 1 and STOPPER == 0) {
	        GS.mercy= 0
	        caster_free(-3)
	        audio_stop_all()
	        GS.plot= 122
	        GS.interact= 0
	        STOPPER= 1
	        visible= 0
	        con= 40
	        $Alarm4.start((2) / 30.0)
	    }
	}
	if(con == 41) {
	    GS.flag[17]= 0
	    audio_stop_all()
	    instance_destroy()
	}

func _gm_event_7_5():
	if(GS.entrance == 1 or GS.entrance == 2) GS.flag[17]= 0

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
