# Auto-converted from GameMaker: obj_ripoff_toriel
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	GS.faceemotion= 15
	part1= 1679
	mypart1= _spawn("part1", x, y)
	with(part1) z_index= 16
	mypart1.pause= 0
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999999
	sha= 0
	shb= 0
	turns= 0
	mercyno= 0
	talkt= 0
	saved= 0
	totalmercy= 0
	turnoff= 0
	turns= 0
	turnoff= 0
	dont= 0
	ttttt= 0
	st= instance_create(x + 66, y - 30, 1662/* obj_strangetangle */)
	ht= 160
	wd= 150

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_11():
	saved++

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	// obj_dmgwriter
	with(189) instance_destroy()

func _gm_event_2_6():
	blcon= instance_create(x + 140, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(talkt == 0) GS.msg[0]= "This is&for your&own&good."
	if(talkt == 1) GS.msg[0]= "No one&will&leave&again."
	if(talkt == 2) GS.msg[0]= "..."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	GS.msg[1]= "%%%"
	GS.typer= 8
	blconwd= instance_create(blcon.x + 22, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 29
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 30

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
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
	if(GS.mnfight == 3) attacked= 0
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
	        if(mycommand >= 50) {
	            GS.turntimer= 190
	            gen= instance_create(0, 0, 459/* obj_randomhandgen */)
	            gen.factor= 35
	            gen.dmg= 9
	        } else  {
	            GS.turntimer= 180
	            gen= instance_create(0, 0, 470/* obj_cfiregen */)
	            gen.diff= 1
	            gen.dmg= 9
	        }
	        turnoff= 1
	        GS.msg[0]= "* The Lost Souls stand there."
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
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You tell the Lost Soul that&  you have to go if you\'re&  going to free everyone./"
	        GS.msg[1]= "* Something is stirring within&  her.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Something stirs within her..^1.&* It\'s all flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_asgore.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, her memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing her remember you^1, the&  male Lost Soul tried hard&  to remember you^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You refuse to fight the Lost&  Soul./"
	        GS.msg[1]= "* Something about this&  is so familiar to her.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_asgore.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, her memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing her remember you^1, the&  male Lost Soul tried hard&  to remember you^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        GS.msg[0]= "* You hug the Lost Soul and&  tell her that you\'re going&  to see her again./"
	        GS.msg[1]= "* Something about this&  is so familar to her.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_asgore.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, her memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing her remember you^1, the&  male Lost Soul tried hard&  to remember you^1, too!/%%"
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        // obj_monsterparent
	        with(605) totalmercy++
	        mercyno++
	        if(GS.flag[46] == 1)
	            GS.msg[0]= "* You tell the Lost Soul you&  prefer butterscotch instead&  of cinnamon./"
	        if(GS.flag[46] == 0)
	            GS.msg[0]= "* You tell the Lost Soul you&  prefer cinnamon instead&  of butterscotch./"
	        GS.msg[1]= "* Somehow^1, she faintly recalls&  hearing this before.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, her memories&  are flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_asgore.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, her memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing her remember you^1, the&  male Lost Soul tried hard&  to remember you^1, too!/%%"
	            }
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
	if(GS.mnfight == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(saved == 1) {
	        if(GS.hp < GS.maxhp) {
	            GS.hp= GS.maxhp
	            snd_play(155/* snd_heal_c */)
	        }
	        // obj_strangetangle
	        with(1662) instance_destroy()
	        GS.faceemotion= 0
	        instance_create(0, 0, 118/* obj_flasher */)
	        snd_play(30/* snd_break2 */)
	        saved= 2
	        $Alarm11.start((3) / 30.0)
	        // obj_ripoff_asgore
	        with(563) mypart1.face= 0
	    }
	    if(saved == 3) {
	        GS.faceemotion= 0
	        GS.msc= 0
	        GS.typer= 8
	        GS.msg[0]= "Your fate is up to&you now!/%%"
	        scr_blcon_x(160, 20)
	        // obj_ripoff_asgore
	        with(563) {
	            GS.msc= 0
	            GS.typer= 63
	            GS.msg[0]= "You are our future!     /%%"
	            scr_blcon_x(160, 140)
	            blcon.sprite_index= 30/* spr_blconwdshrt_l */
	        }
	        saved= 4
	    }
	    if(saved == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	        instance_create(-10, -10, 557/* obj_screenwhiter */)
	        saved= 5
	        instance_create(0, 0, 557/* obj_screenwhiter */)
	        $Alarm11.start((34) / 30.0)
	    }
	    if(saved == 6) {
	        GS.battlegroup= 256
	        GS.flag[508]= 1
	        room_restart()
	    }
	}
	if(turnoff == 1 and GS.turntimer <= 0) {
	    dont= 0
	    GS.turntimer= -1
	    turnoff= 0
	    GS.mnfight= 3
	    GS.myfight= -1
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
