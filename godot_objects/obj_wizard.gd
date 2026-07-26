# Auto-converted from GameMaker: obj_wizard
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 368
	mypart1= _spawn("part1", x + 2, y + 46)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 33
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 20
	sha= 0
	shb= 0
	flex= 0
	encourage= 0
	criticize= 0
	hug= 0
	confuse= 0
	clear= 0
	stare1= 0
	stare1a= 0
	stare2= 0
	stare2a= 0
	ht= sprite_height
	wd= sprite_width

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself]) {
	    GS.goldreward[3]+= 60
	    GS.flag[154]= 1
	}
	obj_heart.confuse= 0
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 125, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand < 20) GS.msg[0]= "Abra&cadabra."
	if(mycommand >= 20) GS.msg[0]= "Alakazam&!!"
	if(mycommand >= 40) GS.msg[0]= "Tinkle&tinkle&hoy."
	if(mycommand >= 60) GS.msg[0]= "Hocus&pocus."
	if(mycommand >= 80) GS.msg[0]= "Please&and&thank&you."
	if(mercymod == 300) {
	    mercymod= 299
	    GS.msg[0]= "Ah^1!&A fellow&wizard!"
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 17
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	if(criticize == 0) GS.border= 18

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x, y - 24, 189/* obj_dmgwriter */)
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
	        GS.turntimer= 160
	        GS.firingrate= 7
	        if(pop == 3) GS.firingrate*= 2.4
	        if(pop == 2) GS.firingrate*= 1.7
	        if(stare1a == 1) mycommand= random(50) + 50
	        if(stare2a == 1) mycommand= random(49)
	        if(mycommand < 50) {
	            orb= instance_create(100, 100, 365/* obj_wizardorb_wall */)
	            if(stare2 > 0) {
	                orb.dmg-= stare2 * 2
	                orb.alt= 1
	            }
	        } else  {
	            orb= instance_create(100, 100, 366/* obj_wizardorb_chaser */)
	            if(pop == 2) orb.zap= 1
	            orb.king= 1
	            orb.dirr= random(360)
	            if(stare1 > 0 and pop == 1) {
	                orb.dirr= random(100)
	                nowdirr= orb.dirr
	                orb2= instance_create(100, 100, 366/* obj_wizardorb_chaser */)
	                orb2.dirr= nowdirr + 40 + random(80)
	                orb3= instance_create(100, 100, 366/* obj_wizardorb_chaser */)
	                orb3.dirr= orb2.dirr + 40 + random(70)
	                obj_wizardorb_chaser.dmg-= stare1 * 2
	                obj_wizardorb_chaser.zap= 0
	            }
	        }
	        stare1a= 0
	        stare2a= 0
	        if(confuse > 0 and obj_heart.sprite_index != 35) {
	            obj_heart.confuse= 1
	            obj_heart.sprite_index= 35/* spr_confuseheart */
	            obj_heart.x+= 8
	            obj_heart.y+= 8
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Madjick does a mysterious jig."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Madjick flaunts its orbs&  in a menacing manner."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Madjick whispers arcane&  swear words."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Madjick peers at you with&  strange eyes."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like magic."
	        if(mercymod == 140)
	            GS.msg[0]= "* Madjick is distracted by its&  own voice."
	        if(confuse > 0) GS.msg[0]= "* You still feel confused."
	        if(confuse > 0 and mercymod == 140)
	            GS.msg[0]= "* Madjick is distracted.&* You still feel confused."
	        if(stare1 > 0 and stare2 > 0)
	            GS.msg[0]= "* Madjick\'s orbs are&  incapacitated."
	        if(mercymod > 280)
	            GS.msg[0]= "* Madjick believes you are&  a fellow wizard."
	        attacked= 1
	    }
	    if(criticize > 0 and pop == 1) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MADJICK - ATK 29 DEF 24 &* This magical mercenary only&  says magic words./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(confuse > 0 and clear == 0) {
	            GS.msg[0]= "* You can\'t get a word&  in edgewise^1.&* Its words dizzy you.../^"
	            obj_heart.confuse= 1
	            confuse= 1
	            obj_heart.sprite_index= 35/* spr_confuseheart */
	        }
	        if(confuse == 0 and clear == 0) {
	            GS.msg[0]= "* Madjick interrupts you by&  chattering to it/"
	            GS.msg[1]= "* Its gibberish dizzies you...&* Your DEFENSE drops by 1./^"
	            confuse++
	            obj_heart.confuse= 1
	            obj_heart.sprite_index= 35/* spr_confuseheart */
	            GS.df--
	        }
	        if(clear > 0)
	            GS.msg[0]= "* Magick interrupts you by&  chattering to itself^1.&* It seems satisfied./^"
	        mercymod= 190
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.typer= 1
	        GS.myfight= 3
	        GS.bmenuno= 6
	        GS.msg[0]= "* Where to stare?             &                            &   Chaser Orb      Corner Orb\\C"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        clear= 1
	        if(confuse == 0) {
	            GS.msg[0]= "* You ignore Madjick and think&  of pollen and sunshine^1.&* Your DEFENSE increased by 1./^"
	            GS.df+= 5
	        }
	        if(confuse > 0) {
	            GS.msg[0]= "* You think of pollen and&  sunshine./"
	            GS.msg[1]= "* Your confusion abates^1.&* Your DEFENSE increased by 2./^"
	            GS.df+= 10
	            obj_heart.confuse= 0
	            confuse= 0
	        }
	        // OBJ_WRITER
	        with(782) halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 6) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        stare1++
	        stare1a= 1
	        GS.msc= 0
	        GS.typer= 1
	        GS.msg[0]= "* The unrelenting " + chr(ord('"')) + "Chaser Orb" + chr(ord('"')) + "&  was weakened by your glare./^"
	        if(stare1 > 1)
	            GS.msg[0]= "* The destitute " + chr(ord('"')) + "Chaser Orb" + chr(ord('"')) + " was&  weakened further by your glare./^"
	        if(mercymod < 200) mercymod+= 100
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    }
	    if(whatiheard == 7) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        stare2++
	        stare2a= 1
	        GS.msc= 0
	        GS.typer= 1
	        GS.msg[0]= "* The intimidating " + chr(ord('"')) + "Corner Orb" + chr(ord('"')) + "&  was weakened by your glare./^"
	        if(stare2 > 1)
	            GS.msg[0]= "* The homely " + chr(ord('"')) + "Corner Orb" + chr(ord('"')) + " was&  weakened further by your glare./^"
	        if(mercymod < 200) mercymod+= 100
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.mnfight == 0 and GS.myfight == 0) {
	    obj_heart.sprite_index= 34/* spr_heart */
	    obj_heart.rotation_degrees= 0
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
