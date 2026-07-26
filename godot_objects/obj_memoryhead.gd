# Auto-converted from GameMaker: obj_memoryhead
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 553
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 53
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999
	sha= 0
	shb= 0
	turns= 0
	coherent= 0
	ds[0]= caster_load("music/dialup/dialup_0.ogg")
	ds[1]= caster_load("music/dialup/dialup_1.ogg")
	ds[2]= caster_load("music/dialup/dialup_2.ogg")
	ds[3]= caster_load("music/dialup/dialup_3.ogg")
	ds[4]= caster_load("music/dialup/dialup_4.ogg")
	ds[5]= caster_load("music/dialup/dialup_5.ogg")
	ht= 100
	wd= 100

func _gm_event_1_0():
	GS.flag[10]= 1
	GS.flag[23]++
	GS.monster[myself]= 0
	with(mypart1) {
	    mega= 1
	    on= 1
	    $Alarm0.start((-1) / 30.0)
	    $Alarm1.start((-1) / 30.0)
	    $Alarm2.start((-1) / 30.0)
	}

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 95, y - 10, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(coherent == 1) {
	    GS.msg[0]= "Come&join&the&fun."
	    if(mycommand < 75) GS.msg[0]= "It\'s a&real&get&together"
	    if(mycommand < 50) GS.msg[0]= "Lorem&ipsum&docet"
	    if(mycommand < 25) GS.msg[0]= "Become&one of&us!"
	    if(turns == 0) GS.msg[0]= "Come&join&the&fun."
	    turns++
	}
	if(whatiheard == 1) {
	    GS.msg[0]= "That\'s&a&shame."
	    if(mycommand > 33) GS.msg[0]= "Oh&well."
	    if(mycommand > 66) GS.msg[0]= "Be&seeing&you."
	}
	if(whatiheard == 3) {
	    GS.msg[0]= "Then,&hold&still."
	    if(mycommand > 33) GS.msg[0]= "Just&a&moment."
	    if(mycommand > 66) GS.msg[0]= "You\'ll&be with&us&shortly."
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	if(coherent == 1)
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	else  {
	    sq= instance_create(blcon.x + 15, blcon.y + 10, 540/* obj_insanesq */)
	    dd= floor(random(6))
	    dnoise= caster_loop(ds[dd], 0.3, 0.9 + random(0.2))
	    caster_set_panning(dnoise, 0.1 + random(0.8))
	}
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	// OBJ_WRITER
	with(782) instance_destroy()
	// obj_insanesq
	with(540) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	if(coherent == 0) caster_stop(dnoise)
	GS.mnfight= 2
	with(mypart1) event_user(0)

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= 0
	    with(dmgwriter) dmg= 0
	    dmgwriter.special= 1
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) {
	    with(object_index) {
	        attacked= 0
	        with(mypart1) {
	            if(mega == 4) mega= 2
	        }
	    }
	}
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 200
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 0) {
	            // obj_freakbulletgen
	            with(541) instance_destroy()
	            gen= instance_create(x, y, 541/* obj_freakbulletgen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else 
	            gen= instance_create((GS.idealborder[0] + GS.idealborder[1]) / 2 - 30, GS.idealborder[2] + 2, 331/* obj_vulkincloudbul */)
	        if(mycommand >= 0) GS.msg[0]= "* But nobody came."
	        if(mycommand >= 25) GS.msg[0]= "* But nobody came."
	        if(mycommand >= 50) GS.msg[0]= "* But nobody came."
	        if(mycommand >= 75) GS.msg[0]= "* But nobody came."
	        if(mycommand >= 95) GS.msg[0]= "* Smells like batteries."
	        if(mercymod > 100)
	            GS.msg[0]= "* Seems like it doesn\'t&  care anymore."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Monster has low HP."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(coherent == 0) {
	        if(whatiheard == 0) {
	            GS.msc= 0
	            GS.msg[0]= "* No data available./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            whatiheard= 9
	        }
	        if(whatiheard == 3) {
	            GS.msc= 0
	            scr_itemget(54)
	            if(noroom == 0)
	                GS.msg[0]= "* The enemy put a piece of&  itself in your inventory./^"
	            if(noroom == 1) GS.msg[0]= "* But your inventory was full./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 1) {
	            GS.msc= 0
	            GS.msg[0]= "* AT - " + string(GS.at + GS.wstrength) + " DF - " + string(GS.df + GS.adef) + " /^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 4) {
	            GS.msc= 0
	            GS.msg[0]= "* You take out your CELL PHONE^1.&* You can hear voices through&  the receiver...!/^"
	            with(object_index) {
	                coherent= 1
	                GS.monstername[myself]= "Memoryhead"
	            }
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    } else  {
	        if(whatiheard == 0) {
	            GS.msc= 0
	            GS.msg[0]= "* MEMORYHEAD/^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            whatiheard= 9
	        }
	        if(whatiheard == 3) {
	            GS.myfight= 0
	            GS.mnfight= 1
	        }
	        if(whatiheard == 1) {
	            GS.myfight= 0
	            GS.mnfight= 1
	            object_index.mercymod= 999998
	        }
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
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
