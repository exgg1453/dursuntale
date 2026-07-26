# Auto-converted from GameMaker: obj_mettaton_neo
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 451
	mypart1= _spawn("part1", x + 104, y + 50)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999999
	sha= 0
	shb= 0
	ht= 240
	wd= 200
	// obj_battlebg
	with(185) instance_destroy()
	con= 0

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "Default"
	if(mycommand < 75) GS.msg[0]= "No 2"
	if(mycommand < 50) GS.msg[0]= "No 3"
	if(mycommand < 25) GS.msg[0]= "No 4"
	if(whatiheard == 1) GS.msg[0]= "Action1"
	if(whatiheard == 3) GS.msg[0]= "Action2"
	if(whatiheard == 4) GS.msg[0]= "Action3"
	GS.msg[1]= "%%%"
	GS.typer= 2

func _gm_event_2_5():
	talked= 0
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    caster_free(-3)
	    dmgwriter= instance_create(x, y + 200, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    GS.damage= GS.monsterhp[myself] + 4000 + floor(random(3289))
	    if(scr_murderlv() >= 15) GS.damage= 900000 + floor(random(99999))
	    with(dmgwriter) dmg= GS.damage
	    shk= instance_create(0, 0, 1669/* obj_objshake */)
	    shk.obj= mypart1
	    with(mypart1) {
	        siner= 0
	        burston= 0
	        GS.faceemotion= 6
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
	    $Alarm5.start((2) / 30.0)
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
	    GS.myfight= -1
	    GS.mnfight= -1
	    con= 20
	    $Alarm4.start((45) / 30.0)
	    GS.hurtanim[myself]= -1
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
	            gen= instance_create(x, y, 334/* obj_lavafiregen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else 
	            gen= instance_create((GS.idealborder[0] + GS.idealborder[1]) / 2 - 30, GS.idealborder[2] + 2, 331/* obj_vulkincloudbul */)
	        if(mycommand >= 0) GS.msg[0]= "* Stage lights are blaring."
	        attacked= 1
	    }
	    if(mercymod == -999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    GS.msg[0]= "* Stage lights are blaring."
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* METTATON NEO - 90 ATK 9 DEF&* Dr. Alphys\'s greatest&  invention./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) script_execute(163/* scr_mercystandard */)
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */))
	    script_execute(163/* scr_mercystandard */)
	if(con == 21) {
	    mypart1.velocity.x= -3
	    con= 22
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 23) {
	    with(mypart1) event_user(0)
	    mypart1.velocity.x= 0
	    // obj_dmgwriter
	    with(189) instance_destroy()
	    GS.faceemotion= 6
	    GS.typer= 97
	    GS.msc= 0
	    if(scr_murderlv() < 15) {
	        GS.msg[0]= "\\E6G...&GUESS SHE SHOULD&HAVE WORKED MORE&ON THE DEFENSES.../"
	        GS.msg[1]= "\\E6.../"
	        GS.msg[2]= "\\E6YOU MAY HAVE&DEFEATED ME...&BUT.../"
	        GS.msg[3]= "\\E4I KNOW.&I CAN TELL FROM&THAT STRIKE, DARLING./"
	        GS.msg[4]= "\\E5YOU WERE HOLDING&BACK./"
	        GS.msg[5]= "\\E6YES, ASGORE WILL&FALL EASILY TO&YOU.../"
	        GS.msg[6]= "\\E5BUT YOU WON\'T&HARM HUMANITY,&WILL YOU?/"
	        GS.msg[7]= "\\E1YOU AREN\'T&ABSOLUTELY EVIL./"
	        GS.msg[8]= "\\E5IF YOU WERE&TRYING TO BE,&THEN YOU MESSED UP./"
	        GS.msg[9]= "\\E0AND SO LATE INTO&THE SHOW, TOO./"
	        GS.msg[10]= "\\E0HA... HA.&AT LEAST NOW,&I CAN REST EASY./"
	        GS.msg[11]= "\\E3KNOWING ALPHYS AND&THE HUMANS WILL&LIVE ON...!/%%"
	    } else  {
	        GS.msg[0]= "\\E6GH.../"
	        GS.msg[1]= "\\E5GUESS YOU DON\'T&WANNA JOIN MY&FAN CLUB...?/%%"
	    }
	    con= 24
	    blc= scr_blcon_x(x + 180, y + 20)
	}
	if(con == 24 and not instance_exists(782/* OBJ_WRITER */)) {
	    explode= caster_load("music/explosion.ogg")
	    mypart1.fadewhite= 1
	    con= 25
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 26) {
	    GS.flag[8]= 1
	    caster_play(explode, 1, 1)
	    if(scr_murderlv() >= 15) {
	        if(GS.xp <= 50000) GS.xp= 50000
	        GS.kills++
	    } else  GS.xp+= 10000
	    scr_levelup()
	    GS.flag[425]= 1
	    con= 27
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
