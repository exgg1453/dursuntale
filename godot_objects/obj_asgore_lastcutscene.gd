# Auto-converted from GameMaker: obj_asgore_lastcutscene
extends Node2D

func _ready():
	shudder= 18
	con= 0
	$Alarm0.start((1) / 30.0)
	asgorex= x
	asgorey= y
	asgore= 1
	GS.faceemotion= 9
	flowey= 0
	fimg= 0
	fimg2= 0
	rowdy= 0
	ht= 240
	wd= 380
	remove= 0
	ry= 0
	murder= 0
	md= 0
	wd= 400
	ht= 200

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	asgorex= xstart + shudder
	shudder= -shudder
	if(shudder > 0) shudder-= 2
	$Alarm2.start((2) / 30.0)
	if(abs(shudder) < 2) {
	    shudder= 0
	    if(hearts == 1) con= 30
	    else  con= 58
	    $Alarm2.start((-1) / 30.0)
	}

func _on_destroy():
	if(murder == 1 and md == 0) {
	    GS.monsterinstance[0]= id
	    GS.mytarget= 0
	    GS.monsterhp[0]= 900
	    GS.monstermaxhp[0]= 900
	    hearts= 0
	    GS.damage= 9999999999
	    d= instance_create(x, y, 189/* obj_dmgwriter */)
	    d.takedamage= GS.damage
	    md= 1
	}
	asgorex= xstart + shudder
	shudder= -shudder
	if(shudder > 0) shudder-= 3
	$Alarm0.start((8) / 30.0)
	if(abs(shudder) < 1) {
	    shudder= 0
	    con= 2
	    $Alarm0.start((-1) / 30.0)
	}

func _on_outside_room():
	if(con == 107) {
	    get_tree().change_scene_to_file("res://godot_rooms/322.tscn")
	    exit
	} else  {
	    if(con >= 4 and instance_exists(755/* obj_btparent */) and obj_btparent.modulate.a > 0)
	        obj_btparent.modulate.a-= 0.02
	    if(con >= 12 and instance_exists(757/* obj_borderparent */)) {
	        obj_battlecontroller.drawbinfo= 0
	        // obj_hpname
	        with(183) instance_destroy()
	        if(obj_borderparent.modulate.a > 0)
	            obj_borderparent.modulate.a-= 0.02
	    }
	    if(asgore == 1) {
	        if(remove == 0) {
	            draw_sprite_ext(628/* spr_asgore_kneel */, 0, asgorex, asgorey, 2, 2, 0, 16777215, 1)
	            draw_sprite_ext(629/* spr_asgore_lastface */, GS.faceemotion, asgorex + 136, asgorey - 8, 2, 2, 0, 16777215, 1)
	        }
	        if(remove == 1) {
	            ry+= 2
	            if(ry < 49)
	                draw_sprite_part_ext(628, 0, 0, 0 + ry * 2, 183, 97 - ry * 2, asgorex, asgorey + ry * 4, 2, 2, 16777215, 1)
	            if(ry < 27)
	                draw_sprite_part_ext(629, GS.faceemotion, 0, 0 + ry * 2, 53, 54 - ry * 2, asgorex + 136, asgorey - 8 + ry * 4, 2, 2, 16777215, 1)
	        }
	    }
	    if(con == 2) {
	        GS.border= 0
	        SCR_BORDERSETUP()
	        GS.mnfight= -2
	        GS.myfight= -2
	        // obj_dmgwriter
	        with(189) instance_destroy()
	        con= 3
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 4) {
	        GS.typer= 63
	        GS.msc= 0
	        GS.msg[0]= "Ah.../"
	        GS.msg[1]= ".../"
	        GS.msg[2]= "So that&is how&it is./"
	        GS.msg[3]= ".../%%"
	        con= 5
	        saddude= 1
	        if(murder == 1) {
	            GS.msg[0]= "\\E3Why..^1.&You.../%%"
	            con= 20
	        }
	        scr_blcon_x(x + 300, y + 20)
	        blcon.sprite_index= 18/* spr_blconsm */
	    }
	    if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 6
	        chokemusic= caster_load("music/chokedup.ogg")
	        $Alarm4.start((45) / 30.0)
	    }
	    if(con == 7) {
	        caster_loop(chokemusic, 1, 1)
	        saddude= 2
	        GS.msg[0]= "I remember the day&after my son&died./"
	        GS.msg[1]= "The entire underground&was devoid of hope./"
	        GS.msg[2]= "The future had once&again been taken&from us by the&humans./"
	        GS.msg[3]= "In a fit of anger,&I declared war./"
	        GS.msg[4]= "I said that I would&destroy any human&that came here./"
	        GS.msg[5]= "I would use their&souls to become&godlike.../"
	        GS.msg[6]= "... and free us from&this terrible prison./"
	        GS.msg[7]= "Then, I would destroy&humanity.../"
	        GS.msg[8]= "And let monsters rule&the surface, in peace./"
	        GS.msg[9]= "Soon, the people\'s&hopes returned./"
	        GS.msg[10]= "My wife, however,&became disgusted with&my actions./"
	        GS.msg[11]= "She left this place,&never to be seen&again./%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 8
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 9
	        GS.msg[0]= "Truthfully.../"
	        GS.msg[1]= "I do not want power./"
	        GS.msg[2]= "I do not want to&hurt anyone./"
	        GS.msg[3]= "I just wanted everyone&to have hope.../"
	        GS.msg[4]= "But.../"
	        GS.msg[5]= "I cannot take this&any longer./"
	        GS.msg[6]= "I just want to&see my wife./"
	        GS.msg[7]= "I just want to&see my child./"
	        GS.msg[8]= "Please..^1.&Young one.../"
	        GS.msg[9]= "This war has gone&on long enough./"
	        GS.msg[10]= "You have the power.../"
	        GS.msg[11]= "Take my soul, and&leave this cursed&place./%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 10
	    }
	    if(con == 8 or con == 10 or con == 18 or con == 19)
	        scr_textskip()
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        fightbt2= instance_create(GS.idealborder[0] + 50, GS.idealborder[2] + 50, 756/* obj_anybt */)
	        fightbt2.type= 0
	        fightbt2.sprite_index= 5/* spr_fightbt */
	        sparebt2= instance_create(GS.idealborder[1] - 150, GS.idealborder[2] + 50, 756/* obj_anybt */)
	        sparebt2.type= 1
	        sparebt2.sprite_index= 10/* spr_sparebt_bandage */
	        obj_heart.x= -999
	        fkhrt= instance_create(320, GS.idealborder[2] + 60, 748/* obj_fakeheart */)
	        con= 11
	    }
	    if(con == 15) {
	        caster_free(-3)
	        con= 16
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 17) {
	        msb= caster_load("music/musicbox.ogg")
	        GS.msg[0]= ".../"
	        GS.msg[1]= "\\E0After everything I&have done to&hurt you.../"
	        GS.msg[2]= "\\E7You would rather&stay down here&and suffer.../"
	        GS.msg[3]= "\\E9Than live happily&on the surface?/"
	        GS.msg[4]= "\\E6.../%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 18
	    }
	    if(con == 18 and not instance_exists(782/* OBJ_WRITER */)) {
	        caster_loop(msb, 1, 1)
	        GS.msg[0]= "\\E1Human.../"
	        GS.msg[1]= "\\E7I promise you.../"
	        GS.msg[2]= "\\E7For as long as&you remain here.../"
	        GS.msg[3]= "\\E1My wife and I will&take care of you&as best we can./"
	        GS.msg[4]= "\\E2We can sit in&the living room^1,&telling stories.../"
	        GS.msg[5]= "\\E1Eating butterscotch&pie.../"
	        GS.msg[6]= "\\E2We could be&like.../"
	        GS.msg[7]= "\\E8Like a family.../%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 19
	        ini_open("undertale.ini")
	        IK= ini_read_real("Flowey", "IK", 0)
	        CHANGE= ini_read_real("Flowey", "CHANGE", 0)
	        K= ini_read_real("Flowey", "K", 0)
	        SK= ini_read_real("Flowey", "SK", 0)
	        ini_close()
	        q= 0
	        if(GS.kills == 0 and CHANGE == 0 and SK == 0 and IK > 0)
	            q= 1
	        if(K == 1 and SK == 0) q= 1
	        if(q == 1) con= 130
	    }
	    if(con == 19 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 18.5
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 19.5) con= 20
	    if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.faceemotion= 5
	        caster_free(-3)
	        instance_create(asgorex + 190, asgorey - 30, 492/* obj_spinbullet_lastgen */)
	        con= 21
	        $Alarm4.start((70) / 30.0)
	    }
	    if(con == 22) {
	        obj_spinbullet_last.targetx= asgorex + 190
	        obj_spinbullet_last.targety= asgorey + 110
	        // obj_spinbullet_last
	        with(491) {
	            move_towards_point(targetx, targety, 2)
	            friction= -0.5
	        }
	        if(hearts == 1) {
	            with(specbullet) speed= 0
	        }
	        con= 23
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 24) {
	        $Alarm2.start((1) / 30.0)
	        snd_play(51/* snd_damage */)
	        shudder= 16
	        GS.faceemotion= 4
	        if(hearts == 1) {
	            ssx= specbullet.x
	            ssy= specbullet.y
	        }
	        // obj_spinbullet_last
	        with(491) instance_destroy()
	        if(hearts == 1)
	            specbullet= instance_create(ssx, ssy, 491/* obj_spinbullet_last */)
	        con= 25
	    }
	    if(con == 30) {
	        ddd= instance_create(x, y, 155/* obj_vaporized_new */)
	        with(ddd) scr_newvapordata(34)
	        remove= 1
	        ddd.sprite_index= 627/* spr_asgore_kneeldeath */
	        ddd.ht= ht
	        ddd.wd= wd
	        room_speed= 10
	        con= 31
	        $Alarm4.start((40) / 30.0)
	    }
	    if(con == 32) {
	        room_speed= 30
	        asgore= 0
	        fh= instance_create(asgorex + 190, asgorey + 110, 490/* obj_asgfakeheart */)
	        con= 33
	        $Alarm4.start((40) / 30.0)
	    }
	    if(con == 34) {
	        with(specbullet)
	            move_towards_point(obj_asgfakeheart.x, obj_asgfakeheart.y, 4)
	        con= 35
	        $Alarm4.start((35) / 30.0)
	    }
	    if(con == 36) {
	        z_index= 1
	        // obj_spinbullet_last
	        with(491) instance_destroy()
	        // obj_asgfakeheart
	        with(490) event_user(0)
	        con= 37
	        $Alarm4.start((110) / 30.0)
	        if(murder == 1) $Alarm4.start((60) / 30.0)
	    }
	    if(con == 38) {
	        GS.faceemotion= 0
	        flowey= 1
	        fimg= 0
	        if(murder == 0) {
	            con= 95
	            $Alarm4.start((60) / 30.0)
	            ini_open("undertale.ini")
	            won= ini_read_real("General", "Won", 0)
	            if(won > 0) {
	                con= 119
	                $Alarm4.start((60) / 30.0)
	            }
	        } else  con= 150
	    }
	    if(con == 45) {
	        caster_free(-3)
	        con= 46
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 47) {
	        GS.flag[476]= 1
	        GS.stretch= 1.5
	        strike= instance_create(asgorex + 195, asgorey + 150, 733/* obj_slice */)
	        con= 49
	        $Alarm4.start((GS.damagetimer) / 30.0)
	    }
	    if(con == 50) {
	        $Alarm2.start((1) / 30.0)
	        snd_play(51/* snd_damage */)
	        shudder= 16
	        GS.faceemotion= 6
	        con= 51
	    }
	    if(con == 58) {
	        ddd= instance_create(x, y, 155/* obj_vaporized_new */)
	        with(ddd) scr_newvapordata(34)
	        remove= 1
	        ddd.sprite_index= 627/* spr_asgore_kneeldeath */
	        ddd.ht= ht
	        ddd.wd= wd
	        room_speed= 10
	        con= 59
	        $Alarm4.start((40) / 30.0)
	    }
	    if(con == 60) {
	        room_speed= 30
	        asgore= 0
	        fh= instance_create(asgorex + 180, asgorey + 100, 490/* obj_asgfakeheart */)
	        con= 62
	        $Alarm4.start((90) / 30.0)
	    }
	    if(con == 63) {
	        obj_asgfakeheart.shake= 0
	        spb= instance_create(asgorex + 190, asgorey - 15, 492/* obj_spinbullet_lastgen */)
	        spb.speed= 20
	        con= 64
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 65) {
	        obj_spinbullet_last.targetx= obj_asgfakeheart.x + 2
	        obj_spinbullet_last.targety= obj_asgfakeheart.y + 2
	        // obj_spinbullet_last
	        with(491) {
	            move_towards_point(targetx, targety, 2)
	            friction= -0.5
	        }
	        con= 66
	        $Alarm4.start((18) / 30.0)
	    }
	    if(con == 67) con= 36
	    if(flowey == 1) {
	        draw_sprite_ext(623/* spr_flowey_riseanim */, fimg, 285, 150, 2, 2, 0, 16777215, 1)
	        if(murder == 1 and fimg >= 8)
	            draw_sprite_ext(624/* spr_flowey_as */, GS.faceemotion, 285, 150, 2, 2, 0, 16777215, 1)
	        if(fimg < 8) fimg+= 0.5
	    }
	    if(flowey == 3) {
	        draw_sprite_ext(625/* spr_flowey_toskull */, fimg2, 285, 150, 2, 2, 0, 16777215, 1)
	        if(fimg2 < 4) fimg2+= 0.04
	    }
	    if(flowey == 4) {
	        draw_sprite_ext(626/* spr_flowey_skulllaugh */, fimg2, 285, 150, 2, 2, 0, 16777215, 1)
	        fimg2+= 0.5
	    }
	    if(con == 96) {
	        GS.msc= 0
	        GS.typer= 66
	        if(hearts == 1) {
	            GS.msg[0]= "You&IDIOT./"
	            ini_open("undertale.ini")
	            truename= ini_read_real("Flowey", "truename", 0)
	            ini_close()
	            if(truename == 1) GS.msg[0]= GS.charname + "./"
	            GS.msg[1]= "You&haven\'t&learned&a thing./%%"
	        }
	        if(hearts == 0) {
	            GS.msg[0]= "Hee&hee&hee./"
	            GS.msg[1]= "So you&finally&get it./%%"
	            ini_open("undertale.ini")
	            truename= ini_read_real("Flowey", "truename", 0)
	            ini_close()
	            if(truename == 1) {
	                GS.msg[0]= GS.charname + "./"
	                GS.msg[1]= "So you&DO&recall./%%"
	            }
	        }
	        scr_blcon_x(360, 140)
	        obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	        con= 97
	    }
	    if(con == 97 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msg[0]= "In&this&world.../%%"
	        scr_blcon_x(360, 140)
	        obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	        con= 100
	    }
	    if(con == 100) {
	        rowdy= 1
	        radius= 400
	        angle= 0
	        i= 0
	        while(i < 6) {
	            ang[i]= i * 60
	            xx= lengthdir_x(radius, ang[i]) + 320
	            yy= lengthdir_y(radius, ang[i]) + 170
	            heart[i]= instance_create(xx, yy, 491/* obj_spinbullet_last */)
	            heart[i].image_speed= 0
	            if(i == 0) heart[i].sprite_index= 36/* spr_heartyellow */
	            if(i == 1) heart[i].sprite_index= 42/* spr_heartorange */
	            if(i == 2) heart[i].sprite_index= 37/* spr_heartpurple */
	            if(i == 3) heart[i].sprite_index= 40/* spr_heartblue */
	            if(i == 4) heart[i].sprite_index= 41/* spr_heartaqua */
	            if(i == 5) heart[i].sprite_index= 39/* spr_heartgreen */
	            i++
	        }
	        fimg2= 0
	        con= 99.5
	    }
	    if(con == 99.5 and not instance_exists(782/* OBJ_WRITER */)) {
	        cym= caster_load("music/cymbal.ogg")
	        con= 102
	        flowey= 3
	        GS.typer= 67
	        GS.msg[0]= "It\'s KILL or BE killed^4.%%"
	        instance_create(120, 350, 782/* OBJ_WRITER */)
	    }
	    if(con == 102 and not instance_exists(782/* OBJ_WRITER */)) {
	        caster_play(cym, 1, 1)
	        snd_play(52/* snd_floweylaugh */)
	        flowey= 4
	        con= 103
	        wht= 0
	        $Alarm4.start((2) / 30.0)
	    }
	    if(con == 104) {
	        rowdy= 2
	        con= 105
	        with(heart[0]) secrettrick= 1
	        $Alarm4.start((160) / 30.0)
	    }
	    if(con == 106) {
	        white_blocker= scr_marker(-10, -10, 999)
	        white_blocker.scale.x= 900
	        white_blocker.scale.y= 900
	        GS.filechoice= 8
	        GS.currentroom= 319
	        scr_saveprocess()
	        if(file_exists("undertale.exe"))
	            file_rename("undertale.exe", "flowey.exe")
	        ini_open("undertale.ini")
	        ini_write_real("FFFFF", "F", 1)
	        ini_close()
	        con= 107
	    }
	    if(con == 120) {
	        rowdy= 1
	        radius= 400
	        angle= 0
	        i= 0
	        while(i < 6) {
	            ang[i]= i * 60
	            xx= lengthdir_x(radius, ang[i]) + 320
	            yy= lengthdir_y(radius, ang[i]) + 170
	            heart[i]= instance_create(xx, yy, 491/* obj_spinbullet_last */)
	            heart[i].image_speed= 0
	            if(i == 0) heart[i].sprite_index= 36/* spr_heartyellow */
	            if(i == 1) heart[i].sprite_index= 42/* spr_heartorange */
	            if(i == 2) heart[i].sprite_index= 37/* spr_heartpurple */
	            if(i == 3) heart[i].sprite_index= 40/* spr_heartblue */
	            if(i == 4) heart[i].sprite_index= 41/* spr_heartaqua */
	            if(i == 5) heart[i].sprite_index= 39/* spr_heartgreen */
	            i++
	        }
	        fimg2= 0
	        con= 121
	    }
	    if(con == 121) {
	        GS.msc= 0
	        GS.typer= 6
	        if(won == 1) {
	            GS.msg[0]= "Hee hee hee^1.&Don\'t worry./"
	            GS.msg[1]= "I know there\'s no&REAL point in&fighting you./"
	            GS.msg[2]= "The human souls&would probably just&revolt again./"
	            GS.msg[3]= "So...!/%%"
	            ini_open("undertale.ini")
	            kill= ini_read_real("Flowey", "K", 0)
	            if(kill == 1) {
	                GS.msg[0]= "Hee hee hee^1./"
	                GS.msg[1]= "Did you REALLY&think killing me&would make a&DIFFERENCE?/"
	                GS.msg[2]= "No./"
	                GS.msg[3]= "Every time you&load your SAVE^1,&I\'ll come back./"
	                GS.msg[4]= "And every time you&try to get a&happy ending.../"
	                GS.msg[5]= "I\'ll be there to&tear it away!/"
	                GS.msg[6]= "Ha ha ha!!!/%%"
	            }
	        }
	        if(won == 2) GS.msg[0]= "Well^1, let\'s get&this over with./%%"
	        if(won >= 3) GS.msg[0]= ".../%%"
	        con= 122
	        scr_blcon_x(390, 140)
	        obj_blconwideslave.z_index= -9000
	        OBJ_WRITER.z_index= -90000
	    }
	    if(con == 122 and not instance_exists(782/* OBJ_WRITER */)) {
	        rowdy= 2
	        with(heart[0]) secrettrick= 1
	        cym= caster_load("music/cymbal.ogg")
	        caster_play(cym, 1, 1)
	        con= 123
	        wht= 0
	        $Alarm4.start((150) / 30.0)
	    }
	    if(con == 130 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 131
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 132 and not instance_exists(782/* OBJ_WRITER */)) {
	        ini_open("undertale.ini")
	        ini_write_real("Flowey", "SK", 1)
	        ini_close()
	        GS.typer= 63
	        GS.msc= 0
	        caster_stop(-3)
	        GS.msg[0]= "\\E2.../"
	        GS.msg[1]= "\\E0No^1.&That\'s just a&fantasy^1, isn\'t it?/"
	        GS.msg[2]= "\\E1Young one^1, when I&look at you.../"
	        GS.msg[3]= "\\E2I\'m reminded of the&human that fell here&long ago.../"
	        GS.msg[4]= "\\E8You have the same&feeling of hope in&your eyes./"
	        GS.msg[5]= "\\E7There is an ancient&prophecy among our&people.../"
	        GS.msg[6]= "One day^1, a savior&will come from the&heavens./"
	        GS.msg[7]= "\\E1... I believe the&one that was&prophecied was you./"
	        GS.msg[8]= "Somewhere in the&world outside.../"
	        GS.msg[9]= "There must be a way&to free us from our&prison./"
	        GS.msg[10]= "\\E0It pains me to&give you this&responsiblity^1, but.../"
	        GS.msg[11]= "\\E0Please^1.&Take my soul..^1.&and seek the truth./%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 133
	        remdepth= z_index
	    }
	    if(con == 133 and not instance_exists(782/* OBJ_WRITER */)) {
	        cut= caster_load("music/sfx_cinematiccut.ogg")
	        caster_play(cut, 1, 0.9)
	        $Alarm4.start((80) / 30.0)
	        con= 134
	        wht= 0
	        z_index= -999999
	    }
	    if(con == 134) {
	        draw_set_color(16777215)
	        draw_set_alpha(wht)
	        wht+= 0.2
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	        con= 134
	    }
	    if(con == 135) {
	        con= 136
	        snd_play(51/* snd_damage */)
	        $Alarm4.start((80) / 30.0)
	    }
	    if(con == 136) {
	        draw_set_color(0)
	        draw_set_alpha(1)
	        draw_rectangle(-10, -10, 999, 999, 0)
	    }
	    if(con == 137) {
	        z_index= remdepth
	        GS.faceemotion= 0
	        GS.msc= 0
	        GS.typer= 64
	        GS.msg[0]= "\\E0Ha... ha.../"
	        GS.msg[1]= "\\E6I\'m sorry.../"
	        GS.msg[2]= "I couldn\'t give you&a simple^1, happy&ending.../"
	        GS.msg[3]= "But I believe your&freedom.../"
	        GS.msg[4]= "... is what my son.../"
	        GS.msg[5]= "\\E8... what ASRIEL would&have wanted./%%"
	        scr_blcon_x(x + 270, y + 20)
	        con= 138
	    }
	    if(con == 138 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 139
	        $Alarm4.start((30) / 30.0)
	    }
	    if(con == 140) con= 58
	    if(rowdy == 1) {
	        angle+= 4
	        if(radius > 180) radius-= 5
	        radius+= sin(angle / 16) * 2
	        i= 0
	        while(i < 6) {
	            ang[i]= i * 60 + angle
	            xx= lengthdir_x(radius, ang[i]) + 320
	            yy= lengthdir_y(radius, ang[i]) + 170
	            heart[i].x= xx
	            heart[i].y= yy
	            i++
	        }
	    }
	    if(rowdy == 2) {
	        angle++
	        if(radius > 0) radius-= 1.5
	        i= 0
	        while(i < 6) {
	            ang[i]= i * 60 + angle
	            xx= lengthdir_x(radius, ang[i]) + 320
	            yy= lengthdir_y(radius, ang[i]) + 170
	            heart[i].x= xx
	            heart[i].y= yy
	            i++
	        }
	    }
	    if(con == 999) {
	        draw_set_color(16777215)
	        draw_set_alpha(wht)
	        wht+= 0.01
	        draw_rectangle(-10, -10, 999, 999, 0)
	        draw_set_alpha(1)
	    }
	    if(con == 124) {
	        caster_free(-3)
	        instance_create(0, 0, 148/* obj_persistentfader */)
	        get_tree().change_scene_to_file("res://godot_rooms/238.tscn")
	    }
	    if(con == 150) {
	        GS.msc= 0
	        GS.typer= 6
	        GS.msg[0]= "See^1?&I never betrayed&you^2! %"
	        GS.msg[1]= "It was all a&trick, see^2? %"
	        GS.msg[2]= "I was waiting to&kill him for you^2! %"
	        GS.msg[3]= "\\E1After all it\'s me&your best friend^2! %"
	        GS.msg[4]= "\\E2I\'m helpful, I can&be useful to you^1 %"
	        GS.msg[5]= "\\E1I promise I won\'t&get in your way^1 %%"
	        con= 151
	        scr_blcon_x(390, 140)
	        obj_blconwideslave.z_index= -9000
	        OBJ_WRITER.z_index= -90000
	    }
	    if(con == 151 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msc= 0
	        GS.typer= 102
	        GS.msg[0]= "\\E2I can help..^1.&I can..^1.&I can..^2. %%"
	        con= 152
	        scr_blcon_x(390, 140)
	        obj_blconwideslave.z_index= -9000
	        OBJ_WRITER.z_index= -90000
	    }
	    if(con == 152 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.msc= 0
	        GS.typer= 103
	        GS.msg[0]= "\\E3Please don\'t&kill me./%%"
	        con= 153
	        scr_blcon_x(390, 140)
	        obj_blconwideslave.z_index= -9000
	        OBJ_WRITER.z_index= -90000
	    }
	    if(con == 153 and not instance_exists(782/* OBJ_WRITER */)) {
	        instance_create(285, 150, 494/* obj_floweygonk */)
	        instance_destroy()
	    }
	    exit
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
