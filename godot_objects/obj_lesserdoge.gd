# Auto-converted from GameMaker: obj_lesserdoge
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	mercymod= 0
	instance_create(x, y, 221/* obj_lesserdogetail */)
	instance_create(x, y, 222/* obj_lesserdogehead */)
	hurtsound= 51
	hurtsprite= 200
	normalsprite= sprite_index
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	image_speed= 0.1
	ht= 200
	wd= 100

func _gm_event_1_0():
	if(mercymod > 99) GS.goldreward[3]+= 7
	if(mercymod >= 150) GS.flag[55]= 2
	if(mercymod > 500) GS.goldreward[3]+= 13
	if(mercymod > 2600) GS.goldreward[3]+= 40
	if(killed == 1) GS.flag[55]= 1
	if(killed == 0) GS.flag[27]= 1
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_8():
	snd_play(40/* snd_doghurt1 */)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart + 8, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(GS.turn == 0) mycommand= 10
	if(GS.turn == 1) mycommand= 90
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "(Pant&pant)"
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "(Wag&wag)"
	if(mycommand >= 50 and mycommand <= 75)
	    GS.msg[0]= "(Thinks&of&food)"
	if(mycommand >= 75 and mycommand <= 100)
	    GS.msg[0]= "(Tiny&bark)"
	if(mercymod == 102) {
	    mercymod= 103
	    GS.msg[0]= "(Pants&fast)"
	}
	if(mercymod > 10) GS.monsterdef[myself]= -100
	if(mercymod > 90) GS.msg[0]= "(Pant!&Pant!)"
	if(mercymod > 190) GS.msg[0]= "(Excited&noises)"
	if(mercymod > 340) GS.msg[0]= "(Motor&revving)"
	if(mercymod > 390) GS.msg[0]= "(Plane&takeoff)"
	if(mercymod > 440) GS.msg[0]= "(Kettle&whistle)"
	if(mercymod > 490) GS.msg[0]= "(...)"
	if(mercymod > 540) GS.msg[0]= "(Faraway&bark)"
	if(mercymod > 590) GS.msg[0]= "(...)"
	if(mercymod > 640) GS.msg[0]= "(Bark)"
	if(mercymod > 690) GS.msg[0]= "(Pant&pant)"
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

func _gm_event_2_3():
	if(sprite_index != hurtsprite) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    sprite_index= hurtsprite
	    snd_play(hurtsound)
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
	if(GS.mnfight == 3) attacked= 0
	scr_blconmatch()
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((70) / 30.0)
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
	        sprite_index= normalsprite
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
	    if(mercymod > 250 and GS.turntimer < 10) GS.turntimer= 0
	    else  GS.turntimer= 110
	    GS.firingrate= 4
	    if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	        mycommand= 2
	    if(mycommand < 50) {
	        GS.firingrate= 13
	        gen= instance_create(GS.idealborder[1] - 50, GS.idealborder[3] - 45, 648/* blt_tinypom_leap */)
	        gen.dmg= GS.monsteratk[myself]
	        GS.border= 8
	        gen.bullettype= 0
	    }
	    if(mycommand >= 50) {
	        GS.firingrate= 13
	        gen= instance_create(GS.idealborder[1] - 50, GS.idealborder[3] - 45, 653/* blt_bluespear */)
	        gen.dmg= GS.monsteratk[myself]
	        GS.border= 8
	        gen.bullettype= 0
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0)
	        GS.msg[0]= "* Lesser Dog cocks its head&  to one side."
	    if(mycommand >= 30)
	        GS.msg[0]= "* Lesser Dog thinks your&  weapon is a dog treat."
	    if(mycommand >= 60)
	        GS.msg[0]= "* Lesser Dog is really not&  paying attention."
	    if(mycommand >= 85) GS.msg[0]= "* Smells like dog chow."
	    if(mercymod >= 40)
	        GS.msg[0]= "* Lesser Dog is barking&  excitedly."
	    if(mercymod >= 200)
	        GS.msg[0]= "* Lesser Dog is overstimulated."
	    if(mercymod >= 400)
	        GS.msg[0]= "* Lesser Dog shows no signs&  of stopping."
	    if(mercymod >= 700) GS.msg[0]= "* Lesser Dog is lowering."
	    if(mercymod >= 1640)
	        GS.msg[0]= "* Lesser Dog is learning&  to read."
	    if(mercymod >= 1740)
	        GS.msg[0]= "* Lesser Dog is whining&  because it can\'t see&  you."
	    if(mercymod >= 2190) GS.msg[0]= "* Hello there."
	    if(mercymod >= 2340)
	        GS.msg[0]= "* Lesser Dog is questioning&  your choices."
	    if(mercymod >= 2640)
	        GS.msg[0]= "* Lesser Dog has gone where&  no Dog has gone before."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Lesser Dog tucks its tail&  between its legs."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1) {
	    if(GS.heard == 0) {
	        if(whatiheard == 0) {
	            GS.msc= 0
	            GS.msg[0]= "* LESSER DOG - ATK 12 DEF 2&* Wields a stone dogger made&  of pomer-granite./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	        if(whatiheard == 1 or whatiheard == 2 or whatiheard == 3 or whatiheard == 4 or whatiheard == 5) {
	            GS.msc= 0
	            if(mercymod == 0)
	                GS.msg[0]= "* You barely lifted your&  hand and Lesser Dog&  got excited./^"
	            if(mercymod > 40)
	                GS.msg[0]= "* You lightly touched the&  Dog^1.&* It\'s already overexcited.../^"
	            if(mercymod > 90)
	                GS.msg[0]= "* You pet the Dog.&* It raises its head up&  to meet your hand./^"
	            if(mercymod > 140)
	                GS.msg[0]= "* You pet the Dog.&* It was a good Dog./^"
	            if(mercymod > 190)
	                GS.msg[0]= "* You pet the Dog.&* Its excitement knows no&  bounds./^"
	            if(mercymod > 240)
	                GS.msg[0]= "* Critical pet!&* Dog excitement increased./^"
	            if(mercymod > 290)
	                GS.msg[0]= "* You have to jump up&  to pet the Dog./^"
	            if(mercymod > 340)
	                GS.msg[0]= "* You don\'t even pet it^1.&* It gets more excited./^"
	            if(mercymod > 390)
	                GS.msg[0]= "* There is no way to&  stop this madness./^"
	            if(mercymod > 440)
	                GS.msg[0]= "* Lesser Dog enters the&  realm of the clouds./^"
	            if(mercymod > 490)
	                GS.msg[0]= "* You call the Dog but it&  is too late^1.&* It cannot hear you./^"
	            if(mercymod > 540) GS.msg[0]= "* .../^"
	            if(mercymod > 590)
	                GS.msg[0]= "* You can reach Lesser Dog&  again./^"
	            if(mercymod > 640) GS.msg[0]= "* You pet Lesser Dog./^"
	            if(mercymod > 900)
	                GS.msg[0]= "* It\'s possible that you&  may have a problem./^"
	            if(mercymod > 1640)
	                GS.msg[0]= "* Lesser Dog is unpettable&  but appreciates the attempt./^"
	            if(mercymod > 2190)
	                GS.msg[0]= "* Perhaps mankind was not&  meant to pet this much./^"
	            if(mercymod > 2240) GS.msg[0]= "* It continues./^"
	            if(mercymod >= 2640)
	                GS.msg[0]= "* Lesser Dog is beyond&  your reach./^"
	            if(mercymod >= 2690) GS.msg[0]= "* Really.../^"
	            if(mercymod > 100) GS.flag[141]= 1
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            mercymod+= 50
	        }
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}

func _gm_event_7_5():
	if(killed == 0) GS.flag[27]= 1

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

func _gm_event_9_74():
	if(GS.debug == 1) mercymod+= 25

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
