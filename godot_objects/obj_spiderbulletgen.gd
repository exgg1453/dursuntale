# Auto-converted from GameMaker: obj_spiderbulletgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((2) / 30.0)
	type= 0
	dmg= 0
	i= 0
	while(i < 99) {
	    btype[i]= 0
	    i++
	}
	bmax= 0
	bno= 0

func _gm_event_2_2():
	if(btype[bno] == 0) ggg= instance_create(0, 0, 353/* obj_spiderbullet */)
	if(btype[bno] == 1) ggg= instance_create(0, 0, 351/* obj_donutbullet */)
	if(btype[bno] == 2) ggg= instance_create(0, 0, 355/* obj_croissant */)
	if(btype[bno] < 3) {
	    if(bchoice[bno] == 0) ggg.choice= choose(1, 2, 3)
	    else  ggg.choice= bchoice[bno]
	    if(bside[bno] == 2) ggg.side= choose(0, 1)
	    else  ggg.side= bside[bno]
	    ggg.speedfactor= bspeed[bno]
	    ggg.dmg= dmg
	    if(instance_exists(360/* obj_spiderb */) and obj_spiderb.turnamt >= 15) {
	        with(ggg) dmg--
	    }
	}
	if(btype[bno] == 3) {
	    gg1= instance_create(0, 0, 353/* obj_spiderbullet */)
	    gg2= instance_create(0, 0, 353/* obj_spiderbullet */)
	    if(bchoice[bno] == 1) {
	        gg1.choice= 1
	        gg2.choice= 2
	    }
	    if(bchoice[bno] == 2) {
	        gg1.choice= 1
	        gg2.choice= 3
	    }
	    if(bchoice[bno] == 3) {
	        gg1.choice= 2
	        gg2.choice= 3
	    }
	    if(bside[bno] == 2) {
	        gg1.side= choose(0, 1)
	        gg2.side= gg1.side
	    } else  {
	        gg1.side= bside[bno]
	        gg2.side= bside[bno]
	    }
	    gg1.speedfactor= bspeed[bno]
	    gg2.speedfactor= bspeed[bno]
	    gg1.dmg= dmg
	    gg2.dmg= dmg
	    if(instance_exists(360/* obj_spiderb */) and obj_spiderb.turnamt >= 15) {
	        with(gg1) dmg--
	        with(gg2) dmg--
	    }
	}
	if(btime[bno] == 0) btime[bno]= GS.firingrate
	$Alarm2.start((btime[bno]) / 30.0)
	bno++
	if(bno >= bmax) $Alarm2.start((-1) / 30.0)

func _on_destroy():
	if(type == 0 or type == 1 or type == 2) {
	    ch= choose(0, 1, 2)
	    g= instance_create(0, 0, 353/* obj_spiderbullet */)
	    g.choice= ch + 1
	    g.side= 1
	    ch2= choose(0, 1, 2)
	    if(ch2 == ch) ch2++
	    if(ch2 > 2) ch2= 0
	    g2= instance_create(0, 0, 353/* obj_spiderbullet */)
	    g2.choice= ch2 + 1
	    g2.side= 1
	    if(type == 0) {
	        g.speedfactor= 8
	        g2.speedfactor= 8
	        $Alarm0.start((19) / 30.0)
	    }
	    if(type == 1) {
	        g.speedfactor= 11
	        g2.speedfactor= 11
	        $Alarm0.start((16) / 30.0)
	    }
	    if(type == 2) {
	        g.speedfactor= 13
	        g2.speedfactor= 13
	        $Alarm0.start((14) / 30.0)
	    }
	}
	if(type == 3 or type == 4 or type == 5) {
	    g= instance_create(0, 0, 351/* obj_donutbullet */)
	    if(type == 3) {
	        g.speedfactor= 4
	        $Alarm0.start((17) / 30.0)
	    }
	    if(type == 4) {
	        g.speedfactor= 3.5
	        $Alarm0.start((17) / 30.0)
	    }
	    if(type == 5) {
	        g.speedfactor= 3
	        $Alarm0.start((16) / 30.0)
	    }
	}
	if(type == 6 or type == 7 or type == 8) {
	    g= instance_create(0, 0, 355/* obj_croissant */)
	    g.speedfactor= 13
	    g.side= 0
	    if(type == 6) $Alarm0.start((24) / 30.0)
	    if(type == 7) $Alarm0.start((22) / 30.0)
	    if(type == 8) $Alarm0.start((19) / 30.0)
	}
	if(type == 9 or type == 10 or type == 11 or type == 12) {
	    g= instance_create(0, 0, 353/* obj_spiderbullet */)
	    if(type == 9) {
	        $Alarm0.start((15) / 30.0)
	        g.speedfactor= 4
	    }
	    if(type == 10) {
	        $Alarm0.start((9) / 30.0)
	        g.speedfactor= 6
	    }
	    if(type == 11) {
	        $Alarm0.start((8) / 30.0)
	        g.speedfactor= 8
	    }
	    if(type == 12) {
	        $Alarm0.start((7) / 30.0)
	        g.speedfactor= 10
	    }
	}
	if(type == 13 or type == 14 or type == 16) {
	    g= instance_create(0, 0, 354/* obj_vertspider */)
	    g= instance_create(0, 0, 354/* obj_vertspider */)
	    g= instance_create(0, 0, 354/* obj_vertspider */)
	    if(type == 16) obj_vertspider.dmg= dmg - 1
	    if(type == 13) $Alarm0.start((22) / 30.0)
	    if(type == 14) $Alarm0.start((18) / 30.0)
	    if(type == 16) $Alarm0.start((16) / 30.0)
	}
	if(instance_exists(678/* blt_parent */)) {
	    blt_parent.dmg= dmg
	    if(instance_exists(360/* obj_spiderb */) and obj_spiderb.turnamt >= 15)
	        blt_parent.dmg= dmg - 1
	}

func _gm_event_7_13():
	if(type == 0) {
	    scr_sp(0, 8, 1, 1, 0)
	    scr_sp(0, 8, 1, 1, 20)
	    scr_sp(0, 8, 3, 1, 0)
	    scr_sp(0, 8, 3, 1, 20)
	    scr_sp(0, 8, 2, 0, 0)
	    scr_sp(0, 8, 2, 0, 20)
	    scr_sp(0, 8, 3, 0, 0)
	    scr_sp(0, 8, 1, 0, 0)
	    GS.firingrate= 10
	    GS.turntimer-= 30
	}
	if(type == 1) {
	    scr_sp(0, 8, 2, 1, 0)
	    scr_sp(0, 8, 3, 1, 16)
	    scr_sp(0, 8, 1, 1, 0)
	    scr_sp(0, 8, 2, 1, 16)
	    scr_sp(0, 8, 2, 0, 0)
	    scr_sp(0, 8, 1, 0, 16)
	    scr_sp(0, 8, 2, 0, 0)
	    scr_sp(0, 8, 3, 0, 16)
	    scr_sp(0, 8, 2, 1, 0)
	    scr_sp(0, 8, 3, 1, 16)
	    scr_sp(0, 8, 1, 1, 0)
	    scr_sp(0, 8, 2, 1, 16)
	    GS.firingrate= 8
	}
	if(type == 2) {
	    scr_sp(3, 9, 3, 1, 0)
	    scr_sp(0, 9, 1, 1, 16)
	    scr_sp(3, 9, 1, 1, 0)
	    scr_sp(0, 9, 3, 1, 16)
	    scr_sp(0, 9, 2, 0, 16)
	    scr_sp(3, 9, 2, 0, 16)
	    scr_sp(0, 9, 2, 1, 16)
	    scr_sp(3, 9, 2, 1, 16)
	    GS.firingrate= 12
	}
	if(type == 3) {
	    scr_sp(0, 9, 1, 1, 8)
	    scr_sp(0, 9, 3, 1, 8)
	    scr_sp(0, 9, 2, 1, 16)
	    scr_sp(3, 9, 1, 0, 13)
	    scr_sp(3, 9, 3, 0, 13)
	    scr_sp(3, 9, 2, 0, 20)
	    scr_sp(1, 8, 1, 0, 20)
	    scr_sp(1, 8, 3, 0, 20)
	    scr_sp(1, 8, 1, 0, 20)
	    GS.turntimer+= 10
	    GS.firingrate= 14
	}
	if(type == 4) {
	    scr_sp(3, 8, 2, 1, 18)
	    scr_sp(0, 8, 2, 1, 18)
	    scr_sp(3, 9, 2, 1, 15)
	    scr_sp(0, 9, 2, 1, 15)
	    scr_sp(3, 9.5, 2, 1, 14)
	    scr_sp(0, 9.5, 2, 1, 14)
	    scr_sp(3, 10, 2, 1, 13)
	    scr_sp(0, 10, 2, 1, 13)
	    scr_sp(3, 10.5, 2, 1, 12)
	    scr_sp(0, 10.5, 2, 1, 12)
	    scr_sp(3, 11, 2, 1, 11)
	    scr_sp(0, 11, 2, 1, 11)
	    scr_sp(3, 12, 2, 1, 10)
	    scr_sp(0, 12, 2, 1, 10)
	    scr_sp(3, 13, 2, 1, 9)
	    scr_sp(0, 13, 2, 1, 9)
	    scr_sp(3, 13, 2, 1, 9)
	    scr_sp(0, 13, 2, 1, 9)
	    GS.firingrate= 14
	}
	if(type == 5) {
	    scr_sp(3, 10, 2, 1, 0)
	    scr_sp(1, 5, 1, 1, 1)
	    scr_sp(1, 5, 2, 1, 20)
	    scr_sp(3, 10, 0, 0, 0)
	    scr_sp(1, 5, 1, 0, 1)
	    scr_sp(1, 5, 2, 0, 20)
	    scr_sp(3, 10, 3, 1, 0)
	    scr_sp(1, 5, 1, 1, 1)
	    scr_sp(1, 5, 2, 1, 20)
	    scr_sp(3, 10, 2, 0, 0)
	    GS.firingrate= 15
	    GS.turntimer-= 10
	}
	if(type == 6) {
	    scr_sp(0, 11, 1, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    scr_sp(0, 11, 2, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    scr_sp(0, 11, 3, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    scr_sp(0, 11, 2, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    scr_sp(0, 11, 1, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    scr_sp(0, 11, 2, 1, 0)
	    scr_sp(0, 11, 0, 0, 0)
	    GS.firingrate= 10
	    GS.turntimer-= 10
	}
	if(type == 7) {
	    scr_sp(1, 6, 1, 1, 1)
	    scr_sp(1, 6, 3, 1, 1)
	    scr_sp(1, 6, 1, 0, 1)
	    scr_sp(1, 6, 3, 0, 20)
	    scr_sp(0, 12, 1, 1, 0)
	    scr_sp(0, 12, 1, 0, 8)
	    scr_sp(0, 12, 3, 1, 0)
	    scr_sp(0, 12, 3, 0, 8)
	    scr_sp(0, 12, 2, 1, 0)
	    scr_sp(0, 12, 2, 0, 20)
	    scr_sp(2, 13, 2, 0, 0)
	    GS.firingrate= 14
	    GS.turntimer+= 40
	}
	if(type == 8) {
	    scr_sp(2, 13, 1, 0, 1)
	    scr_sp(2, 13, 3, 0, 30)
	    scr_sp(2, 13, 2, 0, 0)
	    scr_sp(2, 13, 1, 1, 1)
	    scr_sp(2, 13, 3, 1, 30)
	    scr_sp(2, 13, 2, 1, 30)
	    GS.turntimer+= 10
	    GS.firingrate= 20
	}
	if(type == 9) {
	    scr_sp(0, 9, 3, 1, 10)
	    scr_sp(3, 9, 1, 1, 15)
	    scr_sp(0, 9.5, 1, 1, 10)
	    scr_sp(3, 9.5, 3, 1, 14)
	    scr_sp(0, 10, 3, 1, 9)
	    scr_sp(3, 10, 1, 1, 13)
	    scr_sp(0, 11, 1, 1, 9)
	    scr_sp(3, 11, 3, 1, 12)
	    scr_sp(0, 12, 3, 1, 8)
	    scr_sp(3, 12, 1, 1, 11)
	    scr_sp(0, 13, 1, 1, 8)
	    scr_sp(3, 13, 3, 1, 18)
	    scr_sp(0, 13, 2, 1, 8)
	    scr_sp(3, 13, 2, 1, 9)
	    scr_sp(0, 13, 2, 1, 8)
	    scr_sp(3, 13, 2, 1, 9)
	    GS.firingrate= 14
	}
	if(type == 10) {
	    scr_sp(0, 12, 3, 1, 0)
	    scr_sp(0, 12, 0, 0, 0)
	    scr_sp(0, 12, 1, 1, 0)
	    scr_sp(0, 12, 0, 0, 0)
	    scr_sp(0, 12, 2, 1, 0)
	    scr_sp(0, 12, 0, 0, 0)
	    scr_sp(0, 12, 3, 1, 0)
	    scr_sp(0, 12, 0, 0, 0)
	    scr_sp(0, 12, 1, 1, 0)
	    scr_sp(0, 12, 0, 0, 0)
	    scr_sp(0, 12, 2, 1, 0)
	    scr_sp(0, 12, 0, 0, 18)
	    scr_sp(3, 12, 2, 1, 1)
	    scr_sp(3, 12, 2, 0, 0)
	    GS.firingrate= 9
	}
	if(type == 11) {
	    scr_sp(1, 8, 1, 0, 1)
	    scr_sp(1, 8, 2, 0, 0)
	    scr_sp(1, 8, 1, 1, 1)
	    scr_sp(1, 8, 2, 1, 0)
	    scr_sp(1, 8, 3, 0, 1)
	    scr_sp(1, 8, 2, 0, 0)
	    scr_sp(1, 8, 3, 1, 1)
	    scr_sp(1, 8, 2, 1, 30)
	    scr_sp(1, 8, 1, 0, 1)
	    scr_sp(1, 8, 3, 0, 0)
	    scr_sp(1, 8, 3, 1, 1)
	    scr_sp(1, 8, 1, 1, 0)
	    GS.firingrate= 20
	}
	if(type == 12) {
	    scr_sp(2, 13, 1, 0, 0)
	    scr_sp(2, 13, 3, 0, 0)
	    scr_sp(2, 13, 2, 0, 0)
	    scr_sp(2, 13, 1, 1, 0)
	    scr_sp(2, 13, 3, 1, 0)
	    scr_sp(2, 13, 2, 1, 0)
	    scr_sp(2, 13, 1, 0, 0)
	    scr_sp(2, 13, 3, 0, 0)
	    scr_sp(2, 13, 2, 0, 0)
	    GS.firingrate= 18
	    GS.turntimer+= 90
	}
	if(type == 13) {
	    scr_sp(3, 5, 2, 1, 0)
	    scr_sp(0, 8, 2, 0, 10)
	    scr_sp(3, 5, 2, 1, 0)
	    scr_sp(0, 8, 2, 0, 10)
	    scr_sp(3, 5, 2, 1, 0)
	    scr_sp(0, 8, 2, 0, 10)
	    scr_sp(3, 5, 2, 1, 0)
	    scr_sp(0, 8, 2, 0, 10)
	    scr_sp(3, 5, 2, 1, 0)
	    scr_sp(0, 8, 2, 0, 10)
	    GS.firingrate= 14
	    GS.turntimer+= 30
	}
	if(type == 14) {
	    scr_sp(1, 6, 1, 0, 1)
	    scr_sp(1, 6, 2, 0, 1)
	    scr_sp(1, 6, 3, 1, 1)
	    scr_sp(1, 6, 2, 1, 38)
	    scr_sp(3, 9, 2, 1, 1)
	    scr_sp(3, 9, 2, 0, 8)
	    scr_sp(3, 9, 2, 1, 40)
	    scr_sp(2, 13, 1, 0, 4)
	    scr_sp(2, 13, 3, 1, 4)
	    scr_sp(2, 13, 3, 0, 4)
	    scr_sp(2, 13, 1, 1, 25)
	    scr_sp(0, 8, 2, 1, 1)
	    scr_sp(0, 8, 2, 0, 15)
	    GS.firingrate= 14
	    GS.turntimer+= 50
	}
	if(type == 15) {
	    scr_sp(3, 10, 1, 1, 0)
	    scr_sp(3, 10, 2, 1, 0)
	    scr_sp(3, 10, 3, 1, 0)
	    scr_sp(3, 10, 2, 1, 0)
	    scr_sp(3, 10.5, 1, 1, 0)
	    scr_sp(3, 10.5, 2, 1, 0)
	    scr_sp(3, 10.5, 3, 1, 0)
	    scr_sp(3, 10.5, 2, 1, 0)
	    scr_sp(3, 11, 1, 1, 0)
	    scr_sp(3, 11, 2, 1, 0)
	    scr_sp(3, 11, 3, 1, 0)
	    scr_sp(3, 11, 2, 1, 0)
	    scr_sp(3, 11.5, 1, 1, 0)
	    scr_sp(3, 11.5, 2, 1, 0)
	    scr_sp(3, 12, 3, 1, 0)
	    scr_sp(3, 12, 2, 1, 0)
	    scr_sp(3, 12, 1, 1, 0)
	    scr_sp(3, 12, 2, 1, 0)
	    scr_sp(3, 12, 3, 1, 0)
	    GS.firingrate= 9
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
