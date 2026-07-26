# Auto-converted from GameMaker: obj_whimsalot
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 396
	mypart1= _spawn("part1", x + 21, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 10
	sha= 0
	shb= 0
	greentime= 0
	impress= 0
	ht= sprite_height
	wd= sprite_width

func _gm_event_1_0():
	if(GS.flag[6] == 0 and mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 50
	    GS.flag[152]= 1
	}
	if(GS.flag[6] == 1 and mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 3
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 100, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "No&regrets."
	if(mycommand >= 30 and mycommand < 50)
	    GS.msg[0]= "I\'ve&made my&choice."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "Not this&time."
	if(mycommand >= 80 and mycommand <= 100)
	    GS.msg[0]= "*Shine&shine*"
	if(whatiheard == 1) GS.msg[0]= "I\'m not&afraid&of you."
	if(whatiheard == 3) GS.msg[0]= "I\'ve&made&my&peace."
	if(whatiheard == 4) {
	    if(mycommand < 50) GS.msg[0]= "Don\'t&give&up!"
	    else  GS.msg[0]= "There\'s&still&hope."
	}
	if(impress == 1) GS.msg[0]= "Courage&..."
	impress= 0
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
	GS.mnfight= 2
	GS.border= 3

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
	    GS.monsterhp[myself]-= takedamage
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
	        GS.firingrate= 22
	        if(pop == 3) GS.firingrate*= 2.7
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 50 or pop == 1) {
	            if(greentime == 0) {
	                gen= instance_create(x, y, 397/* obj_butterflybullet_gen_2 */)
	                gen.dmg= GS.monsteratk[myself]
	            }
	            if(greentime == 1) {
	                gen= instance_create(x, y, 398/* obj_butterflybullet_gen */)
	                gen.dmg= GS.monsteratk[myself]
	                gen.green= 1
	            }
	        } else  {
	            gen= instance_create(x, y, 398/* obj_butterflybullet_gen */)
	            gen.dmg= GS.monsteratk[myself]
	            if(greentime == 1) gen.green= 1
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Whimsalot locks eyes with you."
	        if(mycommand >= 25) GS.msg[0]= "* Whimsalot flutters silently."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Whimsalot shakes its head&  dismissively."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Whimsalot spins its weapon&  around."
	        if(mycommand >= 90)
	            GS.msg[0]= "* Smells like nightshade and&  bleach."
	        if(mercymod > 80)
	            GS.msg[0]= "* Whimsalot doesn\'t want to&  fight anymore."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Whimsalot\'s flying stutters."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    greentime= 0
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* WHIMSALOT - ATK 34 DEF 12&* It finally stopped worrying./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You reassure Whimsalot that&  what it\'s doing is&  alright./^"
	        mercymod+= 30
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You leap at Whimsalot in a&  threatening manner./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You kneel and pray for safety^1.&* Whimsalot remembers its&  conscience./^"
	        mercymod+= 50
	        greentime= 1
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
