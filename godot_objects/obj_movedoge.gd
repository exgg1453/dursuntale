# Auto-converted from GameMaker: obj_movedoge
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 248
	part2= 251
	part3= 250
	part4= 249
	mypart1= _spawn("part1", x, y)
	mypart2= _spawn("part2", x, y)
	mypart3= _spawn("part3", x, y)
	mypart4= _spawn("part4", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -15
	excited= -1
	pets= 0
	ht= 150
	wd= 100

func _gm_event_1_0():
	if(mercymod > 80 and mercymod < 400) GS.flag[52]= 2
	if(killed == 1) GS.flag[52]= 1
	if(killed == 0) GS.flag[27]= 1
	GS.plot= 41
	wd= 134
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()
	with(mypart3) instance_destroy()
	with(mypart4) instance_destroy()
	GS.goldreward[3]= 30

func _gm_event_2_8():
	snd_play(40/* snd_doghurt1 */)

func _gm_event_2_6():
	blcon= instance_create(x + 145, y + 52, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mercymod == -25 and scr_monstersum() == 1) mercymod= 0
	GS.msg[0]= "Don\'t&move an&inch!"
	if(excited == 1) GS.msg[0]= "It moved&!! It&didn\'t&NOT move!"
	if(GS.turn >= 1 and excited == 0)
	    GS.msg[0]= "Will it&move&this&time?"
	if(mercymod > 100 and mercymod < 800) {
	    GS.msg[0]= "HUH!!!&A FUN&STICK&APPEARS!"
	    mypart1.$Alarm0.start((30000) / 30.0)
	    mercymod= 101
	    mypart1.excited= 1
	}
	if(mercymod == 1000) {
	    GS.msg[0]= "WHAT!!!&I\'VE&BEEN&PET!!!"
	    if(pets == 2) GS.msg[0]= "WHERE\'S&THAT&COMING&FROM!"
	    if(pets == 3) GS.msg[0]= "THERE\'S&NO END&TO IT!!"
	    if(pets == 4) GS.msg[0]= "WELL,&THIS IS&THOROUGH&!!!"
	    mercymod= 999
	    GS.monsterdef[myself]= -90
	    if(pets == 4 and mypart1.excited == 0) {
	        GS.msg[0]= "OK.&That\'s&enough."
	        GS.monsterdef[myself]= 0
	    }
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 6
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	GS.border= 6

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    with(mypart3) instance_destroy()
	    with(mypart4) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
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
	if(GS.mnfight == 3) {
	    GS.msg[0]= "* Doggo can\'t seem to&  find anything."
	    if(excited == 1)
	        GS.msg[0]= "* Doggo is confirming the moving&  object."
	    if(mercymod > 100) GS.msg[0]= "* Doggo loves fetch!!!"
	    if(mercymod > 300) GS.msg[0]= "* Doggo has been pet."
	    attacked= 0
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
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        mypart2= _spawn("part2", x, y)
	        mypart3= _spawn("part3", x, y)
	        mypart4= _spawn("part4", x, y)
	        GS.hurtanim[myself]= 0
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
	    pop= scr_monstersum()
	    GS.turntimer= 120
	    GS.firingrate= 15
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 1.7
	    if(mycommand >= 0 and mycommand <= 99.9) {
	        GS.firingrate= 13
	        gen= instance_create(GS.idealborder[1] - 50, GS.idealborder[3] - 45, 655/* blt_bluesword */)
	        gen.dmg= GS.monsteratk[myself]
	        GS.border= 8
	    } else  {
	        GS.firingrate+= 10
	        gen= instance_create(x, y, 712/* obj_4sidegen */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* DOGGO - ATK 13 DEF 7&* Easily excited by movement.&* Hobbies include^1: squirrels./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* Doggo is too suspicious of&  your movements./^"
	        if(excited == 0) {
	            GS.msg[0]= "* You pet Doggo./^"
	            GS.msg[1]= "* You pet Doggo./^"
	            GS.flag[139]= 1
	            mercymod= 1000
	            if(pets < 4) {
	                pets++
	                mypart1.excited= 1
	                mypart1.$Alarm0.start((999) / 30.0)
	            } else  {
	                mypart1.excited= 0
	                mypart1.$Alarm0.start((3) / 30.0)
	                excited= 0
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
