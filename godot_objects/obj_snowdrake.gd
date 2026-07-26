# Auto-converted from GameMaker: obj_snowdrake
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 254
	part2= 255
	mypart1= _spawn("part1", x, y)
	mypart2= _spawn("part2", x, y)
	hurtanim= 0
	hurtsound= 36
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 5
	joketold= 0
	sha= 0
	ht= 240
	wd= 130

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 12
	if(killed == 1) GS.flag[57]= 2
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 145, y + 52, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mercymod == -25 and scr_monstersum() == 1) mercymod= 0
	if(mycommand >= 0 and mycommand < 14)
	    GS.msg[0]= "" + chr(ord('"')) + "Ice" + chr(ord('"')) + "&to meet&you."
	if(mycommand >= 14 and mycommand < 28)
	    GS.msg[0]= "Ice puns&are&" + chr(ord('"')) + "snow" + chr(ord('"')) + "&problem"
	if(mycommand >= 28 and mycommand < 42)
	    GS.msg[0]= "Fights&you in&" + chr(ord('"')) + "cold" + chr(ord('"')) + "&blood."
	if(mycommand >= 42 and mycommand <= 66)
	    GS.msg[0]= "Better&not snow&" + chr(ord('"')) + "flake" + chr(ord('"')) + "&out!"
	if(mycommand >= 66 and mycommand <= 80)
	    GS.msg[0]= "My fave&ice&cereals:&" + chr(ord('"')) + "frosted" + chr(ord('"')) + ""
	if(mycommand >= 80 and mycommand <= 90)
	    GS.msg[0]= "" + chr(ord('"')) + "Chill" + chr(ord('"')) + "&out..."
	if(mycommand >= 90 and mycommand <= 100)
	    GS.msg[0]= "M.. m..&macaroni&and&" + chr(ord('"')) + "freeze" + chr(ord('"')) + ""
	if(mercymod == -25) {
	    if(gg == 0) GS.msg[0]= "Do I&really&..."
	    if(gg == 1) GS.msg[0]= "Hey..."
	    if(gg == 2) GS.msg[0]= "Guys...&guys..."
	}
	if(whatiheard == 3) {
	    if(joketold == 1) {
	        if(gg == 0) GS.msg[0]= "You have&good&taste!!&(In jokes)"
	        if(gg == 1) GS.msg[0]= "See!?&Laughs!&Dad was&wrong!"
	        if(gg == 2) GS.msg[0]= "Thanks,&you\'re&all&great."
	        if(GS.flag[57] == 0) GS.msg[0]= "See!?&Laughs!&Dad was&wrong!"
	        GS.flag[57]= 1
	    }
	    if(joketold == 0) GS.msg[0]= "What are&YOU&laughin\'&at?!?"
	    $Alarm5.start((108) / 30.0)
	}
	if(whatiheard != 1 and whatiheard != 3 and whatiheard != 4 and whatiheard != 19 and whatiheard != 20 and mercymod != -25)
	    joketold= 1
	if(whatiheard == 4) {
	    if(gg == 0) GS.msg[0]= "Is that&s\'posed&to be&funny?"
	    if(gg == 1) GS.msg[0]= "Ha...&Ha...&Nice&try."
	    if(gg == 2) GS.msg[0]= "I\'ve&heard&that&one."
	}
	if(whatiheard == 1) {
	    if(gg == 0) GS.msg[0]= "THIS&won\'t be&funny&either!"
	    if(gg == 1) GS.msg[0]= "Is your&flesh&rotten&as you?"
	    if(gg == 2) GS.msg[0]= "(Insults&towards&humans)"
	    joketold= 0
	}
	if(whatiheard == 20) {
	    if(gg == 0) GS.msg[0]= "IT\'S&JUST&LIKE&\'EM"
	    if(gg == 1) GS.msg[0]= "HAHA&YOU\'RE&BETTER"
	    if(gg == 2) GS.msg[0]= "YOU&NAILED&IT"
	    mercymod= 200
	}
	if(whatiheard == 19) {
	    if(gg == 0) GS.msg[0]= "That\'s&not&like&me..."
	    if(gg == 1) GS.msg[0]= "I don\'t&do it&that&way..."
	    if(gg == 2) GS.msg[0]= "It\'s&better&when I&do it..."
	    mercymod= -25
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
	GS.border= 7

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    dmgwriter= instance_create(x + 20, y - 10, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
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
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        mypart2= _spawn("part2", x, y)
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
	    if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	        pop--
	    GS.turntimer= 120
	    if(pop == 2) GS.turntimer= 130
	    GS.firingrate= 16
	    if(pop == 3) GS.firingrate*= 2.4
	    if(pop == 2) GS.firingrate*= 2
	    if(mycommand >= 0 and mycommand <= 50) {
	        gen= instance_create(x, y, 712/* obj_4sidegen */)
	        gen.bullettype= 1
	    } else  {
	        GS.firingrate+= 8
	        gen= instance_create(x, y, 712/* obj_4sidegen */)
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Snowdrake is assessing the&  crowd."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Snowdrake is practicing&  its next pun."
	    if(mycommand >= 40)
	        GS.msg[0]= "* Snowdrake is smiling at its&  own bad joke."
	    if(mycommand >= 60)
	        GS.msg[0]= "* It smells like a wet&  pillow."
	    if(mycommand >= 80)
	        GS.msg[0]= "* Snowdrake realized its own&  name is a pun and is&  freaking out."
	    if(mercymod == 80)
	        GS.msg[0]= "* Snowdrake is pleased with&  its " + chr(ord('"')) + "cool" + chr(ord('"')) + " joke."
	    if(mercymod == 200)
	        GS.msg[0]= "* Snowdrake is laughing at&  your imitation of its&  cohort."
	    if(mercymod == -35)
	        GS.msg[0]= "* Snowdrake pretends not to&  care."
	    if(mercymod < -10) GS.msg[0]= "* Snowdrake is puffed up.."
	    if(GS.monsterhp[myself] < 20)
	        GS.msg[0]= "* Snowdrake is flaking&  apart."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* SNOWDRAKE - ATK 12 DEF 7&* This teen comedian fights to&  keep a captive audience./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        gg= floor(random(6))
	        if(gg <= 2) GS.msg[0]= "* You boo the Snowdrake./^"
	        if(gg == 3 or gg == 4)
	            GS.msg[0]= "* You tell the Snowdrake that&  they aren\'t funny./^"
	        if(gg == 5) {
	            GS.msg[0]= "* You tell the Snowdrake that&  no one will ever love&  them the way they are.../"
	            GS.msg[1]= "* They struggle to make a&  retort^1, and slink away&  utterly crushed.../^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= -10
	        if(gg == 5) mercymod= 222
	    }
	    if(whatiheard == 3) {
	        if(joketold == 0) mercymod= -4
	        else  {
	            mercymod= 80
	            GS.flag[136]= 1
	        }
	        GS.msc= 0
	        if(joketold == 0)
	            GS.msg[0]= "* You laugh at Snowdrake before&  it says anything funny./^"
	        if(joketold == 1)
	            GS.msg[0]= "* You laugh at Snowdrake\'s&  pun./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(scr_monstersum() == 1) GS.msg[0]= "* You make a bad ice pun./^"
	        if(scr_monstersum() > 1) {
	            GS.msg[0]= "* You make a bad ice pun./"
	            GS.msg[1]= "* The other monsters think&  it\'s hilarious.../^"
	            scr_withallmonster(0, 20)
	            whatiheard= 19
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
