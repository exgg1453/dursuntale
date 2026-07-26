# Auto-converted from GameMaker: obj_vegetoid
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
	mercymod= 7
	image_speed= 0.1
	ht= 108
	wd= 100
	eat= 0
	ate= 0

func _gm_event_1_0():
	if(killed == 0 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 4
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Contains&Vitamin&A"
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "Part Of&A&Complete&Breakfast"
	if(mycommand >= 50 and mycommand <= 75)
	    GS.msg[0]= "Farmed&Locally,&Very&Locally"
	if(mycommand >= 75 and mycommand <= 100)
	    GS.msg[0]= "Fresh&Morning&Taste"
	if(ate == 1) GS.msg[0]= "Ate&Your&Greens"
	if(whatiheard == 3) GS.msg[0]= "Plants&Can\'t&Talk&Dummy"
	if(whatiheard == 4) GS.msg[0]= "Eat&Your&Greens"
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
	if(sprite_index != 192) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 80, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    sprite_index= 192/* spr_vegetoidhurt */
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
	if(GS.myfight == 0 and GS.mnfight == 0) eat= 0
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((75) / 30.0)
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
	        sprite_index= 191/* spr_vegetoid */
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
	    GS.firingrate= 4
	    if(mycommand < 50) {
	        GS.firingrate= 6
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] > 1)
	            GS.firingrate= 10
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate= 16
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        if(eat == 1) gen.specgreen= 1
	        gen.bullettype= 6
	    }
	    if(mycommand >= 50) {
	        GS.firingrate= 18
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	            GS.firingrate= 30
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate= 42
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        if(eat == 1) gen.specgreen= 1
	        gen.bullettype= 5
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0)
	        GS.msg[0]= "* Vegetoid gave a mysterious&  smile."
	    if(mycommand >= 30) GS.msg[0]= "* Vegetoid cackles softly."
	    if(mycommand >= 70)
	        GS.msg[0]= "* Vegetoid\'s here for your&  health."
	    if(mycommand >= 90)
	        GS.msg[0]= "* It smells like steamed&  carrots and peas."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Vegetoid seems kind of&  bruised."
	    attacked= 1
	}
	if(whatiheard == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 8) {
	        killed= 0
	        instance_destroy()
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* VEGETOID - ATK 6 DEF 6&* Serving Size: 1 Monster&* Not monitored by the USDA/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        script_execute(163/* scr_mercystandard */)
	        GS.msg[0]= "* You tried to eat Vegetoid^1,&  but it wasn\'t weakened&  enough./^"
	        if(mercy < 8) {
	            GS.msg[0]= "* You took a bite out of&  Vegetoid^1.&* You recovered 5 HP!/^"
	            instance_create(0, 0, 91/* obj_foodsound */)
	            script_execute(56/* scr_recover */, 5)
	            sprite_index= 192/* spr_vegetoidhurt */
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        eat= 1
	        GS.msc= 0
	        GS.msg[0]= "* You pat your stomach^1.&* Vegetoid offers a healthy&  meal./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) {
	        GS.flag[134]= 1
	        instance_destroy()
	    }
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
