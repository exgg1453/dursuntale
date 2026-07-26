# Auto-converted from GameMaker: obj_spearblocker
extends Node2D

func _ready():
	x_blue= merge_color(16711680, 16777215, 0.25)
	flash= 0
	dir= 0
	idealdir= 0
	old= 0
	neg= 0
	lesson= 0
	order= 0
	rating= 10
	refuse= 0
	buffer= 0
	sound0= 28
	sound1= 53
	idealdir= 270
	dmg= 7

func _process(delta: float):
	ender= 0
	buffer++
	if(refuse != 2) {
	    if(GS.turntimer < 1) {
	        GS.turntimer= -1
	        ender= 1
	    }
	    if(obj_heart.sprite_index != 39) ender= 1
	    if(buffer > 30 and not instance_exists(265/* obj_blockbullet */) and not instance_exists(266/* obj_blockbullet2 */) and instance_exists(264/* obj_greenspeargen */) and obj_greenspeargen.done == 1)
	        ender= 1
	}
	if(ender == 1) {
	    // obj_blockbullet
	    with(265) instance_destroy()
	    // obj_blockbullet2
	    with(266) instance_destroy()
	    if(refuse == 0) GS.mnfight= 4
	    if(refuse == 1) {
	        if(lesson == 6 or lesson == 11 or lesson == 20) {
	            // obj_undyneboss
	            with(272) darkify= 3
	            // obj_undyneboss
	            with(272) event_user(1)
	        }
	        if(lesson == -7 or lesson == -10 or lesson == -14) {
	            // obj_undyne_ex
	            with(282) {
	                darkify= 3
	                event_user(1)
	            }
	        }
	    }
	    instance_destroy()
	}

func _gm_event_7_15():
	with(col2) instance_destroy()
	// obj_blockbullet
	with(265) down= 1
	if(GS.invc < 1) {
	    // obj_undyneboss
	    with(272) hitno++
	}
	// obj_undyne_ex
	with(282) hitno++
	scr_damagestandard(0, 0, 0, 0, 0)

func _gm_event_7_14():
	with(col) instance_destroy()
	// obj_blockbullet
	with(265) down= 1
	dir= idealdir
	flash= 5
	snd_play(sound0)

func _gm_event_7_11():
	if(instance_exists(264/* obj_greenspeargen */)) {
	    // obj_greenspeargen
	    with(264) instance_destroy()
	}
	gen= instance_create(0, 0, 264/* obj_greenspeargen */)
	if(is_instance_valid(gen)) gen.rating= rating
	i= 0
	if(lesson == -51) {
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 2, 0)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	    scr_sr(4, 0, 1, 1.4)
	}
	if(lesson == -50) {
	    scr_sr(3, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	}
	if(lesson == -40) {
	    repeat(15)  scr_sr(4, 0, 0, 2)
	    gen.dmg= 1
	    dmg= 1
	}
	if(lesson == -39) {
	    rating= 12
	    repeat(12)  scr_sr(4, 0, 0, 1.2)
	    gen.dmg= 1
	    dmg= 1
	    gen.rating+= 2
	    GS.turntimer= 300
	}
	if(lesson == -38) {
	    scr_sr(0, 0, 0, 0.8)
	    scr_sr(1, 0, 0, 0.8)
	    scr_sr(2, 0, 0, 0.8)
	    scr_sr(3, 0, 0, 0.8)
	    scr_sr(0, 0, 0, 0.8)
	    scr_sr(1, 0, 0, 0.8)
	    scr_sr(2, 0, 0, 0.8)
	    scr_sr(3, 0, 0, 0.8)
	    gen.rating= 16
	    GS.turntimer= 300
	    gen.dmg= 1
	    dmg= 1
	}
	if(lesson == -37) {
	    GS.turntimer= 300
	    scr_sr(0, 0, 0, 0.5)
	    scr_sr(1, 0, 0, 0.5)
	    scr_sr(0, 0, 0, 0.5)
	    scr_sr(1, 0, 0, 0.5)
	    scr_sr(1, 0, 0, 0.5)
	    scr_sr(0, 0, 0, 0.5)
	    scr_sr(0, 0, 0, 0.5)
	    scr_sr(1, 0, 0, 0.5)
	    gen.rating= 20
	    gen.dmg= 1
	    dmg= 1
	}
	if(lesson >= -36 and lesson < -25) {
	    GS.turntimer= 300
	    gen.rating= 34
	    repeat(3)  scr_sr(3, 0, 1, 0.25)
	    gen.dmg= 1
	    dmg= 1
	}
	if(lesson == -5) {
	    scr_sr(3, 0, 2, 0.5)
	    scr_sr(3, 0, 2, 0.5)
	    scr_sr(3, 0, 6.5, 0.5)
	    scr_sr(1, 0, 0, 1.6)
	    scr_sr(2, 0, 0, 1.6)
	    scr_sr(0, 0, 0, 1.6)
	    scr_sr(3, 0, 0, 1.6)
	    scr_sr(0, 0, 0, 1.6)
	    scr_sr(2, 0, 0, 1.6)
	    scr_sr(1, 0, 0, 1.6)
	    scr_sr(2, 0, 0, 1.6)
	    scr_sr(0, 0, 0, 1.6)
	    scr_sr(3, 0, 0, 1.6)
	}
	if(lesson == -6) {
	    scr_sr(0, 0, 0, 1.8)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(0, 0, 0.5, 1.8)
	    scr_sr(0, 0, 0, 1.8)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(0, 0, 0, 1.8)
	    scr_sr(1, 0, 0.5, 1.8)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(0, 0, 0, 1.8)
	    scr_sr(1, 0, 0, 2)
	    scr_sr(0, 0, 0, 2)
	    scr_sr(1, 0, 0, 2)
	    scr_sr(0, 0, 0, 2)
	}
	if(lesson == -7) {
	    repeat(18)  scr_sr(4, 0, 0, 0.4)
	    refuse= 1
	}
	if(lesson == -8) {
	    scr_sr(3, 0, 0, 1)
	    scr_sr(0, 0, 0, 1.8)
	    scr_sr(2, 0, 0, 1)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(0, 0, 0, 1)
	    scr_sr(3, 0, 0, 0.5)
	    scr_sr(2, 0, 0, 0.47)
	    scr_sr(1, 0, 0, 1.8)
	    scr_sr(0, 0, 0, 1)
	}
	if(lesson == -9) {
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0, 2)
	    scr_sr(0, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0, 2)
	    scr_sr(1, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 1, 2)
	    scr_sr(0, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 1, 2)
	    scr_sr(1, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	    scr_sr(3, 0, 0.5, 2)
	}
	if(lesson == -10) {
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(0, 1, 0, 0)
	    scr_sr(3, 1, 0, 0)
	    scr_sr(0, 1, 0, 0)
	    scr_sr(3, 1, 0, 0)
	    scr_sr(0, 1, 0, 0)
	    scr_sr(3, 1, 0, 0)
	    refuse= 1
	}
	if(lesson == -11) {
	    scr_sr(1, 1, 1.25, 2)
	    scr_sr(3, 1, 1.25, 2)
	    scr_sr(0, 1, 1.25, 2)
	    scr_sr(2, 1, 2, 2)
	    scr_sr(3, 0, 1.25, 2)
	    scr_sr(0, 0, 1.25, 2)
	    scr_sr(2, 0, 1.25, 2)
	    scr_sr(1, 0, 2, 2)
	    scr_sr(2, 1, 1.25, 2)
	    scr_sr(0, 1, 1.25, 2)
	    scr_sr(1, 1, 1.25, 2)
	    scr_sr(3, 1, 1.25, 2)
	}
	if(lesson == -12) {
	    repeat(2)  {
	        scr_sr(0, 0, 0, 1.3)
	        scr_sr(1, 0, 0, 1.3)
	        scr_sr(3, 0, 0.1, 1.3)
	        scr_sr(2, 1, 2.2, 1.3)
	        scr_sr(0, 0, 0, 1.3)
	        scr_sr(1, 0, 0, 1.3)
	        scr_sr(2, 0, 0.1, 1.3)
	        scr_sr(3, 1, 2.2, 1.3)
	    }
	}
	if(lesson == -13) {
	    scr_sr(0, 0, 0, 1.5)
	    scr_sr(0, 1, 2, 1.5)
	    scr_sr(2, 0, 0, 1.5)
	    scr_sr(2, 1, 2, 1.5)
	    scr_sr(1, 0, 0, 1.5)
	    scr_sr(1, 1, 2.2, 1.5)
	    scr_sr(3, 0, 0, 1.5)
	    scr_sr(3, 1, 2, 1.5)
	    scr_sr(0, 0, 0, 1.5)
	    scr_sr(0, 1, 2, 1.5)
	    scr_sr(2, 0, 0, 1.5)
	    scr_sr(2, 1, 2, 1.5)
	    scr_sr(1, 0, 0, 1.5)
	    scr_sr(1, 1, 2.2, 1.5)
	}
	if(lesson == -14) {
	    repeat(24)  scr_sr(4, 0, 0, 0.3)
	    refuse= 1
	}
	if(lesson == 0) {
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 0, 0.5, 0)
	    scr_sr(0, 0, 0.5, 0)
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(1, 2, 0, 0)
	    scr_sr(1, 2, 0, 0)
	}
	if(lesson == 1) {
	    repeat(3)  scr_sr(3, 0, 1, 0.5)
	}
	if(lesson == 2) {
	    scr_sr(3, 0, 1, 0.625)
	    scr_sr(3, 0, 1, 0.625)
	    scr_sr(0, 0, 1, 0.625)
	    scr_sr(0, 0, 1, 0.625)
	    scr_sr(1, 0, 1, 0.625)
	    scr_sr(1, 0, 1, 0.625)
	}
	if(lesson == 3) {
	    scr_sr(0, 0, 0, 0.75)
	    scr_sr(1, 0, 0, 0.75)
	    scr_sr(0, 0, 0, 0.75)
	    scr_sr(1, 0, 0, 0.75)
	    scr_sr(1, 0, 0, 0.75)
	    scr_sr(0, 0, 0, 0.75)
	    scr_sr(0, 0, 0, 0.75)
	    scr_sr(2, 0, 0, 0.75)
	}
	if(lesson == 4) {
	    scr_sr(3, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0.5, 0)
	    scr_sr(3, 0, 0.5, 0)
	    scr_sr(3, 0, 0.5, 0)
	    scr_sr(3, 0, 0.5, 0)
	}
	if(lesson == 5) {
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0.5, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(3, 0, 0.5, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	}
	if(lesson == 6) {
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    refuse= 1
	}
	if(lesson == 7 or lesson == 8) {
	    scr_sr(3, 0, 1.2, 0)
	    scr_sr(2, 0, 1.2, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(2, 0, 0.8, 0)
	    scr_sr(3, 0, 0.8, 0)
	    scr_sr(2, 0, 0.8, 0)
	    scr_sr(3, 0, 0.8, 0)
	}
	if(lesson == 9) {
	    rr= rating
	    if(rating >= 11) rr--
	    scr_sr(0, 0, 2, 3 / rr)
	    scr_sr(3, 0, 1, 1.5)
	    scr_sr(1, 0, 1, 1.5)
	    scr_sr(2, 0, 1, 1.5)
	    scr_sr(3, 0, 1, 1.5)
	    scr_sr(1, 0, 1, 1.5)
	    scr_sr(2, 0, 1, 1.5)
	}
	if(lesson == 10) {
	    rr= 0
	    if(rating <= 11) rr= 0.5
	    scr_sr(0, 0, 0.1, 1)
	    scr_sr(0, 0, 0.1, 1.5)
	    scr_sr(0, 0, 2 + rr, 2)
	    scr_sr(1, 0, 0.1, 1)
	    scr_sr(1, 0, 0.1, 1.5)
	    scr_sr(1, 0, 2 + rr, 2)
	    scr_sr(2, 0, 1, 2)
	    scr_sr(3, 0, 1, 2)
	    scr_sr(2, 0, 1, 2)
	    scr_sr(3, 0, 1, 2)
	}
	if(lesson == 11) {
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 2.2, 0)
	    scr_sr(4, 0, 1, 1.5)
	    scr_sr(4, 0, 1, 1.5)
	    scr_sr(4, 0, 1, 1.5)
	    scr_sr(4, 0, 2.2, 1.5)
	    scr_sr(4, 0, 1, 2)
	    scr_sr(4, 0, 1, 2)
	    scr_sr(4, 0, 1, 2)
	    scr_sr(4, 0, 1, 2)
	    refuse= 1
	}
	if(lesson == 12 or lesson == 13) {
	    scr_sr(1, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(1, 1, 0, 0)
	}
	if(lesson == 14) {
	    scr_sr(0, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(2, 1, 2, 0)
	    scr_sr(2, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(3, 0, 0, 0)
	    scr_sr(2, 1, 1, 0)
	}
	if(lesson == 15) {
	    scr_sr(0, 0, 1, 1.6)
	    scr_sr(2, 0, 1, 1.6)
	    scr_sr(1, 0, 1, 1.6)
	    scr_sr(3, 0, 1.6, 1.6)
	    scr_sr(1, 1, 1.2, 0)
	    scr_sr(3, 1, 1.2, 0)
	    scr_sr(0, 1, 1.2, 0)
	    scr_sr(2, 1, 1.2, 0)
	}
	if(lesson == 16) {
	    scr_sr(1, 0, 0, 0)
	    scr_sr(1, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(0, 0, 0, 0)
	    scr_sr(2, 2, 3, 0)
	    scr_sr(3, 2, 2, 0)
	    scr_sr(2, 0, 3, 0)
	    scr_sr(1, 0, 1, 2)
	    scr_sr(0, 0, 1, 2)
	}
	if(lesson == 17) {
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 1, 1.6, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(4, 0, 0, 0)
	}
	if(lesson == 18) {
	    repeat(10)  scr_sr(4, 0, 0, 2)
	}
	if(lesson == 19) {
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 0, 0.5, 0)
	    scr_sr(0, 0, 0.5, 0)
	    scr_sr(0, 0, 1, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(1, 2, 0, 0)
	    scr_sr(1, 2, 0, 0)
	}
	if(lesson == 20) {
	    repeat(3)  {
	        scr_sr(1, 1, 1.25, 1.5)
	        scr_sr(3, 1, 1.25, 1.5)
	        scr_sr(0, 1, 1.25, 1.5)
	        scr_sr(2, 1, 1.25, 1.5)
	        refuse= 1
	    }
	}
	if(lesson > 20) {
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 0, 0, 1.6)
	    scr_sr(4, 1, 2, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(4, 0, 0, 0)
	    scr_sr(0, 2, 1, 0)
	    scr_sr(4, 0, 0, 0)
	}

func _on_outside_room():
	draw_set_circle_precision(12)
	if(flash < 2) draw_set_color(x_blue)
	else  draw_set_color(255)
	flash--
	t= degtorad(dir)
	r= 30
	draw_line_width(x - cos(t) * r + -sin(t) * r, y + sin(t) * r + -cos(t) * r, x + -cos(t) * r + sin(t) * r, y + sin(t) * r + cos(t) * r, 3)
	draw_set_color(x_blue)
	draw_line_width(x - cos(t) * r + -sin(t) * r, y + sin(t) * r + -cos(t) * r, x + -cos(t - 0.2) * r / 2 + sin(t - 0.2) * r / 2, y + sin(t - 0.2) * r / 2 + cos(t - 0.2) * r / 2, 3)
	draw_set_color(32768)
	draw_circle(x, y, r, 1)
	if(Input.is_action_pressed("move_down")) idealdir= 90
	if(Input.is_action_pressed("move_up")) idealdir= 270
	if(Input.is_action_pressed("move_left")) idealdir= 0
	if(Input.is_action_pressed("move_right")) idealdir= 180
	if(dir != idealdir) {
	    if(idealdir == 0 and dir > 180) {
	        neg= 1
	        dir-= 360
	    }
	    if(dir >= 0 and dir < 90 and idealdir == 270) {
	        neg= 2
	        dir= 360
	    }
	    if(neg == 0) {
	        dir%= 360
	        dif= idealdir - dir
	        dir+= dif * 0.666666666666667
	        if(dir < 0) dir+= 360
	        if(abs(dif) < 15) {
	            dir= idealdir
	            neg= 0
	        }
	    }
	    if(neg == 1) {
	        dir%= 360
	        dif= abs(idealdir - dir)
	        dir+= dif * 0.666666666666667
	        if(abs(abs(idealdir) - abs(dir)) < 15) {
	            dir= idealdir
	            neg= 0
	        }
	    }
	    if(neg == 2) {
	        dif= idealdir - dir
	        dir+= dif * 0.666666666666667
	        if(abs(abs(idealdir) - abs(dir)) < 15) {
	            dir= idealdir
	            neg= 0
	        }
	    }
	}
	if(old == 1 and dir != idealdir) {
	    if(dir - idealdir == 180) {
	        if(dir == 0 and idealdir == 180) dir-= 90
	        if(dir == 90 and idealdir == 270) dir-= 90
	        if(dir == 180 and idealdir == 0) dir-= 90
	        if(dir == 270 and idealdir == 90) dir-= 90
	    }
	    if(dir > 0 and dir < 180 and idealdir == 0)
	        dir-= 60
	    if(dir > 180 and dir < 360 and idealdir == 180)
	        dir-= 60
	    if(dir > 90 and dir < 270 and idealdir == 90)
	        dir-= 60
	    if(dir > 270 or dir <= 0 and idealdir == 270)
	        dir-= 60
	    dir+= 30
	    dir%= 360
	    if(dir < 0) dir+= 360
	}
	tideal= degtorad(idealdir)
	col= collision_line(x - cos(tideal) * r + -sin(tideal) * r, y + sin(tideal) * r + -cos(tideal) * r, x + -cos(tideal) * r + sin(tideal) * r, y + sin(tideal) * r + cos(tideal) * r, 265, 0, 1)
	if(col != -4) event_user(4)
	col2= collision_rectangle(x - 5, y - 5, x + 5, y + 5, 265, 0, 1)
	if(col2 != -4) event_user(5)

func _gm_event_9_83():
	if(GS.debug == 1) lesson--

func _gm_event_9_65():
	if(GS.debug == 1) lesson++

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
