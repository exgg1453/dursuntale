# Auto-converted from GameMaker: obj_lemonbread
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	// obj_battlebg
	with(185) instance_destroy()
	scr_monstersetup()
	image_speed= 0
	part1= 529
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 35
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -100
	sha= 0
	shb= 0
	turns= 0
	flex= 0
	hug= 0
	hum= 0
	ht= 200
	wd= 100

func _gm_event_1_0():
	GS.flag[10]= 1
	GS.flag[23]++
	GS.monster[myself]= 0
	with(mypart1) melting= 1

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_7():
	GS.mnfight= 2
	talked= 0

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "But&nobody&came."
	if(mycommand < 75) GS.msg[0]= "Do you&think&I\'m&pretty?"
	if(mycommand < 50) GS.msg[0]= "That\'s&what&they all&say."
	if(mycommand < 25) GS.msg[0]= "Stay&here&with&me..."
	if(turns == 0) {
	    GS.msg[0]= "Welcome&to my&special&hell."
	    turns= 1
	    mycommand= 20
	}
	if(turns == 2) GS.msg[0]= "..."
	if(mercymod > 50000 and turns == 1) {
	    GS.msg[0]= "Life\'s&flashing&before&my teeth"
	    GS.msg[0]= "I\'ve&felt&this&before."
	    turns= 2
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	bx= 0
	by= 0
	repeat(2)  {
	    bx= 0
	    repeat(6)  {
	        blcon= instance_create(10 + bx, 10 + by, 186/* obj_blconsm */)
	        blcon.z_index= 20
	        blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	        blconwd.z_index= 10
	        bx+= 101
	    }
	    by+= 119
	}
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	// OBJ_WRITER
	with(782) instance_destroy()
	with(blcon) instance_destroy()
	// obj_blconsm
	with(186) instance_destroy()
	with(mypart1) event_user(0)
	$Alarm7.start((16) / 30.0)

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 90, 189/* obj_dmgwriter */)
	    dmgwriter.z_index= -30
	    GS.damage= takedamage
	    with(dmgwriter) {
	        dmg= -100
	        special= 1
	    }
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
	    attacked= 0
	    if(mypart1.melting == 3) mypart1.melting= 4
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
	        GS.turntimer= 150
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 60) {
	            gen= instance_create(x, y, 524/* obj_melonbulgen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else  {
	            gen= instance_create(0, 0, 547/* obj_amalgam_biter */)
	            GS.turntimer= 190
	        }
	        if(mycommand >= 0) GS.msg[0]= "* Smells like sweet lemons."
	        if(mycommand >= 90)
	            GS.msg[0]= "* You hear the melody of&  pulsating flesh."
	        if(mercymod > 100) GS.msg[0]= "* Could this be goodbye!?"
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
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* You called for help^1.&* But nobody came./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(hum == 0) {
	            GS.msg[0]= "* You hum a familiar tune^1.&* Lemon Bread\'s body shakes.../^"
	            hum= 1
	        } else 
	            GS.msg[0]= "* You hum a familiar tune^1.&* Nothing else happened./^"
	        if(hum == 1 and hug == 1 and flex == 1) {
	            GS.msg[0]= "* You hum a familiar tune^1.&* Lemon Bread seems to&  remember something./^"
	            mercymod= 99999
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You screamed out^1.&* But nobody came./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(flex == 0) {
	            GS.msg[0]= "* You flexed your arm^1.&* Lemon Bread\'s muscle shakes.../^"
	            flex= 1
	        } else 
	            GS.msg[0]= "* You flexed your arm^1.&* Nothing else happened./^"
	        if(hum == 1 and hug == 1 and flex == 1) {
	            GS.msg[0]= "* You flexed your arm^1.&* Lemon Bread seems to&  remember something./^"
	            mercymod= 99999
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 2) {
	        GS.msc= 0
	        if(hug == 0) {
	            GS.msg[0]= "* You let Lemon Bread be^1.&* Lemon Bread\'s teeth shake.../^"
	            hug= 1
	        } else 
	            GS.msg[0]= "* You let Lemon Bread be^1.&* Nothing else happened./^"
	        if(hum == 1 and hug == 1 and flex == 1) {
	            GS.msg[0]= "* You let Lemon Bread be^1.&* Lemon Bread seems to&  remember something./^"
	            mercymod= 99999
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 5) {
	        GS.msc= 0
	        GS.msg[0]= "* You cried as loud as you&  could^1.&* But nobody came./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
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
