# Auto-converted from GameMaker: obj_migosp
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= -100
	$Alarm7.start((20 + random(40)) / 30.0)
	image_speed= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 2
	    GS.flag[135]= 1
	}

func _gm_event_2_8():
	image_speed= 0

func _gm_event_2_7():
	image_speed= 0.5
	if(mercymod < 0) {
	    $Alarm8.start((10) / 30.0)
	    $Alarm7.start((30 + random(40)) / 30.0)
	} else  image_speed= 0.1

func _gm_event_2_6():
	if(GS.monster[0] + GS.monster[1] + GS.monster[2] - GS.monster[myself] == 0)
	    mercymod= 100
	if(mercymod > 0) {
	    sprite_index= 188/* spr_migosphappy */
	    image_speed= 0.1
	}
	blcon= instance_create(x + sprite_width - 8, ystart, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mercymod < 0) {
	    if(mycommand >= 0 and mycommand < 20)
	        GS.msg[0]= "FILTHY&SINGLE&MINDER.."
	    if(mycommand >= 20 and mycommand < 40)
	        GS.msg[0]= "OBEY&THE&OVERMIND&.."
	    if(mycommand >= 40 and mycommand < 60)
	        GS.msg[0]= "LEGION!&WE&ARE&LEGION"
	    if(mycommand >= 60 and mycommand <= 80)
	        GS.msg[0]= "HEED&THE&SWARM"
	    if(mycommand >= 80 and mycommand <= 100)
	        GS.msg[0]= "IN&UNISON,&NOW"
	    if(whatiheard == 1 or whatiheard == 3)
	        GS.msg[0]= "I&DON\'T&CARE."
	}
	if(mercymod > 0) {
	    if(mycommand >= 0 and mycommand < 20)
	        GS.msg[0]= "Bein\' me&is the&best!"
	    if(mycommand >= 20 and mycommand < 40)
	        GS.msg[0]= "La la~&Just be&yourself~"
	    if(mycommand >= 40 and mycommand < 60)
	        GS.msg[0]= "Nothin\'&like&alone&time!"
	    if(mycommand >= 60 and mycommand <= 80)
	        GS.msg[0]= "Mmm, cha&cha cha!"
	    if(mycommand >= 80 and mycommand <= 100)
	        GS.msg[0]= "Swing&your&arms,&baby"
	    if(whatiheard == 1 or whatiheard == 3) GS.msg[0]= "Hiya~"
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 3
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_3():
	if(sprite_index != 187) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 80, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    sprite_index= 187/* spr_migosphurt */
	    snd_play(hurtsound)
	}
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	scr_blconmatch()
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((60) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        sprite_index= 186/* spr_migosp */
	        if(mercymod > 0) sprite_index= 188/* spr_migosphappy */
	        frame= 0
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
	if(GS.mnfight == 2 and attacked == 0) {
	    GS.turntimer= 110
	    GS.firingrate= 6
	    if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	        mycommand= 99
	    if(mercymod < 0) {
	        if(mycommand < 5) {
	            GS.firingrate= 15
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            gen.bullettype= 1
	        }
	        if(mycommand >= 5) {
	            GS.firingrate= 7
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            gen.bullettype= 4
	        }
	    } else  gen= instance_create(0, 0, 626/* blt_roachdance */)
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0) GS.msg[0]= "* Migosp skitters around."
	    if(mycommand >= 30) GS.msg[0]= "* Migosp is knitting its brow."
	    if(mycommand >= 70)
	        GS.msg[0]= "* Migosp is whispering to the&  others."
	    if(mycommand >= 90)
	        GS.msg[0]= "* It\'s starting to smell like&  a roach motel."
	    if(mercymod > 0)
	        GS.msg[0]= "* Migosp doesn\'t have a care&  in the world."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Migosp refuses to give&  up."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MIGOSP - ATK 7 DEF 5&* It seems evil^1, but it\'s&  just with the wrong crowd.../^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.flag[135]= 1
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}

func _gm_event_7_0():
	if(outside == 0) {
	    OBJ_WRITER.halt= 3
	    GS.monster[myself]= 0
	    if(GS.mnfight == 2) GS.mnfight= 1
	    outside= 1
	    instance_destroy()
	    GS.flag[13]= 1
	    GS.flag[14]= 3
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
