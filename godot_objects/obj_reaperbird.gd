# Auto-converted from GameMaker: obj_reaperbird
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	// obj_battlebg
	with(185) instance_destroy()
	scr_monstersetup()
	image_speed= 0
	part1= 549
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	turns= 0
	pickon= 0
	mystify= 0
	pray= 0
	xclean= 0
	ht= 200
	wd= 100

func _gm_event_1_0():
	GS.flag[10]= 1
	GS.flag[23]++
	GS.monster[myself]= 0
	with(mypart1) stretchup= 2

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	if(mercymod < 100) {
	    blcon= instance_create(x + 140, y, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    GS.msg[0]= "Don\'t&pick on&me."
	    if(mycommand < 75) GS.msg[0]= "What are&you so&afraid&of?"
	    if(mycommand < 50) GS.msg[0]= "Take&your&last&look."
	    if(mycommand < 25) GS.msg[0]= "You\'ve&seen&enough."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    mycommand= round(random(100))
	    GS.msg[0]= "Robbit,&robbit."
	    if(mycommand < 75) GS.msg[0]= "Shudder,&shudder."
	    if(mycommand < 50) GS.msg[0]= "Creak,&creak."
	    if(mycommand < 25) GS.msg[0]= "Skip,&jump."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    mycommand= round(random(100))
	    GS.msg[0]= "I\'ve&made my&choice."
	    if(mycommand < 75) GS.msg[0]= "Not this&time."
	    if(mycommand < 50) GS.msg[0]= "I\'m not&afraid&of you."
	    if(mycommand < 25) GS.msg[0]= "There\'s&still&hope."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	} else  {
	    blcon= instance_create(x + 140, y, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    GS.msg[0]= "Someone&finally&gets it."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    blcon= instance_create(x + 140, y + 110, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    GS.msg[0]= "Courage&..."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    mycommand= round(random(100))
	    blcon= instance_create(x + 250, y, 186/* obj_blconsm */)
	    gg= floor(random(3))
	    mycommand= round(random(100))
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    GS.msg[0]= "Ribbit&ribbit."
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	}
	mypart1.stretchup= 1
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	// obj_blconsm
	with(186) instance_destroy()
	// OBJ_WRITER
	with(782) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
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
	    attacked= 0
	    mypart1.stretchup= 0
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
	        if(turns > 0) {
	            if(turns == 1) {
	                gen= instance_create(0, 0, 535/* obj_butterflyhead */)
	                gen.dmg= GS.monsteratk[myself]
	                turns= 2
	            } else  {
	                turns= 1
	                gen= instance_create(0, 0, 536/* obj_strangeman_headloss */)
	                gen.dmg= GS.monsteratk[myself]
	            }
	        } else  {
	            GS.turntimer= 250
	            gen= instance_create(0, 0, 538/* obj_strangeman_intro */)
	            gen.dmg= GS.monsteratk[myself]
	            turns= 1
	        }
	        if(mycommand >= 0) GS.msg[0]= "* ,"
	        if(mycommand >= 25) GS.msg[0]= "* ,"
	        if(mycommand >= 50) GS.msg[0]= "* ,"
	        if(mycommand >= 75) GS.msg[0]= "* ,"
	        if(mycommand >= 98) GS.msg[0]= "* Smells like a ,"
	        if(mercymod > 100) GS.msg[0]= "* Reaper Bird seems placated."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Monster has low HP."
	        attacked= 1
	    }
	    if(mercymod == 99999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        if(mercymod < 100) {
	            GS.msc= 0
	            OBJ_WRITER.halt= 3
	            GS.msg[0]= "* ASTIGMATISM " + string(GS.monsteratk[myself]) + " ATK " + string(GS.monsterdef[myself]) + " DEF&* This relentless bully ALWAYS&  gets its way."
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            GS.msg[0]= "* WHIMSALOT " + string(GS.monsteratk[myself]) + " ATK " + string(GS.monsterdef[myself]) + " DEF&* It finally stopped worrying."
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            GS.msg[0]= "* FINAL FROGGIT " + string(GS.monsteratk[myself]) + " ATK " + string(GS.monsterdef[myself]) + " DEF&* Its future looks brighter and&  brighter         ./^"
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            whatiheard= 9
	        } else  {
	            GS.msc= 0
	            OBJ_WRITER.halt= 3
	            GS.msg[0]= "* REAPER BIRD - ATK ?? DEF ??&* This relentless future finally&  looks brighter and brighter./^"
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(pickon == 0)
	            GS.msg[0]= "* You pick on , ^1.&* It seemed effective./^"
	        if(pickon == 1)
	            GS.msg[0]= "* But^1, it was already&  picked on./^"
	        pickon= 1
	        if(pray == 1 and pickon == 1 and mystify == 1) {
	            mercymod= 999999
	            GS.monstername[myself]= "Reaper Bird"
	            GS.msg[0]= "* You pick on Reaper Bird^1.&* Reaper Bird seems to&  remember something./^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(mystify == 0)
	            GS.msg[0]= "* You did something mysterious.&* , recognizes it has more to&  learn from this world./^"
	        if(mystify == 1)
	            GS.msg[0]= "* But^1, it was already&  mystified./^"
	        mystify= 1
	        if(pray == 1 and pickon == 1 and mystify == 1) {
	            mercymod= 999999
	            GS.monstername[myself]= "Reaper Bird"
	            GS.msg[0]= "* You did something mysterious^1.&* Reaper Bird seems to&  remember something./^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You wash your hands^1.&* Nothing happened./^"
	        if(xclean == 1)
	            GS.msg[0]= "* Your hands are clean enough&  to eat!/^"
	        OBJ_WRITER.halt= 3
	        xclean= 1
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 2) {
	        GS.msc= 0
	        GS.msg[0]= "* You hum a familiar tune^1.&* But no one heard you./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 5) {
	        GS.msc= 0
	        if(pray == 0)
	            GS.msg[0]= "* You kneel and pray for safety^1.&* , remembers its conscience./^"
	        if(pray == 1)
	            GS.msg[0]= "* But , already remembered its&  conscience./^"
	        pray= 1
	        if(pray == 1 and pickon == 1 and mystify == 1) {
	            mercymod= 999999
	            GS.monstername[myself]= "Reaper Bird"
	            GS.msg[0]= "* You kneel and pray for safety^1.&* Reaper Bird seems to&  remember something./^"
	        }
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
