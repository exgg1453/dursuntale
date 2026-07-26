# Auto-converted from GameMaker: obj_ripoff_papyrus
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 1671
	mypart1= _spawn("part1", x, y)
	mypart1.face= 9
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
	obj_heart.sprite_index= 40/* spr_heartblue */
	turns= 0
	mercyno= 0
	talkt= 0
	saved= 0
	totalmercy= 0
	st= instance_create(x + 54, y + 8, 1662/* obj_strangetangle */)
	ht= 150
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
	blcon= instance_create(x + 120, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(talkt == 0) GS.msg[0]= "I MUST&CAPTURE&A&HUMAN!"
	if(talkt == 1) GS.msg[0]= "THEN&EVERY&ONE&WILL,"
	if(talkt == 2) GS.msg[0]= "..."
	if(talkt == 2) talkt= 0
	if(talkt == 1) talkt= 2
	if(talkt == 0) talkt= 1
	GS.msg[1]= "%%%"
	GS.typer= 22
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 10, 189/* obj_dmgwriter */)
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
	if(GS.mnfight == 3) {
	    attacked= 0
	    obj_heart.movement= 0
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
	        if(turns == 0) {
	            obj_heart.movement= 2
	            obj_heart.velocity.y= -1
	            obj_heart.jumpstage= 2
	            GS.turntimer= 240
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 170, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 170, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 190, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 190, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 320, GS.idealborder[3] - 90, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 480, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 700, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 700, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 700, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 700, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	        }
	        if(turns > 0) {
	            if(mycommand >= 50) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	                GS.turntimer= 220
	                GS.border= 5
	                gen= instance_create(GS.idealborder[1] + 60, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 140, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 220, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 300, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 380, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 540, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 620, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 1250, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -7.5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 1330, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -7.5
	                gen.blue= 0
	            } else  {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	                GS.turntimer= 150
	                GS.border= 5
	                gen= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= 2
	                gen= instance_create(GS.idealborder[0] - 110, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= 2
	                gen= instance_create(GS.idealborder[0] - 210, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= 2
	                gen= instance_create(GS.idealborder[0] - 310, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= 2
	                gen= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -2
	                gen= instance_create(GS.idealborder[1] + 110, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -2
	                gen= instance_create(GS.idealborder[1] + 210, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -2
	                gen= instance_create(GS.idealborder[1] + 310, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -2
	                blt_sizebone.speed= 4
	                GS.turntimer= 150
	            }
	        }
	        turns= 1
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
	        GS.msg[0]= "* You told the Lost Soul a bad&  pun about skeletons./"
	        GS.msg[1]= "* He seems to hate it..^1.&* But the other Lost Soul&  seems to like it./^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Something about that bad&  joke..^1.&* It\'s all flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_sans.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        GS.msg[0]= "* You asked the Lost Soul for&  help with a puzzle./"
	        GS.msg[1]= "* He doesn\'t know why^1, but he&  really wants to help you./^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_sans.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        GS.msg[0]= "* You asked the Lost Soul to&  cook something for you./"
	        GS.msg[1]= "* The Lost Soul is trying to&  hide its joy.../^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Suddenly^1, the memories are&  flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_sans.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	        GS.msg[0]= "* You insulted the Lost Soul./"
	        GS.msg[1]= "* Somehow^1, it seems flattered&  by this./^"
	        if(totalmercy >= 4) {
	            GS.msg[1]= "* Somehow^1, it\'s flattered by&  this..^1. memories&  are flooding back!/%%"
	            saved= 1
	            GS.mnfight= 5
	            if(obj_ripoff_sans.mercyno == 0) {
	                GS.msg[1]= "* Suddenly^1, its memories are&  flooding back!/"
	                GS.msg[2]= "* Seeing how nicely you treated&  its brother^1, the other Lost&  Soul remembers^1, too!/%%"
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
	if(GS.turntimer <= 2 and GS.mnfight == 2) {
	    obj_heart.velocity.y= 0
	    obj_heart.jumpstage= 0
	    GS.turntimer= -1
	    obj_heart.movement= 0
	    obj_heart.gravity= 0
	    obj_heart.velocity.y= 0
	    GS.mnfight= 3
	}
	if(GS.mnfight == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(saved == 1) {
	        if(GS.hp < GS.maxhp) {
	            GS.hp= GS.maxhp
	            snd_play(155/* snd_heal_c */)
	        }
	        // obj_strangetangle
	        with(1662) instance_destroy()
	        instance_create(0, 0, 118/* obj_flasher */)
	        snd_play(30/* snd_break2 */)
	        part1.face= 0
	        // obj_ripoff_sans
	        with(560) mypart1.face= 0
	        saved= 2
	        $Alarm11.start((3) / 30.0)
	    }
	    if(saved == 3) {
	        GS.faceemotion= 9
	        GS.msc= 0
	        GS.typer= 22
	        GS.msg[0]= " NO! WAIT!^1!& YOU\'RE MY FRIEND^1!& I COULD NEVER&  CAPTURE YOU!!/%%"
	        scr_blcon_x(200, 20)
	        // obj_ripoff_sans
	        with(560) {
	            GS.msc= 0
	            GS.typer= 80
	            GS.msg[0]= "nah^1, i\'m rootin for&ya^1, kid.                                 /%%"
	            scr_blcon_x(200, 140)
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
	        GS.flag[507]= 1
	        room_restart()
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
