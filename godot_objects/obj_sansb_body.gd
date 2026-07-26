# Auto-converted from GameMaker: obj_sansb_body
extends Node2D

func _ready():
	x= 320
	a_type= 0
	drawborder= 0
	GS.faceemotion= 4
	GS.flag[20]= 0
	sweat= 0
	pause= 0
	bounce= 0
	siner= 0
	yoff= 0
	xoff= 0
	legx= 0
	legy= 0
	deadtest= 0
	repeater= 0
	movearm= 0
	arm_i= 0
	heady= 0
	headx= 0
	aspeed= 1
	facetype= 0
	f_i= 0
	hell= 0
	fac= 0
	lac= 0
	mk_c= 0
	intensity= 15
	smasher= 0
	smashtime= 4
	smashcon= 0
	smashlv= 2
	smashamt= 0
	smashmax= 8
	prevsmash= -1
	test_timer= 0
	test_timer_on= 0
	dodge= 0
	death_c= 0
	death_t= 0
	asleep= 0
	asleep_timer= 0
	sleep_c= 0
	sleep_t= 0
	km_t= 0
	prevhp= GS.hp
	damageturn= 0
	inv_check= 0
	inv_timer= 0
	GS.damagetimer= -1

func _gm_event_2_8():
	smashcon++

func _gm_event_2_7():
	fac++

func _gm_event_2_6():
	death_c++

func _gm_event_2_5():
	lac++

func _gm_event_7_23():
	obj_heart.jumpstage= 0
	obj_heart.movement= 13
	obj_heart.sprite_index= 672/* spr_heartblue_l */
	obj_heart.velocity.x= -intensity
	obj_heart.velocity.y= 0

func _gm_event_7_22():
	obj_heart.jumpstage= 0
	obj_heart.movement= 12
	obj_heart.sprite_index= 673/* spr_heartblue_u */
	obj_heart.velocity.x= 0
	obj_heart.velocity.y= -intensity

func _gm_event_7_21():
	obj_heart.jumpstage= 0
	obj_heart.movement= 11
	obj_heart.sprite_index= 671/* spr_heartblue_r */
	obj_heart.velocity.x= intensity
	obj_heart.velocity.y= 0

func _gm_event_7_20():
	obj_heart.jumpstage= 0
	obj_heart.movement= 2
	obj_heart.sprite_index= 40/* spr_heartblue */
	obj_heart.velocity.x= 0
	obj_heart.velocity.y= intensity

func _gm_event_7_12():
	if(damageturn == 0) {
	    snd_stop(53)
	    snd_play(53/* snd_hurt1 */)
	    GS.hp--
	    damageturn= 1
	}

func _gm_event_7_10():
	// obj_sansb
	with(519) timer_on= 1
	if(a_type == 0) {
	    GS.turntimer= 200
	    i= 0
	    while(i < 8) {
	        scr_sbo(20, 6, 40 + i * 20, 0)
	        scr_sbo(20, -6, 40 + i * 20, 0)
	        scr_sbo(40, 6, 40 + i * 20, 2)
	        scr_sbo(40, -6, 40 + i * 20, 2)
	        i++
	    }
	}
	if(a_type == 1) {
	    GS.turntimer= 190
	    if(hell == 1) {
	        i= 0
	        while(i < 8) {
	            scr_sbo(20, 8, 40 + i * 18, 0)
	            scr_sbo(20, -8, 40 + i * 18, 0)
	            scr_sbo(40, 8, 40 + i * 18, 2)
	            scr_sbo(40, -8, 40 + i * 18, 2)
	            i++
	        }
	    } else  {
	        i= 0
	        while(i < 8) {
	            scr_sbo(20, 7, 40 + i * 19, 0)
	            scr_sbo(20, -7, 40 + i * 19, 0)
	            scr_sbo(40, 7, 40 + i * 19, 2)
	            scr_sbo(40, -7, 40 + i * 19, 2)
	            i++
	        }
	    }
	}
	if(a_type == 2) {
	    GS.turntimer= 240
	    value= 0
	    i= 0
	    while(i < 5) {
	        ht= choose(20, 30, 40, 60)
	        xx= 0
	        if(i > 0) xx= choose(-2, 0, 2)
	        if(ht == 60) xx= 0
	        if(ht == 40) xx*= 0.5
	        scr_sbo(ht, 7 + xx, 40 + i * 25 + value, 0)
	        scr_sbo(ht, -7 + xx, 40 + i * 25 + value, 0)
	        scr_sbo(ht + 24, 7 + xx, 40 + i * 25 + value, 2)
	        scr_sbo(ht + 24, -7 + xx, 40 + i * 25 + value, 2)
	        if(ht == 30) value+= 5
	        if(ht == 40) value+= 10
	        if(ht == 60) value+= 20
	        i++
	    }
	}
	if(a_type == 3) {
	    GS.turntimer= 190
	    if(hell == 1) {
	        scr_sbo(100, -12, 25, 1)
	        scr_sbo(20, -12, 32, 0)
	        scr_sbo(100, -12, 47, 1)
	        scr_sbo(20, -12, 54, 0)
	        scr_sbo(100, -12, 69, 1)
	        scr_sbo(20, -12, 76, 0)
	        scr_sbo(20, 10, 105, 0)
	        scr_sbo(100, 10, 117, 1)
	        scr_sbo(20, 10, 127, 0)
	        scr_sbo(100, 10, 139, 1)
	        scr_sbo(20, 10, 149, 0)
	        scr_sbo(100, 10, 161, 1)
	    } else  {
	        scr_sbo(100, -10, 25, 1)
	        scr_sbo(20, -10, 32, 0)
	        scr_sbo(100, -10, 47, 1)
	        scr_sbo(20, -10, 54, 0)
	        scr_sbo(100, -10, 69, 1)
	        scr_sbo(20, -10, 76, 0)
	        scr_sbo(20, 10, 105, 0)
	        scr_sbo(100, 10, 117, 1)
	        scr_sbo(20, 10, 127, 0)
	        scr_sbo(100, 10, 139, 1)
	        scr_sbo(20, 10, 149, 0)
	        scr_sbo(100, 10, 161, 1)
	    }
	}
	if(a_type == 5) {
	    GS.turntimer= 230
	    i= 0
	    while(i < 8) {
	        scr_sbo(20, 4, 65 + i * 19, 0)
	        scr_sbo(28, -4, 65 + i * 19, 2)
	        i++
	    }
	}
	if(a_type == 6) {
	    GS.turntimer= 250
	    scr_bwall(30, 4, 60, 41)
	    scr_hplat(40, 4, 70, 30)
	    scr_hplat(40, 5, 120, 30)
	    scr_hplat(40, 6, 160, 30)
	    scr_sbo(90, 7, 160, 2)
	    scr_sbo(90, 7, 162, 2)
	    scr_sbo(90, 7, 164, 2)
	    scr_sbo(40, 9, 222, 2)
	}
	if(a_type == 7) {
	    GS.turntimer= 290
	    scr_bwall(30, -4, 60, 58)
	    scr_hplat(40, -5, 70, 25)
	    scr_sbo(70, -5, 90, 0)
	    scr_hplat(90, -5, 95, 25)
	    scr_hplat(40, -5, 110, 25)
	    scr_hplat(60, -5, 150, 25)
	    scr_sbo(90, -5, 148, 2)
	    scr_hplat(50, -5, 170, 25)
	    scr_sbo(80, -5, 168, 2)
	    scr_hplat(70, -5, 190, 25)
	    scr_sbo(100, -5, 188, 2)
	    scr_hplat(90, -2, 230, 15)
	    scr_sbo(110, -8, 240, 0)
	    scr_sbo(40, 3, 260, 2)
	}
	if(a_type == 8) {
	    GS.turntimer= 240
	    plat= instance_create(0, 0, 514/* obj_3platgen */)
	    plat.type= 1
	}
	if(a_type == 9) {
	    GS.idealborder[2]-= 200
	    GS.idealborder[0]+= 60
	    GS.idealborder[1]-= 60
	    instance_create(0, 0, 513/* obj_vplatgen */)
	}
	if(a_type == 10) {
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    GS.idealborder[2]= GS.idealborder[3] - 200
	    GS.idealborder[0]= 220
	    GS.idealborder[1]= 420
	    if(hell == 1) {
	        b1= instance_create(-40, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 7
	        b1= instance_create(720, GS.idealborder[2] + 100, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -8
	        b1= instance_create(GS.idealborder[0] - 90, -110, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 730, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -7
	        b1= instance_create(-190, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 5
	        b1= instance_create(870, GS.idealborder[2] + 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -8
	        b1= instance_create(GS.idealborder[0] - 90, -310, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 900, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -6
	        b1= instance_create(-700, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 7
	        b1= instance_create(1290, GS.idealborder[2] + 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -7
	        b1= instance_create(GS.idealborder[0] - 90, -650, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 1180, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -7
	    }
	    if(hell == 0) {
	        b1= instance_create(-40, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 7
	        b1= instance_create(720, GS.idealborder[2] + 100, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -8
	        b1= instance_create(GS.idealborder[0] - 90, -110, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 760, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -7
	        b1= instance_create(-190, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 5
	        b1= instance_create(870, GS.idealborder[2] + 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -8
	        b1= instance_create(GS.idealborder[0] - 90, -310, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 900, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -6
	        b1= instance_create(-660, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= 6
	        b1= instance_create(1290, GS.idealborder[2] + 95, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 660/* spr_s_bonewall_tall */
	        b1.velocity.x= -7
	        b1= instance_create(GS.idealborder[0] - 90, -650, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 90, 1180, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -7
	        b1= instance_create(GS.idealborder[0] - 90, -960, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 7
	        b1= instance_create(GS.idealborder[0] + 110, 1510, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -7
	    }
	}
	if(a_type == 11) {
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    GS.idealborder[2]= GS.idealborder[3] - 200
	    GS.idealborder[0]= 270
	    GS.idealborder[1]= 470
	    b1= instance_create(-40, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= 6
	    b1= instance_create(770, GS.idealborder[2] + 100, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= -7
	    b1= instance_create(GS.idealborder[0] + 100, -250, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= 7
	    b1= instance_create(GS.idealborder[0] - 100, 630, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= -6
	    b1= instance_create(-190, GS.idealborder[2] - 95, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= 6
	    b1= instance_create(1120, GS.idealborder[2] + 100, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= -7
	    b1= instance_create(GS.idealborder[0] + 100, -500, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= 7
	    b1= instance_create(GS.idealborder[0] - 100, 880, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= -6
	}
	if(a_type == 12) {
	    GS.turntimer= 240
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    GS.idealborder[2]= GS.idealborder[3] - 200
	    GS.idealborder[0]= 120
	    GS.idealborder[1]= 520
	    gb= instance_create(0, 0, 518/* obj_gasterbl_gen */)
	    gb.type= 1
	}
	if(a_type == 13) {
	    GS.turntimer= 240
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    GS.idealborder[2]= GS.idealborder[3] - 200
	    GS.idealborder[0]= 120
	    GS.idealborder[1]= 520
	    gb= instance_create(0, 0, 518/* obj_gasterbl_gen */)
	    gb.type= 2
	}
	if(a_type == 14) fac= 1
	if(a_type == 15) {
	    GS.turntimer= 250
	    dplat= instance_create(0, 0, 514/* obj_3platgen */)
	    dplat.type= 2
	}
	if(a_type == 16) {
	    GS.turntimer= 240
	    dplat= instance_create(0, 0, 514/* obj_3platgen */)
	    dplat.type= 3
	}
	if(a_type == 17) {
	    GS.turntimer= 220
	    scr_bwall(20, 2, 3, 50)
	    scr_bwall(20, 2, -5, 20)
	    obj_heart.y= GS.idealborder[3] - 70
	    obj_heart.velocity.y= 1
	    scr_hplat(50, 0, 0, 20)
	    bone.jud= 1
	    bone.x-= 150
	    obj_heart.x-= 150
	    lb= instance_create(GS.idealborder[1] - 260, GS.idealborder[2] + 40, 503/* obj_boneloop_v */)
	    lb.velocity.y= -4
	    lb= instance_create(GS.idealborder[1] - 260, GS.idealborder[2] + 125, 503/* obj_boneloop_v */)
	    lb.velocity.y= -4
	    lb= instance_create(GS.idealborder[1] - 180, GS.idealborder[2], 503/* obj_boneloop_v */)
	    lb.velocity.y= 5
	    lb= instance_create(GS.idealborder[1] - 180, GS.idealborder[2] + 95, 503/* obj_boneloop_v */)
	    lb.velocity.y= 5
	    lb= instance_create(GS.idealborder[1] - 100, GS.idealborder[2] + 20, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 100, GS.idealborder[2] + 105, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	}
	if(a_type == 18) {
	    GS.turntimer= 220
	    scr_bwall(20, 2, 3, 50)
	    scr_bwall(20, 2, -5, 20)
	    obj_heart.y= GS.idealborder[3] - 70
	    obj_heart.velocity.y= 1
	    scr_hplat(50, 0, 0, 15)
	    bone.jud= 1
	    bone.x-= 150
	    obj_heart.x-= 150
	    lb= instance_create(GS.idealborder[1] - 260, GS.idealborder[2] + 40, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 260, GS.idealborder[2] + 105, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 260, GS.idealborder[2] + 170, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 180, GS.idealborder[2], 503/* obj_boneloop_v */)
	    lb.velocity.y= 4
	    lb= instance_create(GS.idealborder[1] - 180, GS.idealborder[2] + 90, 503/* obj_boneloop_v */)
	    lb.velocity.y= 4
	    lb= instance_create(GS.idealborder[1] - 100, GS.idealborder[2] + 40, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 100, GS.idealborder[2] + 105, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	    lb= instance_create(GS.idealborder[1] - 100, GS.idealborder[2] + 170, 503/* obj_boneloop_v */)
	    lb.velocity.y= -3
	}
	if(a_type == 19) {
	    test_timer= 0
	    test_timer_on= 1
	    lac= 4
	    // obj_sansb
	    with(519) timer_on= 0
	}
	if(a_type == 20) {
	    obj_heart.speed= 0
	    // obj_sansb
	    with(519) timer_on= 0
	    GS.idealborder[0]= 270
	    GS.idealborder[1]= 370
	    GS.idealborder[2]= GS.idealborder[3] - 100
	    obj_heart.x= GS.idealborder[0] + 42
	    obj_heart.y= GS.idealborder[2] + 42
	    obj_heart.movement= 1
	    obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	    mk_c_timer= 0
	    mk_c= 1
	}
	if(a_type == 21) {
	    GS.turntimer= 210
	    vtotal= 0
	    while(vtotal < 150) {
	        ht= choose(20, 30, 40, 60)
	        xx= 0
	        down= 0
	        if(i > 0) xx= choose(-2, 0, 2)
	        if(ht == 60) {
	            xx= 0
	            down= 1
	        }
	        if(ht == 40) xx= 0
	        if(i > 0) {
	            if(ht == 20) vtotal+= 7
	            if(ht == 30) vtotal+= 9
	            if(ht == 40) vtotal+= 16
	            if(ht == 60) vtotal+= 22
	        }
	        if(down == 1) xx= -1
	        scr_sbo(ht, 8 + xx, 32 + vtotal, 0)
	        if(down == 1) xx= 1
	        scr_sbo(ht, -8 + xx, 32 + vtotal, 0)
	        if(down == 1) xx= -1
	        scr_sbo(ht + 24, 8 + xx, 32 + vtotal, 2)
	        if(down == 1) xx= 1
	        scr_sbo(ht + 24, -8 + xx, 32 + vtotal, 2)
	        if(ht == 20) vtotal+= 12
	        if(ht == 30) vtotal+= 13
	        if(ht == 40) vtotal+= 16
	        if(ht == 60) vtotal+= 22
	    }
	}
	if(a_type == 22) {
	    GS.turntimer= 180
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    GS.idealborder[2]= GS.idealborder[3] - 160
	    GS.idealborder[0]= 240
	    GS.idealborder[1]= 400
	    obj_heart.x= GS.idealborder[0] + 76
	    obj_heart.y= GS.idealborder[2] + 76
	    i= 0
	    while(i < 7) {
	        b1= instance_create(GS.idealborder[0] - 110, GS.idealborder[2] - 300 - i * (216 - i * 3), 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 10
	        b1= instance_create(GS.idealborder[1] - 70, GS.idealborder[3] + 300 + i * (216 - i * 3), 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -10
	        i++
	    }
	}
	if(a_type == 23) {
	    GS.turntimer= 210
	    vtotal= 0
	    while(vtotal < 150) {
	        ht= choose(20, 30, 40, 60)
	        xx= 0
	        down= 0
	        if(i > 0) xx= choose(-2, 0, 2)
	        if(ht == 60) {
	            xx= 0
	            down= 1
	        }
	        if(ht == 40) xx= 0
	        if(i > 0) {
	            if(ht == 20) vtotal+= 9
	            if(ht == 30) vtotal+= 11
	            if(ht == 40) vtotal+= 19
	            if(ht == 60) vtotal+= 25
	        }
	        if(down == 1) xx= -1
	        scr_sbo(ht, 8 + xx, 32 + vtotal, 0)
	        if(down == 1) xx= 1
	        scr_sbo(ht, -8 + xx, 32 + vtotal, 0)
	        if(down == 1) xx= -1
	        scr_sbo(ht + 24, 8 + xx, 32 + vtotal, 2)
	        if(down == 1) xx= 1
	        scr_sbo(ht + 24, -8 + xx, 32 + vtotal, 2)
	        if(ht == 20) vtotal+= 15
	        if(ht == 30) vtotal+= 17
	        if(ht == 40) vtotal+= 19
	        if(ht == 60) vtotal+= 25
	    }
	}

func _on_outside_room():
	inv_check= 0
	inv_timer++
	if(GS.inv >= 45 and inv_timer >= 5) {
	    inv_check= 1
	    inv_timer= 0
	}
	if(GS.inv >= 60 and inv_timer >= 4) {
	    inv_check= 1
	    inv_timer= 0
	}
	if(GS.inv >= 75 and inv_timer >= 3) {
	    inv_check= 1
	    inv_timer= 0
	}
	if(lac >= 4 and GS.hp <= 10 and inv_timer >= 2) {
	    inv_check= 1
	    inv_timer= 0
	}
	if(inv_check == 0) damageturn= 0
	y= GS.idealborder[2] - 130
	if(bounce == 3) {
	    siner++
	    yoff= sin(siner / 18) * 2
	}
	if(bounce == 2) {
	    siner++
	    yoff= sin(siner / 15) * 4
	}
	if(bounce == 1) {
	    siner++
	    yoff= sin(siner / 3)
	    xoff= cos(siner / 6)
	}
	if(bounce == 0) {
	    siner= 0
	    yoff= 0
	    xoff= 0
	}
	if(deadtest == 0) {
	    draw_sprite_ext(675/* spr_sansb_legs */, 0, x, y + 90, 2, 2, 0, 16777215, 1)
	    if(movearm == 0)
	        draw_sprite_ext(677/* spr_sansb_torso */, GS.flag[20], x + xoff, y + 42 + yoff / 1.5, 2, 2, 0, 16777215, 1)
	    if(movearm == 1) {
	        if(arm_i >= 11) arm_i= 11
	        draw_sprite_ext(681/* spr_sansb_rightstrike */, floor(arm_i / 2), x, y + 42, 2, 2, 0, 16777215, 1)
	        if(arm_i == 2) headx= -4
	        if(arm_i == 4) headx= -8
	        if(arm_i == 6) headx= 10
	        if(arm_i == 8) headx= 4
	        if(arm_i < 11) arm_i+= aspeed
	        else  arm_i= 11
	    }
	    if(movearm == 2) {
	        if(arm_i >= 11) arm_i= 11
	        draw_sprite_ext(683/* spr_sansb_handup */, floor(arm_i / 2), x, y + 42, 2, 2, 0, 16777215, 1)
	        if(arm_i == 0) heady= 4
	        if(arm_i == 2) heady= 10
	        if(arm_i == 4) heady= 4
	        if(arm_i == 6) heady= -4
	        if(arm_i == 8) heady= 0
	        if(arm_i < 11) arm_i+= aspeed
	        else  arm_i= 11
	    }
	    if(movearm == 3) {
	        if(arm_i >= 9) arm_i= 9
	        draw_sprite_ext(682/* spr_sansb_handdown */, floor(arm_i / 2), x, y + 42, 2, 2, 0, 16777215, 1)
	        if(arm_i == 0) heady= 0
	        if(arm_i == 2) heady= 0
	        if(arm_i == 4) heady= 6
	        if(arm_i == 6) heady= 10
	        if(arm_i < 9) arm_i+= aspeed
	        else  arm_i= 9
	    }
	    if(movearm == 4) {
	        if(arm_i >= 10) arm_i= 10
	        draw_sprite_ext(681/* spr_sansb_rightstrike */, floor(5 - arm_i / 2), x, y + 42, 2, 2, 0, 16777215, 1)
	        if(arm_i >= 10) headx= 0
	        if(arm_i == 8) headx= -4
	        if(arm_i == 6) headx= -8
	        if(arm_i == 4) headx= 10
	        if(arm_i == 2) headx= 4
	        if(arm_i < 10) arm_i+= aspeed
	        else  arm_i= 10
	    }
	    if(facetype == 0)
	        draw_sprite_ext(679/* spr_sansb_face */, GS.faceemotion, x + xoff + headx, y + yoff + heady, 2, 2, 0, 16777215, 1)
	    if(sweat == 1)
	        draw_sprite_ext(680/* spr_sansb_face_sweat */, 0, x + xoff + headx, y + yoff + heady, 2, 2, 0, 16777215, 1)
	    if(sweat == 2)
	        draw_sprite_ext(680/* spr_sansb_face_sweat */, 1, x + xoff + headx, y + yoff + heady, 2, 2, 0, 16777215, 1)
	    if(sweat == 3)
	        draw_sprite_ext(680/* spr_sansb_face_sweat */, 2, x + xoff + headx, y + yoff + heady, 2, 2, 0, 16777215, 1)
	    if(facetype == 1) {
	        f_i++
	        draw_sprite_ext(678/* spr_sansb_blueeye */, floor(f_i / 2), x + xoff + headx, y + yoff + heady, 2, 2, 0, 16777215, 1)
	    }
	}
	if(deadtest == 1) {
	    draw_sprite_ext(676/* spr_sansb_legs_sit */, 0, x + legx, y + 100 + legy, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(677/* spr_sansb_torso */, GS.flag[20], x + xoff, y + 62 + yoff / 1.5, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(679/* spr_sansb_face */, GS.faceemotion, x + xoff, y + yoff + 30, 2, 2, 0, 16777215, 1)
	}
	if(drawborder == 1) {
	    draw_set_color(16777215)
	    i= 0
	    while(i < 5) {
	        draw_rectangle(GS.idealborder[0] + i, GS.idealborder[2] + i, GS.idealborder[1] + i, GS.idealborder[3] + i, 1)
	        i++
	    }
	}
	if(fac == 1) {
	    intensity= 25
	    GS.idealborder[0]= 240
	    GS.idealborder[1]= 400
	    GS.idealborder[2]= GS.idealborder[3] - 160
	    bounce= 0
	    facetype= 1
	    movearm= 3
	    arm_i= 0
	    heady= 0
	    headx= 0
	    // obj_sansb
	    with(519) p_cut= 1
	    fac= 2
	    $Alarm7.start((7) / 30.0)
	}
	if(fac == 3) {
	    event_user(10)
	    fac= 4
	    $Alarm7.start((14) / 30.0)
	}
	if(fac == 5) {
	    fac= 6
	    $Alarm7.start((10) / 30.0)
	    movearm= 2
	    arm_i= 0
	    heady= 0
	    headx= 0
	    facetype= 0
	    bs= instance_create(0, 0, 502/* obj_bonestab */)
	    bs.dir= 0
	    bs.height= 55
	    bs.warning= 6
	    bs.retain= 30
	    i= 0
	    while(i < 20) {
	        scr_sbo(135 - sin(i / 3) * 28, 12, 40 + i * 2, 2)
	        bone.siner= i * 3
	        scr_sbo(90 - sin(i / 3) * 28, 12, 40 + i * 2, 0)
	        bone.siner= i * 3
	        i++
	    }
	}
	if(fac == 7) {
	    intensity= 15
	    fac= 8
	    $Alarm7.start((10) / 30.0)
	}
	if(fac == 9) {
	    movearm= 1
	    arm_i= 0
	    heady= 0
	    headx= 0
	    fac= 9.1
	    $Alarm7.start((8) / 30.0)
	    obj_heart.movement= 1
	    obj_heart.speed= 0
	    obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	    snd_play(28/* snd_bell */)
	}
	if(fac == 10.1) {
	    // obj_sansb
	    with(519) p_cut= 1
	    fac= 10
	    $Alarm7.start((37) / 30.0)
	}
	if(fac == 11) {
	    movearm= 0
	    arm_i= 0
	    heady= 0
	    headx= 0
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= 90
	    gb.idealx= GS.idealborder[0] - 50
	    gb.idealy= GS.idealborder[2] + 20
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= -90
	    gb.idealx= GS.idealborder[1] + 50
	    gb.idealy= GS.idealborder[3] - 20
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= 0
	    gb.idealx= GS.idealborder[0] + 20
	    gb.idealy= GS.idealborder[2] - 60
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= 180
	    gb.idealx= GS.idealborder[1] - 20
	    gb.idealy= GS.idealborder[3] + 60
	    gb.scale.x= 2
	    gb.scale.y= 2
	    obj_gasterblaster.pause= 10
	    obj_gasterblaster.terminal= 8
	    fac= 12
	    $Alarm7.start((25) / 30.0)
	}
	if(fac == 13) {
	    movearm= 0
	    arm_i= 0
	    heady= 0
	    headx= 0
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= 45
	    gb.idealx= GS.idealborder[0] - 50
	    gb.idealy= GS.idealborder[2] - 50
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= -45
	    gb.idealx= GS.idealborder[1] + 50
	    gb.idealy= GS.idealborder[2] - 50
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(0, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= 135
	    gb.idealx= GS.idealborder[0] - 50
	    gb.idealy= GS.idealborder[3] + 50
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= -135
	    gb.idealx= GS.idealborder[1] + 50
	    gb.idealy= GS.idealborder[3] + 50
	    gb.scale.x= 2
	    gb.scale.y= 2
	    obj_gasterblaster.pause= 10
	    obj_gasterblaster.terminal= 8
	    fac= 14
	    $Alarm7.start((25) / 30.0)
	}
	if(fac == 15) {
	    movearm= 0
	    arm_i= 0
	    heady= 0
	    headx= 0
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= 90
	    gb.idealx= GS.idealborder[0] - 50
	    gb.idealy= GS.idealborder[2] + 20
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= -90
	    gb.idealx= GS.idealborder[1] + 50
	    gb.idealy= GS.idealborder[3] - 20
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    gb.idealrot= 0
	    gb.idealx= GS.idealborder[0] + 20
	    gb.idealy= GS.idealborder[2] - 60
	    gb.scale.x= 2
	    gb.scale.y= 2
	    gb= instance_create(640, 480, 498/* obj_gasterblaster */)
	    gb.idealrot= 180
	    gb.idealx= GS.idealborder[1] - 20
	    gb.idealy= GS.idealborder[3] + 60
	    gb.scale.x= 2
	    gb.scale.y= 2
	    obj_gasterblaster.pause= 10
	    obj_gasterblaster.terminal= 8
	    fac= 16
	    $Alarm7.start((20) / 30.0)
	}
	if(fac == 17) {
	    gb= instance_create(0, 240, 498/* obj_gasterblaster */)
	    gb.idealrot= 90
	    gb.idealx= GS.idealborder[0] - 100
	    gb.idealy= GS.idealborder[2] + 80
	    gb.scale.x= 3
	    gb.scale.y= 3
	    gb.pause= 20
	    gb.terminal= 15
	    gb= instance_create(640, 240, 498/* obj_gasterblaster */)
	    gb.idealrot= -90
	    gb.idealx= GS.idealborder[1] + 100
	    gb.idealy= GS.idealborder[2] + 80
	    gb.scale.x= 3
	    gb.scale.y= 3
	    gb.pause= 20
	    gb.terminal= 15
	    fac= 18
	    $Alarm7.start((90) / 30.0)
	}
	if(fac == 19) {
	    ini_open("undertale.ini")
	    intr= ini_read_real("Sans", "Intro", 0)
	    ini_write_real("Sans", "Intro", intr + 1)
	    ini_close()
	    GS.faceemotion= 0
	    GS.flag[20]= 0
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "\\E1huh./"
	    GS.msg[1]= "\\M1always wondered why&people never use&their strongest&attack first./%%"
	    if(intr == 1) {
	        GS.msg[0]= "\\E3anyway^1, as i was&saying^1, it\'s a&nice day out./"
	        GS.msg[1]= "\\M1why not relax and&take a load off?/%%"
	    }
	    if(intr >= 2) GS.msg[0]= "here we go./%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    fac= 20
	}
	if(fac == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    GS.flag[20]= 0
	    bounce= 1
	    // obj_borderparent
	    with(757) instaborder= 0
	    GS.msg[0]= "* You feel like you\'re going to&  have a bad time."
	    GS.border= 0
	    fac= 21
	    $Alarm7.start((5) / 30.0)
	}
	if(fac == 22) {
	    GS.bmenuno= 0
	    // obj_sansb
	    with(519) normalfight= 1
	    caster_loop(GS.batmusic, 0.9, 1)
	    GS.mnfight= 3
	    GS.myfight= 0
	    fac= -1
	}
	if(smasher == 1) {
	    if(smashcon == 0) {
	        obj_heart.x= GS.idealborder[0] + floor(GS.idealborder[1] - GS.idealborder[0]) / 2
	        obj_heart.y= GS.idealborder[2] + floor(GS.idealborder[3] - GS.idealborder[2]) / 2
	        obj_heart.speed= 0
	        obj_heart.movement= 1
	        obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	        smashdir= choose(0, 1, 2, 3)
	        repeat(10)  {
	            if(prevsmash == smashdir) smashdir= choose(0, 1, 2, 3)
	        }
	        if(smashdir == prevsmash) {
	            smashdir++
	            if(smashdir > 3) smashdir= 0
	        }
	        prevsmash= smashdir
	        smashcon= 1
	        aspeed= 1
	        if(smashlv == 2) aspeed= 2
	        if(smashdir == 0) {
	            movearm= 3
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 1) {
	            movearm= 1
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 2) {
	            movearm= 2
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 3) {
	            movearm= 4
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        $Alarm8.start((8) / 30.0)
	        if(smashlv == 2) $Alarm8.start((4) / 30.0)
	    }
	    if(smashcon == 2) {
	        xtimer= 0
	        intensity= 16
	        if(smashdir == 0) event_user(10)
	        if(smashdir == 1) event_user(11)
	        if(smashdir == 2) event_user(12)
	        if(smashdir == 3) event_user(13)
	        smashcon= 3
	    }
	    if(smashcon == 3) {
	        xtimer++
	        if(obj_heart.speed < intensity and xtimer >= 5) {
	            xtimer= 0
	            bs= instance_create(0, 0, 502/* obj_bonestab */)
	            bs.warning= 12
	            bs.height= 25
	            bs.retain= 4
	            bs.dir= smashdir
	            smashcon= 4
	            $Alarm8.start((18) / 30.0)
	            if(smashlv == 1) $Alarm8.start((12) / 30.0)
	            if(smashlv == 1) bs.warning= 9
	            if(smashlv == 1) bs.retain= -2
	            if(smashlv == 2) $Alarm8.start((7) / 30.0)
	            if(smashlv == 2) bs.retain= -7
	            if(smashlv == 2) bs.height= 40
	            if(smashlv == 2) warning= 11
	        }
	    }
	    if(smashcon == 5) {
	        if(smashlv == 2) aspeed= 2
	        smashdir= choose(0, 1, 2, 3)
	        smashcon= 1
	        if(smashdir == 0) {
	            movearm= 3
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 1) {
	            movearm= 1
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 2) {
	            movearm= 2
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        if(smashdir == 3) {
	            movearm= 4
	            arm_i= 0
	            heady= 0
	            headx= 0
	        }
	        smashcon= 1
	        smashamt++
	        $Alarm8.start((8) / 30.0)
	        if(smashlv == 2) $Alarm8.start((7) / 30.0)
	        if(smashamt > smashmax) {
	            if(not instance_exists(510/* obj_menubone_maker */))
	                instance_create(0, 0, 510/* obj_menubone_maker */)
	            smashcon= -1
	            smashamt= 0
	            smasher= 0
	            // obj_heart
	            with(743) movement= 1
	            // obj_heart
	            with(743) sprite_index= 34/* spr_heart */
	            // obj_heart
	            with(743) speed= 0
	            movearm= 0
	            arm_i= 0
	            heady= 0
	            headx= 0
	            $Alarm8.start((-1) / 30.0)
	            // obj_sansb
	            with(519) attacked= 0
	            GS.mnfight= 3
	        }
	    }
	}
	if(lac == 4) {
	    obj_heart.speed= 0
	    GS.idealborder[0]= 240
	    GS.idealborder[1]= 400
	    GS.idealborder[2]= GS.idealborder[3] - 160
	    obj_heart.movement= 1
	    obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	    smasher= 1
	    smashcon= 0
	    smashamt= 0
	    smashlv= 2
	    xtimer= 0
	    lac= 5
	}
	if(lac == 5) {
	    if(smashamt == 3 and smashcon == 3 and xtimer == 3) {
	        b1= instance_create(GS.idealborder[0] - 110, GS.idealborder[2] - 300, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 11
	        b1= instance_create(GS.idealborder[1] - 70, GS.idealborder[3] + 300, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -11
	        b1= instance_create(GS.idealborder[0] - 110, GS.idealborder[2] - 525, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 11
	        b1= instance_create(GS.idealborder[1] - 70, GS.idealborder[3] + 525, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -11
	        b1= instance_create(GS.idealborder[0] - 110, GS.idealborder[2] - 750, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= 11
	        b1= instance_create(GS.idealborder[1] - 70, GS.idealborder[3] + 750, 500/* obj_bonewall_normal */)
	        b1.sprite_index= 667/* spr_s_bonewall_wide */
	        b1.velocity.y= -11
	    }
	    if(smashamt == 4 and smashcon == 3 and xtimer >= 0) {
	        smashcon= -1
	        smasher= -1
	        obj_heart.speed= 0
	        lac= 6
	        $Alarm5.start((60) / 30.0)
	        obj_heart.movement= 1
	        obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	    }
	}
	if(lac == 7) {
	    intensity= 25
	    aspeed= 2
	    movearm= 4
	    arm_i= 0
	    heady= 0
	    headx= 0
	    lac= 8
	    $Alarm5.start((6) / 30.0)
	}
	if(lac == 9) {
	    event_user(13)
	    lac= 10
	    $Alarm5.start((8) / 30.0)
	}
	if(lac == 11) {
	    movearm= 1
	    arm_i= 0
	    heady= 0
	    headx= 0
	    lac= 12
	    $Alarm5.start((6) / 30.0)
	}
	if(lac == 13) {
	    intensity= 15
	    event_user(11)
	    lac= 14
	    $Alarm5.start((10) / 30.0)
	}
	if(lac == 14) {
	    obj_heart.jumpstage= 0
	    GS.idealborder[1]+= 15
	}
	if(lac == 15) {
	    lac= 16
	    $Alarm5.start((40) / 30.0)
	}
	if(lac == 16) {
	    GS.idealborder[0]-= 30
	    GS.idealborder[1]+= 10
	    repeater= 1
	    rp_x= 0
	    obj_heart.speed= 0
	    if(obj_heart.x > 40) obj_heart.x-= 10
	    GS.idealborder[2]++
	    GS.idealborder[3]-= 0.5
	}
	if(lac == 17) {
	    i= 0
	    while(i < 45) {
	        scr_sbo(70 - sin(i / 2) * 25, -30, 10 + i * 2, 2)
	        bone.siner= i * 3
	        bone.x+= 15
	        scr_sbo(30 - sin(i / 2) * 25, -30, 10 + i * 2, 0)
	        bone.siner= i * 3
	        bone.x+= 15
	        i++
	    }
	    lac= 18
	    $Alarm5.start((100) / 30.0)
	}
	if(lac == 19) {
	    scr_sbo(50, -30, 10, 2)
	    bone.x+= 15
	    scr_sbo(50, -30, 10, 2)
	    bone.x+= 30
	    scr_sbo(50, -30, 10, 2)
	    bone.x+= 45
	    scr_sbo(50, -30, 21, 0)
	    bone.x+= 15
	    scr_sbo(50, -30, 21, 0)
	    bone.x+= 30
	    scr_sbo(50, -30, 21, 0)
	    bone.x+= 45
	    scr_sbo(50, -30, 31, 2)
	    bone.x+= 15
	    scr_sbo(50, -30, 31, 2)
	    bone.x+= 30
	    scr_sbo(50, -30, 31, 2)
	    bone.x+= 45
	    scr_sbo(50, -30, 41, 0)
	    bone.x+= 15
	    scr_sbo(50, -30, 41, 0)
	    bone.x+= 30
	    scr_sbo(50, -30, 41, 0)
	    bone.x+= 45
	    scr_sbo(50, -30, 50, 2)
	    bone.x+= 15
	    scr_sbo(50, -30, 50, 2)
	    bone.x+= 30
	    scr_sbo(50, -30, 50, 2)
	    bone.x+= 45
	    scr_sbo(50, -30, 59, 0)
	    bone.x+= 15
	    scr_sbo(50, -30, 59, 0)
	    bone.x+= 30
	    scr_sbo(50, -30, 59, 0)
	    bone.x+= 45
	    scr_sbo(50, -30, 67, 2)
	    bone.x+= 15
	    scr_sbo(50, -30, 67, 2)
	    bone.x+= 30
	    scr_sbo(50, -30, 67, 2)
	    bone.x+= 45
	    scr_sbo(50, -30, 78, 0)
	    bone.x+= 15
	    scr_sbo(50, -30, 78, 0)
	    bone.x+= 30
	    scr_sbo(50, -30, 78, 0)
	    bone.x+= 45
	    scr_sbo(50, -30, 87, 2)
	    bone.x+= 15
	    scr_sbo(50, -30, 87, 2)
	    bone.x+= 30
	    scr_sbo(50, -30, 87, 2)
	    bone.x+= 45
	    i= 0
	    while(i < 24) {
	        scr_sbo(90 - i, -30, 100 + i, 2)
	        bone.x+= 15
	        scr_sbo(10 + i, -30, 100 + i, 0)
	        bone.x+= 15
	        i++
	    }
	    lac= 20
	    $Alarm5.start((134) / 30.0)
	}
	if(lac == 21) {
	    lac= 23
	    GS.idealborder[1]= 640
	    obj_heart.velocity.x= 11
	}
	if(lac == 23) {
	    if(GS.idealborder[1] > 420)
	        GS.idealborder[1]-= 18
	    if(obj_heart.velocity.x <= 0) {
	        GS.faceemotion= 0
	        GS.flag[20]= 0
	        repeater= 0
	        lac= 24
	        $Alarm5.start((5) / 30.0)
	    }
	}
	if(lac == 25) {
	    bs= instance_create(0, 0, 502/* obj_bonestab */)
	    bs.retain= 15
	    bs.warning= 12
	    bs.height= 50
	    bs.dir= 1
	    aspeed= 1
	    movearm= 4
	    arm_i= 0
	    heady= 0
	    headx= 0
	    lac= 26
	    $Alarm5.start((28) / 30.0)
	}
	if(lac == 27) {
	    // obj_heart
	    with(743) speed= 0
	    sh= instance_create(0, 0, 511/* obj_sansshadowgen */)
	    sh.level= 3
	    lac= 28
	}
	if(repeater == 1) {
	    movearm= 0
	    rp_x+= 0.05
	    x-= floor(30 + rp_x)
	    if(x < -100) {
	        GS.faceemotion= choose(0, 1, 3, 4, 5)
	        GS.flag[20]= choose(0, 0, 0, 1)
	        x= 740
	    }
	}
	if(lac == 50) {
	    obj_heart.speed= 0
	    obj_heart.movement= 1
	    obj_heart.sprite_index= 674/* spr_heart_battle_pl */
	    gt= 0
	    gin= 1
	    lac= 51
	    o_o= 0
	    gnum= 0
	}
	if(lac == 51) {
	    if(o_o == 1) {
	        disx= lengthdir_x(150, gt * 10)
	        disy= lengthdir_y(150, gt * 10)
	        gb[gnum]= instance_create(0, 0, 498/* obj_gasterblaster */)
	        if(instance_exists(gb[gnum])) {
	            gb[gnum].idealrot= -90 + gt * 10
	            gb[gnum].idealx= disx + GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	            gb[gnum].idealy= disy + GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	            gb[gnum].x= disx * 3 + GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2
	            gb[gnum].y= disy * 3 + GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2]) / 2
	            gb[gnum].terminal= 0
	            gb[gnum].pause= 15
	            gb[gnum].scale.y= 2
	        }
	        gt+= gin
	        if(gin < 1.7) gin+= 0.015
	        gnum++
	        o_o= 0
	    } else  o_o= 1
	    if(gt >= 190) {
	        // obj_heart
	        with(743) slam_pain= 1
	        pdd= -1
	        bounce= 0
	        intensity= 30
	        aspeed= 2
	        lc_t= 0
	        lc_c= 0
	        lc_a= 0
	        lac= 52
	        $Alarm5.start((30) / 30.0)
	    }
	}
	if(lac == 53) {
	    if(lc_t == 0) {
	        dd= choose(1, 2, 3, 4)
	        repeat(8)  {
	            if(dd == pdd) dd= choose(1, 2, 3, 4)
	        }
	        if(lc_c == 0) {
	            dd= 1
	            facetype= 1
	        }
	        if(lc_c == 18) dd= 2
	        movearm= dd
	        arm_i= 0
	        heady= 0
	        headx= 0
	    }
	    if(lc_t == 8 / aspeed) {
	        if(lc_c == 18) lc_a= 21
	        if(lc_c == 17) lc_a= 12
	        if(dd == 1) event_user(11)
	        if(dd == 3) event_user(10)
	        if(dd == 2) event_user(12)
	        if(dd == 4) event_user(13)
	    }
	    if(lc_t == lc_a * 2 + 8 / aspeed + 4) {
	        if(lc_c == 18) intensity= 2
	        if(dd == 3) dd= 2
	        else  {
	            if(dd == 1) dd= 4
	            else  {
	                if(dd == 4) dd= 1
	                else  {
	                    if(dd == 2) dd= 3
	                }
	            }
	        }
	        pdd= dd
	        if(lc_c == 18) {
	            dd= 3
	            sweat= 3
	            GS.faceemotion= 9
	        }
	        movearm= dd
	        arm_i= 0
	        heady= 0
	        headx= 0
	    }
	    if(lc_t == lc_a * 2 + 8 / aspeed * 2 + 4) {
	        if(dd == 1) event_user(11)
	        if(dd == 3) event_user(10)
	        if(dd == 2) event_user(12)
	        if(dd == 4) event_user(13)
	        if(lc_c == 18) lc_a= 21
	    }
	    lc_t++
	    if(lc_t == lc_a * 4 + 8 / aspeed * 2 + 7) {
	        lc_t= 0
	        lc_c++
	        if(lc_c == 11) {
	            lc_a= 1
	            caster_set_volume(GS.batmusic, 0.8)
	            intensity= 20
	        }
	        if(lc_c == 12) {
	            lc_a= 2
	            intensity= 20
	        }
	        if(lc_c == 13) {
	            lc_a= 0
	            aspeed= 1
	            intensity= 16
	            sweat= 1
	            facetype= 0
	            GS.faceemotion= 0
	        }
	        if(lc_c == 14) {
	            lc_a= 2
	            caster_set_volume(GS.batmusic, 0.7)
	            intensity= 14
	        }
	        if(lc_c == 15) {
	            lc_a= 4
	            caster_set_volume(GS.batmusic, 0.5)
	            intensity= 12
	        }
	        if(lc_c == 16) {
	            lc_a= 6
	            caster_set_volume(GS.batmusic, 0.25)
	            intensity= 12
	        }
	        if(lc_c == 17) {
	            lc_a= 8
	            caster_set_volume(GS.batmusic, 0.15)
	            aspeed= 0.5
	            intensity= 11
	            sweat= 2
	            GS.faceemotion= 2
	        }
	        if(lc_c == 18) {
	            lc_a= 15
	            caster_set_volume(GS.batmusic, 0.07)
	            intensity= 8
	        }
	        if(lc_c == 19) {
	            lac= 60
	            caster_set_volume(GS.batmusic, 0)
	            movearm= 0
	            headx= 0
	            heady= 0
	            bounce= 2
	            test_timer_on= 0
	        }
	    }
	}
	if(lac == 60) {
	    lac= 61
	    $Alarm5.start((80) / 30.0)
	}
	if(lac == 62) {
	    sleep_c= 9
	    obj_heart.movement= 1
	    obj_heart.speed= 0
	    obj_heart.sprite_index= 34/* spr_heart */
	    sweat= 3
	    GS.faceemotion= 9
	    GS.flag[20]= 0
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "huff..^1. puff.../"
	    GS.msg[1]= "all right^1.&that\'s it./"
	    GS.msg[2]= "\\Xi\\M1t\'s time for my\\R &special attack\\X./"
	    GS.msg[3]= "\\E3are you ready?/"
	    GS.msg[4]= "\\E4here goes nothing./%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    lac= 63
	}
	if(lac == 63 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 0
	    lac= 64
	    $Alarm5.start((300) / 30.0)
	}
	if(lac == 65) {
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "\\E1yep./"
	    GS.msg[1]= "\\E1that\'s right./"
	    GS.msg[2]= "\\E3it\'s literally&nothing./"
	    GS.msg[3]= "\\E1and it\'s not gonna&be anything^1,&either./"
	    GS.msg[4]= "\\E4heh heh heh..^1.&ya get it?/"
	    GS.msg[5]= "\\E1i know i can\'t&beat you./"
	    GS.msg[6]= "\\E4one of your turns.../"
	    GS.msg[7]= "\\E9you\'re just gonna&kill me./"
	    GS.msg[8]= "\\E1so^1, uh./"
	    GS.msg[9]= "\\E4i\'ve decided.../"
	    GS.msg[10]= "it\'s not gonna BE&your turn^1.&ever./"
	    GS.msg[11]= "\\E3i\'m just gonna&keep having MY&turn until you&give up./"
	    GS.msg[12]= "\\E5even if it means&we have to stand&here until the&end of time./"
	    GS.msg[13]= "\\E1capiche?/%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    lac= 66
	}
	if(lac == 66 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    lac= 67
	    $Alarm5.start((300) / 30.0)
	}
	if(lac == 68) {
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "\\E9you\'ll get bored&here./"
	    GS.msg[1]= "\\E1if you haven\'t&gotten bored&already^1, i mean./"
	    GS.msg[2]= "\\E5and then^1, you\'ll&finally quit./%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    lac= 69
	}
	if(lac == 69 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    lac= 70
	    $Alarm5.start((300) / 30.0)
	}
	if(lac == 71) {
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "\\E5i know your type./"
	    GS.msg[1]= "\\E1you\'re^1, uh^1, very&determined^1, aren\'t&you?/"
	    GS.msg[2]= "\\E4you\'ll never give&up^1, even if&there\'s^1, uh.../"
	    GS.msg[3]= "\\E3absolutely NO&benefit to&persevering&whatsoever./"
	    GS.msg[4]= "\\E1if i can make&that clear./"
	    GS.msg[5]= "\\E4no matter what^1,&you\'ll just keep&going./"
	    GS.msg[6]= "\\E9not out of any&desire for good&or evil.../"
	    GS.msg[7]= "\\E3but just because&you think you&can./"
	    GS.msg[8]= "\\E1and because you&" + chr(ord('"')) + "can" + chr(ord('"')) + ".../"
	    GS.msg[9]= "\\E9... you " + chr(ord('"')) + "have to." + chr(ord('"')) + "/%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    lac= 72
	}
	if(lac == 72 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    lac= 73
	    $Alarm5.start((300) / 30.0)
	}
	if(lac == 74) {
	    GS.msc= 0
	    GS.typer= 109
	    GS.msg[0]= "\\E9but now^1, you\'ve&reached the end./"
	    GS.msg[1]= "\\E4there is nothing&left for you now./"
	    GS.msg[2]= "\\E1so^1, uh^1, in my&personal opinion.../"
	    GS.msg[3]= "\\E3the most&" + chr(ord('"')) + "determined" + chr(ord('"')) + "&thing you can&do here?/"
	    GS.msg[4]= "\\E1is to^1, uh^1,&completely give&up./"
	    GS.msg[5]= "\\E3and..^1. (yawn)&do literally&anything else./%%"
	    scr_blcon_x(obj_sansb.x + 120, y - 10)
	    lac= 75
	}
	if(lac == 75 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 0
	    lac= -1
	}
	if(lac == 999) {
	    obj_heart.speed= 0
	    lac= 6
	    obj_heart.movement= 1
	    b1= instance_create(-40, GS.idealborder[2] - 120, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= 7
	    b1= instance_create(720, GS.idealborder[3] - 80, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 660/* spr_s_bonewall_tall */
	    b1.velocity.x= -8
	    b1= instance_create(GS.idealborder[0] - 110, GS.idealborder[2] - 150, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= 6
	    b1= instance_create(GS.idealborder[1] - 70, GS.idealborder[3] + 150, 500/* obj_bonewall_normal */)
	    b1.sprite_index= 667/* spr_s_bonewall_wide */
	    b1.velocity.y= -6
	    lac= 10
	}
	if(test_timer_on == 1) test_timer++
	if(mk_c == 1) {
	    mk_c_timer++
	    if(mk_c_timer >= 15) {
	        GS.flag[20]= 1
	        GS.faceemotion= 3
	        mk_c= 2
	        bs= instance_create(0, 0, 502/* obj_bonestab */)
	        bs.retain= 300
	        bs.height= 100
	        bs.dir= 0
	        bs.warning= 0
	    }
	}
	if(GS.damagetimer > 0 and dodge == 0) dodge= 1
	if(dodge == 1) {
	    timerbonus= GS.damagetimer
	    dg_t= 0
	    dg_x= x
	    velocity.x= -12
	    dodge= 2
	}
	if(dodge == 2) {
	    if(x < dg_x - 60 and dg_t < 20) {
	        if(velocity.x < 0) velocity.x+= 2
	        else  velocity.x= 0
	    }
	    dg_t++
	    if(dg_t >= 20 + timerbonus) {
	        if(velocity.x < 12) velocity.x+= 2
	        if(x >= dg_x - 13) {
	            velocity.x= 0
	            x= dg_x
	            dodge= 0
	            GS.damagetimer= -1
	        }
	    }
	}
	if(death_c == 1) {
	    snd_play(44/* snd_laz */)
	    GS.faceemotion= 0
	    asleep= 0
	    sweat= 0
	    bounce= 0
	    dg_t= 0
	    dg_x= x
	    st= instance_create(x, y - 30, 509/* obj_strike_temp */)
	    st.scale.x= 1.5
	    st.scale.y= 1.5
	    st.image_speed= 0.334
	    velocity.x= -12
	    death_c= 2
	}
	if(death_c == 2 and x < dg_x - 60 and dg_t < 50) {
	    if(velocity.x < 0) velocity.x+= 2
	    else  {
	        velocity.x= 0
	        death_c= 3
	        GS.msc= 0
	        GS.typer= 109
	        GS.msg[0]= "heh^1, didja&really think you&would be able to"
	        scr_blcon_x(x + 80, y - 10)
	        $Alarm6.start((50) / 30.0)
	    }
	}
	if(death_c == 3) {
	    GS.faceemotion= 3
	    GS.flag[20]= 1
	    bof_d= 0
	}
	if(death_c == 4) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_blconwideslave
	    with(188) instance_destroy()
	    snd_play(44/* snd_laz */)
	    st= instance_create(x - 10, y - 30, 509/* obj_strike_temp */)
	    st.scale.x= 1.5
	    st.scale.y= 1.5
	    st.image_speed= 0.25
	    death_c= 5
	    $Alarm6.start((50) / 30.0)
	    hit_x= x
	    GS.faceemotion= 6
	}
	if(death_c == 5) {
	    if(bof_d < 4)
	        draw_sprite_ext(670/* spr_bof_what */, floor(bof_d), x, y - 50, 2, 2, 0, 16777215, 1)
	    bof_d++
	}
	if(death_c == 6) {
	    // obj_sansb
	    with(519) {
	        x= mypart1.x - 60
	        GS.damage= 9999999
	        dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 50, 189/* obj_dmgwriter */)
	        with(dmgwriter) {
	            dmg= 9999999
	            drawbar= 0
	        }
	    }
	    snd_play(51/* snd_damage */)
	    deadtest= 1
	    GS.flag[20]= 3
	    x= hit_x + 32
	    death_c= 7
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 8) {
	    x= hit_x - 28
	    death_c= 9
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 10) {
	    GS.flag[20]= 3
	    x= hit_x + 24
	    death_c= 11
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 12) {
	    x= hit_x - 20
	    death_c= 13
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 14) {
	    GS.flag[20]= 3
	    x= hit_x + 16
	    death_c= 15
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 16) {
	    x= hit_x - 12
	    death_c= 17
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 18) {
	    GS.flag[20]= 3
	    x= hit_x + 8
	    death_c= 19
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 20) {
	    x= hit_x - 4
	    death_c= 21
	    $Alarm6.start((4) / 30.0)
	}
	if(death_c == 22) {
	    xoff= 0
	    yoff= 0
	    headx= 0
	    heady= 0
	    legx= 0
	    legy= 0
	    x= hit_x
	    death_c= 23
	    $Alarm6.start((110) / 30.0)
	}
	if(death_c >= 8 and death_c < 22) {
	    bounce= -1
	    xoff= choose(0, -2, 2)
	    yoff= choose(0, -2, 2)
	    legx= choose(0, -1, 1)
	    legy= choose(0, -1, 1)
	}
	if(death_c == 24) {
	    // obj_dmgwriter
	    with(189) instance_destroy()
	    bounce= 3
	    deadtest= 1
	    GS.faceemotion= 4
	    GS.flag[20]= 4
	    death_c= 25
	    $Alarm6.start((30) / 30.0)
	}
	if(death_c == 26) {
	    GS.msc= 0
	    GS.typer= 107
	    GS.msg[0]= ".../"
	    GS.msg[1]= ".../"
	    GS.msg[2]= ".../"
	    GS.msg[3]= "so.../"
	    GS.msg[4]= "guess that\'s it^1,&huh?/"
	    GS.msg[5]= ".../"
	    GS.msg[6]= "just.../"
	    GS.msg[7]= "don\'t say i&didn\'t warn you./%%"
	    scr_blcon_x(x + 80, y - 10)
	    death_c= 27
	}
	if(death_c == 27 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 0) GS.faceemotion= 10
	    if(OBJ_WRITER.stringno == 1) GS.faceemotion= 7
	    if(OBJ_WRITER.stringno == 2) GS.faceemotion= 11
	    if(OBJ_WRITER.stringno == 3) GS.faceemotion= 7
	    if(OBJ_WRITER.stringno == 4) GS.faceemotion= 7
	    if(OBJ_WRITER.stringno == 5) GS.faceemotion= 11
	    if(OBJ_WRITER.stringno == 6) GS.faceemotion= 10
	    if(OBJ_WRITER.stringno == 7) GS.faceemotion= 10
	}
	if(death_c == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    death_c= 27.1
	    $Alarm6.start((60) / 30.0)
	}
	if(death_c == 28.1) {
	    bounce= 0
	    GS.faceemotion= 10
	    GS.flag[20]= 5
	    deadtest= 0
	    death_c= 28
	    $Alarm6.start((80) / 30.0)
	}
	if(death_c == 29) {
	    GS.msc= 0
	    GS.typer= 107
	    GS.msg[0]= "welp./"
	    GS.msg[1]= "i\'m going to&grillby\'s./%%"
	    scr_blcon_x(x + 80, y - 10)
	    death_c= 30
	}
	if(instance_exists(782/* OBJ_WRITER */) and death_c == 30) {
	    if(OBJ_WRITER.stringno == 0) GS.faceemotion= 10
	    if(OBJ_WRITER.stringno == 1) {
	        GS.faceemotion= 8
	        GS.flag[20]= 6
	    }
	}
	if(death_c == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 10
	    GS.flag[20]= 5
	    bounce= 2
	    velocity.x= -2
	    d_sin= 0
	    death_c= 31
	}
	if(death_c == 31) {
	    d_sin++
	    dsp= sin(d_sin / 10) * 1
	    velocity.x= -1 - dsp
	    if(x < -180) death_c= 32
	}
	if(death_c == 32) {
	    GS.msc= 0
	    GS.typer= 107
	    GS.msg[0]= "papyrus^1, do you&want anything?/%%"
	    scr_blcon_x(20, y - 10)
	    death_c= 33
	}
	if(death_c == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    death_c= 34
	    $Alarm6.start((60) / 30.0)
	}
	if(death_c == 35) {
	    ini_open("undertale.ini")
	    san_d= ini_read_real("Sans", "SK", 0)
	    ini_write_real("Sans", "SK", san_d + 1)
	    ini_close()
	    snd_play(91/* snd_vaporized */)
	    death_c= 36
	    $Alarm6.start((140) / 30.0)
	    if(GS.xp < 99999) GS.xp= 99999
	    scr_levelup()
	}
	if(death_c == 37) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    death_c= 38
	    caster_free(-3)
	    $Alarm6.start((20) / 30.0)
	}
	if(death_c == 39) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    room_goto(GS.currentroom)
	}
	if(asleep == 1) {
	    asleep_timer++
	    if(asleep_timer == 10)
	        instance_create(x + 20, y - 10, 508/* obj_sans_z_battle */)
	    if(asleep_timer == 20)
	        instance_create(x + 20, y - 10, 508/* obj_sans_z_battle */)
	    if(asleep_timer == 30)
	        instance_create(x + 20, y - 10, 508/* obj_sans_z_battle */)
	    if(asleep_timer == 80) asleep_timer= 0
	}
	if(sleep_c == 9) {
	    sleep_c= 1
	    drawborder= 0
	    // obj_heart
	    with(743) ignore_border= 1
	    // obj_borderparent
	    with(757) ignore_border= 1
	    // obj_borderparent
	    with(757) visible= 0
	    // obj_borderparent
	    with(757) solid= 0
	    instance_create(GS.idealborder[0], GS.idealborder[2], 507/* obj_emptyborder_s */)
	    // obj_borderparent
	    with(757) instaborder= 1
	    instance_create(obj_fightbt.x, obj_fightbt.y, 506/* obj_s_fakefightbt */)
	    // obj_fightbt
	    with(750) visible= 0
	    GS.idealborder[0]= -10
	    GS.idealborder[3]= 999
	    GS.faceemotion= 9
	    sweat= 3
	    bounce= 3
	    // obj_heart
	    with(743) {
	        ignore_border= 1
	        movement= 1
	        speed= 0
	    }
	}
	if(sleep_c == 1) {
	    if(lac > 60) {
	        if(sleep_t < -10) sleep_t++
	    } else  sleep_t++
	    if(sleep_t < 1200 and obj_heart.x < obj_emptyborder_s.x + 10) {
	        snd_play(28/* snd_bell */)
	        obj_heart.x= obj_emptyborder_s.x + 78
	        obj_heart.y= obj_emptyborder_s.y + 78
	        sleep_t= -95
	        facetype= 1
	        GS.faceemotion= 0
	    }
	    if(sleep_t == -92) facetype= 0
	    if(sleep_t == 0) GS.faceemotion= 9
	    if(sleep_t == 300) {
	        GS.faceemotion= 12
	        if(sweat > 0) sweat--
	    }
	    if(sleep_t == 600) {
	        GS.faceemotion= 13
	        if(sweat > 0) sweat--
	    }
	    if(sleep_t == 900) {
	        GS.faceemotion= 14
	        if(sweat > 0) sweat--
	    }
	    if(sleep_t == 1200) {
	        GS.faceemotion= 4
	        asleep= 1
	        sleep_c= 2
	    }
	}
	if(GS.km > 40) GS.km= 40
	if(GS.km > GS.hp) GS.km= GS.hp - 1
	if(GS.km > 0 and GS.hp > 1) {
	    km_t++
	    if(prevhp == GS.hp) {
	        km_bonus= 0
	        if(GS.inv >= 45) km_bonus= choose(0, 1)
	        if(GS.inv >= 60) km_bonus= choose(0, 1, 1)
	        if(GS.inv >= 75) km_bonus= 1
	        if(km_t >= 1 + km_bonus and GS.km >= 40) {
	            km_t= 0
	            GS.hp--
	            GS.km--
	        }
	        if(km_t >= 2 + km_bonus * 2 and GS.km >= 30) {
	            km_t= 0
	            GS.hp--
	            GS.km--
	        }
	        if(km_t >= 5 + km_bonus * 3 and GS.km >= 20) {
	            km_t= 0
	            GS.hp--
	            GS.km--
	        }
	        if(km_t >= 15 + km_bonus * 5 and GS.km >= 10) {
	            km_t= 0
	            GS.hp--
	            GS.km--
	        }
	        if(km_t >= 30 + km_bonus * 10) {
	            km_t= 0
	            GS.hp--
	            GS.km--
	        }
	        if(GS.hp <= 0) GS.hp= 1
	    }
	    prevhp= GS.hp
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
