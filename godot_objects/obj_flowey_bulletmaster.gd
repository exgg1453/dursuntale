# Auto-converted from GameMaker: obj_flowey_bulletmaster
extends Node2D

func _ready():
	timer= 0
	maxtimer= 754
	if(GS.battlephase == 1 or GS.battlephase == 5) maxtimer= 678
	soultimer= 0
	soulmax= 460
	active= 0
	attacktimer= 0
	attacktimermax= 9999
	attackno= 0
	save_attackno= 0
	attackid[0]= 7
	attackid[1]= 7
	attackid[2]= 7
	$Alarm0.start((1) / 30.0)
	phase_1= 0
	phase_s= 0
	ourattack= 1287248374
	overtype= 0
	unhinged= 0
	atimer= -1
	if(GS.battlephase == 0) {
	    // obj_flowey_master
	    with(1585) {
	        fileset= 3
	        savetimer= 20
	    }
	}
	if(GS.battlephase == 0 or GS.battlephase == 3) {
	    // obj_flowey_master
	    with(1585) caster_play(mus_phase[0], 1, 1)
	    atimer= 200 + floor(random(200))
	}
	if(GS.battlephase == 1 or GS.battlephase == 5) {
	    // obj_flowey_master
	    with(1585) caster_play(mus_phase[1], 1, 1)
	    atimer= 200 + floor(random(180))
	}
	if(GS.battlephase == 2 or GS.battlephase == 4) {
	    maxtimer= 500
	    overtype= 1
	    // obj_flowey_master
	    with(1585) {
	        mustype= 3
	        caster_loop(mus_repeat1, 1, 1)
	    }
	}
	if(GS.battlephase == 6) {
	    $Alarm8.start((150) / 30.0)
	    // obj_floweybodyparent
	    with(1586) {
	        wimpy= 1
	        desperate= 0
	    }
	    maxtimer= 9999999
	    atimer= 160
	    // obj_flowey_master
	    with(1585) {
	        mustype= 4
	        caster_play(mus_finale2, 1, 1)
	    }
	    $Alarm6.start((1214) / 30.0)
	}

func _gm_event_2_8():
	hl= instance_create(260 + random(100), 180, 1606/* obj_6heal */)
	$Alarm8.start((170 + random(20)) / 30.0)
	if(unhinged == 1) $Alarm8.start((145 + random(10)) / 30.0)

func _gm_event_2_7():
	// obj_flowey_master
	with(1585) {
	    if(megadamage < 4) megadamage++
	}
	$Alarm7.start((900) / 30.0)

func _gm_event_2_6():
	if(GS.battlephase == 6) {
	    unhinged= 1
	    maxtimer= 9999999
	    // obj_flowey_master
	    with(1585) {
	        megadamage= 1
	        mustype= 5
	        caster_loop(mus_finale3, 1, 1)
	    }
	    $Alarm7.start((900) / 30.0)
	    // obj_floweybodyparent
	    with(1586) {
	        desperate= 1
	        wimpy= 0
	    }
	}

func _gm_event_2_5():
	// obj_flowey_fightbt
	with(1596) instance_destroy()

func _gm_event_2_4():
	phase_s++

func _on_destroy():
	event_user(1)

func _process(delta: float):
	if(active == 1) {
	    attacktimer++
	    timer++
	    if(attacktimer >= attacktimermax) {
	        // obj_fx_bgen
	        with(1583) event_user(2)
	        attacktimer= -100
	        if(timer < maxtimer - 70) {
	            attacktimer= -100
	            event_user(1)
	        }
	    }
	    if(timer == atimer) {
	        fightbt= instance_create(320, 420, 1596/* obj_flowey_fightbt */)
	        $Alarm5.start((110) / 30.0)
	        if(GS.battlephase == 6) {
	            $Alarm5.start((79) / 30.0)
	            atimer+= 80
	        }
	    }
	    if(timer >= maxtimer and phase_s == 0 and GS.battlephase < 6) {
	        if(instance_exists(1596/* obj_flowey_fightbt */)) {
	            // obj_flowey_fightbt
	            with(1596) instance_destroy()
	        }
	        phase_s= 1
	        $Alarm4.start((155) / 30.0)
	        // obj_flowey_master
	        with(1585) {
	            if(mustype == 3) {
	                caster_stop(-3)
	                caster_play(mus_endnote, 1, 1)
	                mustype= 0
	            }
	            caster_play(mus_alarm, 1, 1)
	        }
	        // obj_floweyx_tv
	        with(1587) tvmode= 1
	        if(GS.soul_rescue == 0) {
	            // obj_floweypipetest
	            with(1593) flash= 1
	        }
	        if(GS.soul_rescue == 1) {
	            // obj_floweypipetest
	            with(1593) flash= 2
	        }
	        if(GS.soul_rescue == 2) {
	            // obj_floweypipetest_2
	            with(1594) flash= 1
	        }
	        if(GS.soul_rescue == 3) {
	            // obj_floweypipetest_2
	            with(1594) flash= 2
	        }
	        if(GS.soul_rescue == 4) {
	            // obj_floweypipetest_3
	            with(1595) flash= 1
	        }
	        if(GS.soul_rescue == 5) {
	            // obj_floweypipetest_3
	            with(1595) flash= 2
	        }
	    }
	    if(phase_s == 2) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 2
	        // obj_vsflowey_heart
	        with(1581) move= 0
	        // obj_flowey_master
	        with(1585) {
	            caster_stop(-3)
	            caster_loop(mus_noise, 1, 1)
	            event_user(6)
	        }
	        idealhx= 314
	        idealhy= 400
	        if(GS.soul_rescue == 2) idealhy= 450
	        nowhx= obj_vsflowey_heart.x
	        nowhy= obj_vsflowey_heart.y
	        nowhxadd= (idealhx - nowhx) / 40
	        nowhyadd= (idealhy - nowhy) / 40
	        phase_s= 3
	        $Alarm4.start((40) / 30.0)
	    }
	    if(phase_s == 3) {
	        obj_vsflowey_heart.x+= nowhxadd
	        obj_vsflowey_heart.y+= nowhyadd
	    }
	    if(phase_s == 4) {
	        obj_vsflowey_heart.x= idealhx
	        obj_vsflowey_heart.y= idealhy
	        obj_vsflowey_heart.move= 1
	        // obj_floweyx_tv
	        with(1587) tvmode= 3
	        // obj_flowey_master
	        with(1585) {
	            caster_stop(-3)
	            caster_loop(mus_soul[GS.soul_rescue], 1, 1)
	        }
	        if(GS.soul_rescue == 0) instance_create(0, 0, 1626/* obj_6knife_act */)
	        if(GS.soul_rescue == 1) {
	            instance_create(get_viewport_rect().size.x * 0.5, 0, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 0, -120, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 1, -120, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 0.5, -400, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 0, -520, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 1, -520, 1617/* obj_6glove_boss */)
	            lg= instance_create(get_viewport_rect().size.x * 0.5, -800, 1617/* obj_6glove_boss */)
	            with(lg) event_user(6)
	            instance_create(get_viewport_rect().size.x * 0, -920, 1617/* obj_6glove_boss */)
	            instance_create(get_viewport_rect().size.x * 1, -920, 1617/* obj_6glove_boss */)
	        }
	        if(GS.soul_rescue == 2) instance_create(0, 0, 1614/* obj_6shoe_master */)
	        if(GS.soul_rescue == 3) instance_create(0, 0, 1624/* obj_6book_master */)
	        if(GS.soul_rescue == 4) {
	            instance_create(190, 260, 1619/* obj_6pan */)
	            ppp= instance_create(415, 260, 1619/* obj_6pan */)
	            ppp.spec= 1
	            instance_create(640, 260, 1619/* obj_6pan */)
	        }
	        if(GS.soul_rescue == 5)
	            instance_create(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2, 1609/* obj_6gun */)
	        if(GS.soul_rescue > 5) instance_create(0, 0, 1626/* obj_6knife_act */)
	        phase_s= 5
	    }
	    if(phase_s == 5) {
	        soultimer++
	        if(soultimer >= soulmax) {
	            idealhx= 314
	            idealhy= 400
	            if(GS.soul_rescue == 6) idealhy= 280
	            nowhx= obj_vsflowey_heart.x
	            nowhy= obj_vsflowey_heart.y
	            nowhxadd= (idealhx - nowhx) / 40
	            nowhyadd= (idealhy - nowhy) / 40
	            obj_vsflowey_heart.move= 0
	            // obj_floweyx_tv
	            with(1587) tvmode= 2
	            // obj_6parent
	            with(1601) instance_destroy()
	            // obj_flowey_master
	            with(1585) {
	                caster_stop(-3)
	                caster_loop(mus_noise, 1, 1)
	            }
	            phase_s= 6
	            $Alarm4.start((20) / 30.0)
	            // obj_floweypipetest
	            with(1593) flash= 0
	            // obj_floweypipetest_2
	            with(1594) flash= 0
	            // obj_floweypipetest_3
	            with(1595) flash= 0
	            if(GS.soul_rescue == 6) {
	                phase_s= 20
	                $Alarm4.start((40) / 30.0)
	            }
	            GS.battlephase++
	            if(GS.battlephase >= 6) GS.battlephase= 0
	        }
	    }
	    if(phase_s == 6 or phase_s == 8) {
	        obj_vsflowey_heart.x+= nowhxadd
	        obj_vsflowey_heart.y+= nowhyadd
	    }
	    if(phase_s == 7) {
	        // obj_flowey_master
	        with(1585) event_user(6)
	        phase_s= 8
	        $Alarm4.start((20) / 30.0)
	    }
	    if(phase_s == 9) {
	        obj_vsflowey_heart.x= idealhx
	        obj_vsflowey_heart.y= idealhy
	        obj_vsflowey_heart.move= 1
	        phase_s= 10
	    }
	    if(phase_s == 10) {
	        // obj_floweyx_tv
	        with(1587) tvmode= 0
	        // obj_flowey_master
	        with(1585) caster_stop(-3)
	        instance_create(0, 0, 1584/* obj_flowey_bulletmaster */)
	        instance_destroy()
	    }
	    if(phase_s == 20 or phase_s == 24 or phase_s == 26) {
	        obj_vsflowey_heart.x+= nowhxadd
	        obj_vsflowey_heart.y+= nowhyadd
	    }
	    if(phase_s == 21) {
	        obj_vsflowey_heart.x= idealhx
	        obj_vsflowey_heart.y= idealhy
	        obj_vsflowey_heart.move= 1
	        // obj_floweyx_tv
	        with(1587) tvmode= 5
	        caster_stop(-3)
	        instance_create(0, 0, 1603/* obj_6soul_helpcutscene */)
	        // obj_flowey_master
	        with(1585) caster_play(mus_finale1_l, 1, 1)
	        $Alarm4.start((308) / 30.0)
	        $Alarm4.start((615) / 30.0)
	        phase_s= 22
	    }
	    if(phase_s == 23) {
	        idealhx= 314
	        idealhy= 400
	        nowhx= obj_vsflowey_heart.x
	        nowhy= obj_vsflowey_heart.y
	        nowhxadd= (idealhx - nowhx) / 40
	        nowhyadd= (idealhy - nowhy) / 40
	        obj_vsflowey_heart.move= 0
	        // obj_floweyx_tv
	        with(1587) tvmode= 2
	        // obj_flowey_master
	        with(1585) caster_loop(mus_noise, 1, 1)
	        phase_s= 24
	        $Alarm4.start((20) / 30.0)
	        GS.battlephase= 6
	    }
	    if(phase_s == 25) {
	        // obj_flowey_master
	        with(1585) event_user(6)
	        phase_s= 26
	        $Alarm4.start((20) / 30.0)
	    }
	    if(phase_s == 27) {
	        obj_vsflowey_heart.x= idealhx
	        obj_vsflowey_heart.y= idealhy
	        obj_vsflowey_heart.move= 1
	        phase_s= 10
	        GS.msg[0]= "* Flowey\'s DEFENSE&  dropped to 0^4! %%"
	        GS.msg[2]= "%%%"
	        GS.typer= 70
	        instance_create(180, 300, 1598/* obj_flowey_writer */)
	        // obj_floweybodyparent
	        with(1586) desperate= 0
	        // obj_floweybodyparent
	        with(1586) wimpy= 1
	    }
	    if(timer > maxtimer + 120) {
	        if(instance_exists(1627/* obj_floweybullet_parent */)) {
	            // obj_floweybullet_parent
	            with(1627) instance_destroy()
	        }
	        // obj_floweyx_flipeye
	        with(1589) {
	            md= 0
	            con= 0
	        }
	        // obj_floweyx_lefteye
	        with(1591) {
	            md= 0
	            con= 0
	        }
	    }
	}

func _gm_event_7_11():
	if(overtype == 1) {
	    newattack= choose(20, 21)
	    if(newattack == attackid[1]) newattack= choose(20, 21)
	}
	if(overtype == 0) {
	    newattack= choose(1, 2, 3, 4, 5, 6, 7, 8, 9)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(1, 2, 3, 4, 5, 6, 7, 8, 9)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(1, 2, 3, 4, 5, 6, 7, 8, 9)
	}
	if(GS.battlephase == 0) {
	    newattack= choose(1, 2, 3, 4, 9)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(1, 2, 3, 4, 9)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(1, 2, 3, 4, 9)
	}
	if(GS.battlephase == 1) {
	    newattack= choose(3, 5, 6, 7, 8)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(3, 5, 6, 7, 8)
	    if(newattack == attackid[1] or newattack == attackid[2])
	        newattack= choose(3, 5, 6, 7, 8)
	}
	if(GS.battlephase == 6 and unhinged == 0)
	    newattack= choose(23, 22)
	ourattack= instance_create(x, y, 1583/* obj_fx_bgen */)
	ourattack.attack= newattack
	attackid[2]= attackid[1]
	attackid[1]= attackid[0]
	attackid[0]= newattack
	active= 1
	attacktimermax= 150
	if(newattack == 1) attacktimermax= 90 + floor(random(30))
	if(newattack == 2) attacktimermax= 80 + floor(random(25))
	if(newattack == 3) attacktimermax= 70 + floor(random(25))
	if(newattack == 4) attacktimermax= 110
	if(newattack == 5) attacktimermax= 110
	if(newattack == 6) attacktimermax= 130
	if(newattack == 7) attacktimermax= 130
	if(newattack == 8) attacktimermax= 110
	if(newattack == 9) attacktimermax= 95
	if(newattack == 20) attacktimermax= 90
	if(newattack == 21) attacktimermax= 90
	if(newattack == 22) attacktimermax= 80
	if(newattack == 22) attacktimermax= 100
	if(unhinged == 1) {
	    attacktimermax-= 10
	    if(newattack == 9) attacktimermax= 95
	}
	attacktimer= 0

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
