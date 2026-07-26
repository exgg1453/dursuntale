# Auto-converted from GameMaker: obj_battlecontroller
extends Node2D

func _ready():
	SCR_BORDERSETUP(0, 0, 0, 0, 0)
	scr_battlegroup(0, 0, 0, 0, 0)
	GS.mercyuse= -1
	GS.inbattle= 1
	GS.itemused= 0
	GS.flag[271]= 0
	runaway= 0
	GS.msg[4]= GS.msg[0]
	if(GS.actfirst == 0 and GS.extraintro == 0) {
	    GS.myfight= 0
	    GS.mnfight= 0
	    GS.typer= 1
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	}
	GS.turn= 0
	GS.turntimer= -1
	won= 0
	GS.heard= 0
	GS.tmsg= "%%%"
	if(GS.lv > 20) GS.lv= 20
	GS.maxhp= 16 + GS.lv * 4
	if(GS.hp > GS.maxhp + 15) GS.hp= GS.maxhp + 15
	GS.at= 8 + GS.lv * 2
	GS.df= 9 + ceil(GS.lv / 4)
	if(GS.lv == 20) {
	    GS.at= 30
	    GS.df= 30
	    GS.maxhp= 99
	}
	tempat= GS.at
	tempdf= GS.df
	tempspd= GS.sp
	active= 0
	$Alarm0.start((3) / 30.0)
	healed= 0
	drawrect= 1
	drawbinfo= 1
	rearrange= 0

func _on_destroy():
	active= 1

func _process_begin(delta: float):
	if(keyboard_multicheck(0/* NOKEY */) == 1) event_user(0)

func _process(delta: float):
	SCR_BORDERSETUP(0, 0, 0, 0, 0)
	currentplace= GS.bmenuno
	if(GS.monster[0] == 0 and GS.monster[1] == 0 and GS.monster[2] == 0 and won == 0) {
	    won= 1
	    GS.xp+= GS.xpreward[3]
	    GS.gold+= GS.goldreward[3]
	    tlvl= GS.lv
	    script_execute(55/* scr_levelup */)
	    if(GS.flag[15] == 0) {
	        caster_stop(GS.batmusic)
	        caster_free(GS.batmusic)
	    }
	    GS.msg[0]= "* YOU WON!&* You earned "
	    GS.msg[0]+= string(GS.xpreward[3]) + " XP and "
	    GS.msg[0]+= string(GS.goldreward[3]) + " gold."
	    if(tlvl != GS.lv) {
	        GS.msg[0]+= "&* Your LOVE increased."
	        snd_play(49/* snd_levelup */)
	    }
	    GS.msg[0]+= "/%"
	    if(GS.extraintro == 2) {
	        GS.typer= 5
	        caster_free(GS.currentsong)
	        _stop_sound("234")
	        GS.currentsong= caster_load("music/toomuch.ogg")
	        caster_loop(GS.currentsong, 1, 1)
	        GS.flag[221]= 1
	        GS.msg[0]= GS.msg[2]
	        GS.myfight= 0
	        GS.mnfight= 2
	        obj_heart.x= -200
	    }
	    GS.msc= 0
	    instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    exit
	} else  {
	    GS.inv= 30
	    if(instance_exists(282/* obj_undyne_ex */)) GS.inv= 30 - GS.lv
	    if(instance_exists(360/* obj_spiderb */) and GS.armor != 44)
	        GS.inv+= 20
	    if(GS.armor == 44) GS.inv+= 30
	    if(GS.armor == 64) GS.inv+= 15
	    if(GS.weapon == 45) GS.inv+= 15
	    if(GS.inv < 15) GS.inv= 15
	    if(GS.armor == 46 or GS.armor == 64) {
	        if(GS.mnfight == 0 and GS.myfight == 0) {
	            if((GS.turn + 1) % 2 == 0 and healed == 0) {
	                healed= 1
	                if(GS.hp < GS.maxhp) GS.hp++
	                snd_play(109/* snd_power */)
	            }
	        } else  healed= 0
	    }
	    if(GS.mnfight == 0 and GS.myfight == 0) {
	        GS.typer= 1
	        if(active == 1 and keyboard_multicheck_pressed(16/* SHIFT */) == 0 and keyboard_multicheck_pressed(13/* ENTER */)) {
	            if(GS.bmenuno == 0) {
	                GS.talked= -1
	                GS.bmenucoord[2]= 0
	                GS.bmenuno= GS.bmenucoord[0] + 1
	                if(instance_exists(751/* obj_talkbt */) and obj_talkbt.spec == 1 and GS.bmenuno == 2) {
	                    GS.rmsg= GS.msg[0]
	                    GS.mytarget= 0
	                    // OBJ_WRITER
	                    with(782) halt= 3
	                    // OBJ_INSTAWRITER
	                    with(785) halt= 3
	                    GS.bmenuno= 10
	                    GS.msc= 1000 + GS.monstertype[GS.mytarget]
	                    instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	                    keyboard_clear(13/* ENTER */)
	                    SCR_TEXT(GS.msc)
	                    if(GS.choices[GS.bmenucoord[2]] == 0) GS.bmenucoord[2]= 0
	                }
	                if(GS.bmenuno == 1 or GS.bmenuno == 2 or GS.bmenuno == 11) {
	                    GS.msc= 3
	                    if(GS.monster[GS.bmenucoord[1]] == 0)
	                        GS.bmenucoord[1]++
	                    if(GS.monster[GS.bmenucoord[1]] == 0)
	                        GS.bmenucoord[1]++
	                    if(GS.monster[0] == 0 and GS.monster[2] == 0)
	                        GS.bmenucoord[1]= 1
	                    if(GS.bmenucoord[1] > 2) {
	                        GS.bmenucoord[1]= 0
	                        if(GS.monster[0] == 0) GS.bmenucoord[1]= 1
	                        if(GS.monster[1] == 0) GS.bmenucoord[1]= 2
	                        if(GS.monster[2] == 0) GS.bmenucoord[1]= 0
	                    }
	                }
	                if(GS.bmenuno == 3) {
	                    if(GS.item[0] != 0) {
	                        GS.bmenucoord[3]= 0
	                        script_execute(75/* scr_itemnameb */)
	                        GS.msc= 9
	                    } else  GS.bmenuno= 0
	                }
	                if(GS.bmenuno == 4) GS.msc= 7
	                GS.tmsg= GS.msg[0]
	                snd_play(111/* snd_select */)
	                // OBJ_WRITER
	                with(782) halt= 3
	                // OBJ_INSTAWRITER
	                with(785) halt= 3
	                instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	                keyboard_clear(13/* ENTER */)
	                exit
	            } else  {
	                if(GS.bmenuno == 1) {
	                    GS.mytarget= GS.bmenucoord[1]
	                    OBJ_WRITER.halt= 3
	                    OBJ_INSTAWRITER.halt= 3
	                    GS.myfight= 1
	                    obj_heart.x= -200
	                    snd_play(111/* snd_select */)
	                    script_execute(161/* scr_attack */)
	                    keyboard_clear(13/* ENTER */)
	                }
	                if(GS.bmenuno == 10) {
	                    GS.talked= GS.bmenucoord[2]
	                    GS.mntrg= GS.monsterinstance[GS.mytarget]
	                    with(GS.mntrg) whatiheard= GS.talked
	                    OBJ_WRITER.halt= 3
	                    OBJ_INSTAWRITER.halt= 3
	                    snd_play(111/* snd_select */)
	                    GS.myfight= 2
	                    obj_heart.x= -200
	                    keyboard_clear(13/* ENTER */)
	                }
	                if(GS.bmenuno == 2) {
	                    GS.mytarget= GS.bmenucoord[1]
	                    OBJ_WRITER.halt= 3
	                    OBJ_INSTAWRITER.halt= 3
	                    GS.bmenuno= 10
	                    GS.msc= 1000 + GS.monstertype[GS.mytarget]
	                    instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	                    keyboard_clear(13/* ENTER */)
	                    SCR_TEXT(GS.msc)
	                    if(GS.choices[GS.bmenucoord[2]] == 0) GS.bmenucoord[2]= 0
	                }
	                if(GS.bmenuno == 3 or GS.bmenuno == 3.5) {
	                    if(Input.is_action_pressed("move_right") == 0 and Input.is_action_pressed("move_left") == 0) {
	                        OBJ_WRITER.halt= 3
	                        itempos= GS.bmenucoord[3] + (GS.bmenuno - 3) * 8
	                        thisitemid= GS.item[itempos]
	                        script_execute(73/* scr_itemuseb */, itempos, thisitemid)
	                        GS.talked= 91
	                        GS.myfight= 4
	                        obj_heart.x= -200
	                        snd_play(111/* snd_select */)
	                    }
	                    keyboard_clear(13/* ENTER */)
	                }
	                if(GS.bmenuno == 4) {
	                    OBJ_WRITER.halt= 3
	                    GS.mercyuse= GS.bmenucoord[4]
	                    if(GS.mercyuse == 1) {
	                        script_execute(166/* scr_runaway */)
	                        GS.talked= 90
	                    }
	                    if(runaway == 0) snd_play(111/* snd_select */)
	                    GS.myfight= 4
	                    obj_heart.x= -200
	                    keyboard_clear(13/* ENTER */)
	                }
	            }
	        }
	        if(active == 1 and keyboard_multicheck_pressed(16/* SHIFT */)) {
	            if(GS.bmenuno != 0 and GS.bmenuno < 6) {
	                OBJ_WRITER.halt= 3
	                OBJ_INSTAWRITER.halt= 3
	                GS.bmenuno= 0
	                GS.typer= 1
	                GS.msg[0]= GS.tmsg
	                GS.msc= 0
	                instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	                keyboard_clear(16/* SHIFT */)
	            }
	            if(GS.bmenuno == 10) {
	                OBJ_WRITER.halt= 3
	                OBJ_INSTAWRITER.halt= 3
	                GS.bmenuno= 2
	                GS.typer= 1
	                GS.msc= 3
	                if(instance_exists(751/* obj_talkbt */) and obj_talkbt.spec == 1) {
	                    GS.bmenuno= 0
	                    GS.typer= 1
	                    GS.msg[0]= GS.rmsg
	                    GS.msc= 0
	                }
	                instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	                keyboard_clear(16/* SHIFT */)
	            }
	            if(GS.bmenuno == 11) {
	                OBJ_WRITER.halt= 3
	                OBJ_INSTAWRITER.halt= 3
	                GS.bmenuno= 3
	                GS.typer= 1
	                GS.msc= 0
	                instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	                keyboard_clear(16/* SHIFT */)
	            }
	        }
	        if(GS.bmenuno == 1 or GS.bmenuno == 2 or GS.bmenuno == 11) {
	            obj_heart.x= GS.idealborder[0] + 32
	            obj_heart.y= GS.idealborder[2] + 28 + GS.bmenucoord[1] * 32
	        }
	        if(GS.bmenuno == 10) {
	            if(GS.bmenucoord[2] <= 2) obj_heart.x= GS.idealborder[0] + 32
	            else  obj_heart.x= GS.idealborder[0] + 292
	            if(GS.bmenucoord[2] <= 2)
	                obj_heart.y= GS.idealborder[2] + 28 + GS.bmenucoord[2] * 32
	            else 
	                obj_heart.y= GS.idealborder[2] + 28 + (GS.bmenucoord[2] - 3) * 32
	        }
	        if(GS.bmenuno == 3 or GS.bmenuno == 3.5) {
	            if(GS.bmenucoord[3] <= 1) obj_heart.y= GS.idealborder[2] + 28
	            else  obj_heart.y= GS.idealborder[2] + 60
	            if(GS.bmenucoord[3] == 0 or GS.bmenucoord[3] == 2)
	                obj_heart.x= GS.idealborder[0] + 32
	            else  obj_heart.x= GS.idealborder[0] + 280
	        }
	        if(GS.bmenuno == 4) {
	            obj_heart.x= GS.idealborder[0] + 32
	            obj_heart.y= GS.idealborder[2] + 28 + GS.bmenucoord[4] * 32
	        }
	    }
	    if(active == 1 and keyboard_multicheck_pressed(16/* SHIFT */) and GS.mnfight == 0 and GS.flag[21] == 0) {
	        if(instance_number(782) > 0)
	            OBJ_WRITER.stringpos= string_length(OBJ_WRITER.originalstring)
	        keyboard_clear(16/* SHIFT */)
	    }
	    if(GS.myfight == 1 or GS.myfight == 2 or GS.mnfight == 3)
	        obj_heart.x= -400
	    if(GS.mnfight == 3) {
	        GS.border= 0
	        script_execute(168/* SCR_BORDERSETUP */)
	        if(obj_lborder.x == GS.idealborder[0]) {
	            GS.typer= 1
	            GS.msc= 0
	            instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            GS.bmenuno= 0
	            GS.myfight= 0
	            GS.mnfight= 0
	            GS.turn++
	            GS.mercyuse= -1
	        }
	    }
	    if(GS.myfight == 3 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt > 0) {
	        obj_heart.x= GS.idealborder[0] + 32 + GS.bmenucoord[6] * 252
	        obj_heart.y= GS.idealborder[2] + 92
	        if(keyboard_multicheck_pressed(13/* ENTER */)) {
	            GS.heard= 0
	            GS.talked= 6 + GS.bmenucoord[6]
	            with(GS.monsterinstance[GS.mytarget])
	                whatiheard= GS.talked
	            obj_heart.x= -200
	            OBJ_WRITER.halt= 3
	            GS.myfight= 2
	        }
	    }
	    if(GS.myfight == 4 and runaway == 0) {
	        obj_heart.x= -200
	        if(not instance_exists(782/* OBJ_WRITER */)) {
	            GS.myfight= 0
	            GS.mnfight= 1
	            keyboard_clear(13/* ENTER */)
	        }
	    }
	    if(GS.hp <= 0) script_execute(158/* scr_gameoverb */)
	    if(currentplace < GS.bmenuno and snd_isplaying(111/* snd_select */) != 1)
	        snd_play(111/* snd_select */)
	    if(GS.debug == 1 and keyboard_multicheck_pressed(32/* SPACE */) == 1)
	        GS.turntimer= 2
	    exit
	}

func _gm_event_5_57():
	if(GS.debug == 1) GS.turntimer+= 10

func _gm_event_5_56():
	if(GS.debug == 1) GS.turntimer-= 10

func _gm_event_7_10():
	if(won == 1 and not instance_exists(782/* OBJ_WRITER */))
	    room_goto(GS.currentroom)
	if(won == 1 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0)
	    room_goto(GS.currentroom)

func _gm_event_7_5():
	GS.at= 8 + GS.lv * 2
	GS.df= 9 + ceil(GS.lv / 4)
	GS.sp= tempspd
	GS.flag[78]= 0

func _on_outside_room():
	if(GS.turntimer > 0) {
	    z_index= -1000
	    draw_set_color(255)
	    GS.turntimer--
	}
	if(instance_exists(759/* obj_uborder */)) {
	    z_index= 5
	    draw_set_color(0)
	    if(drawrect == 1)
	        draw_rectangle(obj_uborder.x + 5, obj_uborder.y + 5, obj_rborder.x, obj_dborder.y, 0)
	}
	if(background_color != 16777215 and drawbinfo == 1)
	    script_execute(157/* scr_binfowrite */)
	if(GS.bmenuno == 1 and GS.myfight == 0 and GS.mnfight == 0) {
	    xwrite= 1
	    i= 0
	    while(i < 3) {
	        if(GS.monster[i] == 1) {
	            ywrite= string_length(GS.monstername[i])
	            if(ywrite > xwrite) xwrite= ywrite
	        }
	        i++
	    }
	    xwrite= 190 + xwrite * 16
	    i= 0
	    while(i < 3) {
	        if(GS.monster[i] == 1 and not instance_exists(519/* obj_sansb */)) {
	            draw_set_color(255)
	            draw_rectangle(xwrite, 280 + i * 32, xwrite + 100, 280 + i * 32 + 16, 0)
	            draw_set_color(65280)
	            draw_rectangle(xwrite, 280 + i * 32, xwrite + GS.monsterhp[i] / GS.monstermaxhp[i] * 100, 280 + i * 32 + 16, 0)
	        }
	        i++
	    }
	}

func _gm_event_9_117():
	if(GS.debug == 1) {
	    GS.mercy= 0
	    GS.at= 999
	}

func _gm_event_9_80():
	if(Input.is_key_pressed(79) and GS.debug == 1) {
	    obj_monsterparent.mercymod= 999999
	    GS.mercy= 0
	}

func _gm_event_9_50():
	if(GS.debug == 1) room_speed= round(room_speed * 2)

func _gm_event_9_49():
	if(GS.debug == 1) room_speed= round(room_speed / 2)

func _gm_event_9_46():
	if(GS.debug == 1) GS.hp= 999

func _gm_event_9_40():
	if(GS.mnfight == 0) {
	    if(GS.bmenuno == 1 or GS.bmenuno == 2 or GS.bmenuno == 11) {
	        GS.bmenucoord[1]++
	        if(GS.bmenucoord[1] > 2) GS.bmenucoord[1]= 0
	        if(GS.monster[0] == 0 and GS.monster[2] == 0)
	            GS.bmenucoord[1]= 1
	        if(GS.bmenucoord[1] == 0 and GS.monster[0] == 0)
	            GS.bmenucoord[1]= 1
	        if(GS.bmenucoord[1] == 1 and GS.monster[1] == 0)
	            GS.bmenucoord[1]= 2
	        if(GS.bmenucoord[1] == 2 and GS.monster[2] == 0)
	            GS.bmenucoord[1]= 0
	    }
	    if(GS.bmenuno == 10) {
	        nowcoord= GS.bmenucoord[2]
	        if(GS.bmenucoord[2] != 2 and GS.bmenucoord[2] != 5)
	            GS.bmenucoord[2]++
	        else  GS.bmenucoord[2]-= 2
	        if(GS.choices[GS.bmenucoord[2]] == 0 and GS.bmenucoord[2] > 2)
	            GS.bmenucoord[2]= 3
	        if(GS.choices[GS.bmenucoord[2]] == 0 and GS.bmenucoord[2] <= 2)
	            GS.bmenucoord[2]= 0
	        if(GS.choices[0] == 1 and GS.choices[1] == 0 and GS.choices[2] == 0 and GS.choices[3] == 0 and GS.choices[4] == 0 and GS.choices[5] == 0)
	            GS.bmenucoord[2]= 0
	    }
	    if(GS.bmenuno == 3 or GS.bmenuno == 3.5) {
	        mv= 0
	        tempcheck= GS.bmenucoord[3]
	        if(GS.bmenuno == 3.5) tempcheck+= 4
	        if(GS.bmenucoord[3] == 2 or GS.bmenucoord[3] == 3) {
	            GS.bmenucoord[3]-= 2
	            mv= 1
	        }
	        if(mv == 0 and (GS.bmenucoord[3] == 0 or GS.bmenucoord[3] == 1)) {
	            GS.bmenucoord[3]+= 2
	            if(GS.item[tempcheck + 2] == 0)
	                GS.bmenucoord[3]-= 2
	            mv= 1
	        }
	    }
	    if(GS.bmenuno == 4) {
	        if(GS.bmenucoord[4] == 0 and GS.mercy < 1) GS.bmenucoord[4]= 1
	        else  GS.bmenucoord[4]= 0
	    }
	}

func _gm_event_9_39():
	currentplace= GS.bmenucoord[0]
	if(GS.mnfight == 0) {
	    if(GS.bmenuno == 0) {
	        GS.bmenucoord[0]++
	        if(GS.bmenucoord[0] > 3) GS.bmenucoord[0]= 0
	        if(GS.mercy == 2 and GS.bmenucoord[0] == 3) GS.bmenucoord[0]= 0
	        if(GS.mercy == 3) GS.bmenucoord[0]= 1
	    }
	    if(GS.bmenuno == 10) {
	        if(GS.bmenucoord[2] <= 2)
	            GS.bmenucoord[2]+= 3
	        else  GS.bmenucoord[2]-= 3
	        if(GS.choices[GS.bmenucoord[2]] == 0)
	            GS.bmenucoord[2]--
	        if(GS.choices[0] == 1 and GS.choices[1] == 0 and GS.choices[2] == 0 and GS.choices[3] == 0 and GS.choices[4] == 0 and GS.choices[5] == 0)
	            GS.bmenucoord[2]= 0
	    }
	    if(GS.bmenuno == 6) {
	        if(GS.bmenucoord[6] == 0)
	            GS.bmenucoord[6]++
	        else  GS.bmenucoord[6]--
	    }
	    mv= 0
	    if(GS.myfight != 4 and GS.bmenuno == 3) {
	        tempcheck= GS.bmenuno
	        if(GS.bmenucoord[3] == 0) {
	            if(GS.item[1] != 0) GS.bmenucoord[3]= 1
	            mv= 1
	        }
	        if(mv == 0 and GS.bmenucoord[3] == 1) {
	            if(GS.item[4] != 0) {
	                GS.bmenucoord[3]= 0
	                GS.bmenuno= 3.5
	            } else  GS.bmenucoord[3]= 0
	            mv= 1
	        }
	        if(GS.bmenucoord[3] == 2) {
	            if(GS.item[3] != 0) GS.bmenucoord[3]= 3
	            mv= 1
	        }
	        if(mv == 0 and GS.bmenucoord[3] == 3) {
	            if(GS.item[6] != 0) {
	                GS.bmenucoord[3]= 2
	                GS.bmenuno= 3.5
	            } else  GS.bmenucoord[3]= 2
	            mv= 1
	        }
	        if(GS.bmenuno != tempcheck) script_execute(69/* scr_itemrewrite */)
	    }
	    if(mv == 0 and GS.myfight != 4 and GS.bmenuno == 3.5) {
	        tempcheck= GS.bmenuno
	        if(GS.bmenucoord[3] == 1) {
	            GS.bmenucoord[3]= 0
	            GS.bmenuno= 3
	            mv= 1
	        }
	        if(mv == 0 and GS.bmenucoord[3] == 0) {
	            if(GS.item[5] != 0) GS.bmenucoord[3]= 1
	            else  {
	                GS.bmenucoord[3]= 0
	                GS.bmenuno= 3
	            }
	            mv= 1
	        }
	        if(mv == 0 and GS.bmenucoord[3] == 3) {
	            GS.bmenucoord[3]= 2
	            GS.bmenuno= 3
	            mv= 1
	        }
	        if(mv == 0 and GS.bmenucoord[3] == 2) {
	            if(GS.item[7] != 0) GS.bmenucoord[3]= 3
	            else  {
	                GS.bmenucoord[3]= 2
	                GS.bmenuno= 3
	            }
	            mv= 1
	        }
	        if(mv == 1) snd_play(114/* snd_squeak */)
	        if(GS.bmenuno != tempcheck) script_execute(69/* scr_itemrewrite */)
	    }
	}
	if(GS.bmenucoord[0] != currentplace) snd_play(114/* snd_squeak */)

func _gm_event_9_38():
	if(not Input.is_action_pressed("move_down") and GS.mnfight == 0) {
	    if(GS.bmenuno == 1 or GS.bmenuno == 2 or GS.bmenuno == 11) {
	        GS.bmenucoord[1]--
	        if(GS.bmenucoord[1] < 0) GS.bmenucoord[1]= 2
	        if(GS.monster[0] == 0 and GS.monster[2] == 0)
	            GS.bmenucoord[1]= 1
	        if(GS.bmenucoord[1] == 2 and GS.monster[2] == 0)
	            GS.bmenucoord[1]= 1
	        if(GS.bmenucoord[1] == 1 and GS.monster[1] == 0)
	            GS.bmenucoord[1]= 0
	        if(GS.bmenucoord[1] == 0 and GS.monster[0] == 0)
	            GS.bmenucoord[1]= 2
	    }
	    if(GS.bmenuno == 10) {
	        if(GS.bmenucoord[2] != 0 and GS.bmenucoord[2] != 3)
	            GS.bmenucoord[2]--
	        else  GS.bmenucoord[2]+= 2
	        if(GS.choices[GS.bmenucoord[2]] == 0)
	            GS.bmenucoord[2]--
	        if(GS.choices[GS.bmenucoord[2]] == 0)
	            GS.bmenucoord[2]--
	        if(GS.choices[0] == 1 and GS.choices[1] == 0 and GS.choices[2] == 0 and GS.choices[3] == 0 and GS.choices[4] == 0 and GS.choices[5] == 0)
	            GS.bmenucoord[2]= 0
	    }
	    if(GS.bmenuno == 3 or GS.bmenuno == 3.5) {
	        mv= 0
	        tempcheck= GS.bmenucoord[3]
	        if(GS.bmenuno == 3.5) tempcheck+= 4
	        if(GS.bmenucoord[3] == 2 or GS.bmenucoord[3] == 3) {
	            GS.bmenucoord[3]-= 2
	            mv= 1
	        }
	        if(mv == 0 and (GS.bmenucoord[3] == 0 or GS.bmenucoord[3] == 1)) {
	            GS.bmenucoord[3]+= 2
	            if(GS.item[tempcheck + 2] == 0)
	                GS.bmenucoord[3]-= 2
	            mv= 1
	        }
	    }
	    if(GS.bmenuno == 4) {
	        if(GS.bmenucoord[4] == 0 and GS.mercy < 1) GS.bmenucoord[4]= 1
	        else  GS.bmenucoord[4]= 0
	    }
	}

func _gm_event_9_37():
	if(not Input.is_action_pressed("move_right")) {
	    currentplace= GS.bmenucoord[0]
	    if(GS.mnfight == 0) {
	        if(GS.bmenuno == 0) {
	            GS.bmenucoord[0]--
	            if(GS.bmenucoord[0] < 0) GS.bmenucoord[0]= 3
	            if(GS.mercy == 2 and GS.bmenucoord[0] == 3) GS.bmenucoord[0]= 2
	            if(GS.mercy == 3) GS.bmenucoord[0]= 1
	        }
	        if(GS.myfight != 4 and GS.bmenuno == 3) {
	            tempcheck= GS.bmenuno
	            mv= 0
	            if(GS.bmenucoord[3] == 1) {
	                GS.bmenucoord[3]= 0
	                mv= 1
	            }
	            if(mv == 0 and GS.bmenucoord[3] == 0) {
	                if(GS.item[5] != 0) {
	                    GS.bmenucoord[3]= 1
	                    GS.bmenuno= 3.5
	                }
	                if(GS.item[5] == 0 and GS.item[4] != 0) {
	                    GS.bmenucoord[3]= 0
	                    GS.bmenuno= 3.5
	                }
	                if(GS.item[4] == 0) GS.bmenucoord[3]= 1
	                if(GS.item[1] == 0) GS.bmenucoord[3]= 0
	            }
	            if(GS.bmenucoord[3] == 3) {
	                GS.bmenucoord[3]= 2
	                mv= 1
	            }
	            if(mv == 0 and GS.bmenucoord[3] == 3) {
	                if(GS.item[7] != 0) {
	                    GS.bmenucoord[3]= 3
	                    GS.bmenuno= 3.5
	                }
	                if(GS.item[7] == 0 and GS.item[6] != 0) {
	                    GS.bmenucoord[3]= 2
	                    GS.bmenuno= 3.5
	                }
	                if(GS.item[6] == 0) GS.bmenucoord[3]= 3
	                if(GS.item[3] == 0) GS.bmenucoord[3]= 2
	            }
	            if(GS.bmenuno != tempcheck) script_execute(69/* scr_itemrewrite */)
	        }
	        if(GS.myfight != 4 and GS.bmenuno == 3.5) {
	            tempcheck= GS.bmenuno
	            mv= 0
	            if(GS.bmenucoord[3] == 1) {
	                GS.bmenucoord[3]= 0
	                mv= 1
	            }
	            if(mv == 0 and GS.bmenucoord[3] == 0) {
	                mv= 1
	                GS.bmenuno= 3
	                GS.bmenucoord[3]= 1
	            }
	            if(mv == 0 and GS.bmenucoord[3] == 3) {
	                GS.bmenucoord[3]= 2
	                mv= 1
	            }
	            if(mv == 0 and GS.bmenucoord[3] == 2) {
	                mv= 1
	                GS.bmenuno= 3
	                GS.bmenucoord[3]= 3
	            }
	            if(mv == 1) snd_play(114/* snd_squeak */)
	            if(GS.bmenuno != tempcheck) script_execute(69/* scr_itemrewrite */)
	        }
	        if(GS.bmenuno == 10) {
	            if(GS.bmenucoord[2] <= 2)
	                GS.bmenucoord[2]+= 3
	            else  GS.bmenucoord[2]-= 3
	            if(GS.choices[GS.bmenucoord[2]] == 0)
	                GS.bmenucoord[2]--
	            if(GS.choices[0] == 1 and GS.choices[1] == 0 and GS.choices[2] == 0 and GS.choices[3] == 0 and GS.choices[4] == 0 and GS.choices[5] == 0)
	                GS.bmenucoord[2]= 0
	        }
	        if(GS.bmenuno == 6) {
	            if(GS.bmenucoord[6] == 0)
	                GS.bmenucoord[6]++
	            else  GS.bmenucoord[6]--
	        }
	    }
	    if(GS.bmenucoord[0] != currentplace) snd_play(114/* snd_squeak */)
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
