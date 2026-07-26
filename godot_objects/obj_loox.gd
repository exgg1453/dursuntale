# Auto-converted from GameMaker: obj_loox
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
	mercymod= 4
	image_speed= 0
	$Alarm7.start((30) / 30.0)
	ht= 120
	wd= 100

func _gm_event_1_0():
	if(mercymod > 99) GS.goldreward[3]+= 5
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_7():
	frame= 0
	image_speed= 0.5
	if(mercymod < 0) image_speed= 1
	$Alarm7.start((30) / 30.0)
	if(mercymod < 0) $Alarm7.start((20) / 30.0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart + 8, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 20)
	    GS.msg[0]= "I\'ve got&my eye&on you."
	if(mycommand >= 20 and mycommand < 40)
	    GS.msg[0]= "Don\'t&point&that&at me."
	if(mycommand >= 40 and mycommand < 60)
	    GS.msg[0]= "Quit&staring&at me."
	if(mycommand >= 60 and mycommand <= 80)
	    GS.msg[0]= "What an&eyesore."
	if(mycommand >= 80 and mycommand <= 100)
	    GS.msg[0]= "How&about a&staring&contest?"
	if(GS.turn == 0) GS.msg[0]= "Please&don\'t&pick on&me."
	if(whatiheard == 1) GS.msg[0]= "Finally&someone&gets it."
	if(whatiheard == 3) GS.msg[0]= "You rude&little&snipe!"
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
	if(sprite_index != 190) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    sprite_index= 190/* spr_looxhurt */
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
	        sprite_index= 189/* spr_loox */
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
	    if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	        mycommand= 2
	    if(mycommand < 50) {
	        GS.firingrate= 13
	        if(mercymod < 0) GS.firingrate-= 6
	        if(mercymod > 6) GS.firingrate+= 5
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] > 1)
	            GS.firingrate*= 1.5
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate*= 2
	        gen= instance_create(0, 0, 715/* obj_hoopgen1 */)
	        gen.bullettype= 0
	    }
	    if(mycommand >= 50) {
	        GS.firingrate= 15
	        if(mercymod < 0) GS.firingrate-= 6
	        if(mercymod > 6) GS.firingrate+= 5
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	            GS.firingrate*= 1.5
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate*= 2
	        gen= instance_create(0, 0, 715/* obj_hoopgen1 */)
	        gen.bullettype= 1
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0) GS.msg[0]= "* Loox is gazing at you."
	    if(mycommand >= 30)
	        GS.msg[0]= "* Loox is staring right&  through you."
	    if(mycommand >= 70) GS.msg[0]= "* Loox gnashes its teeth."
	    if(mycommand >= 90) GS.msg[0]= "* Smells like eyedrops."
	    if(mercymod < -100) GS.msg[0]= "* Loox has gone bloodshot."
	    if(mercymod > 100)
	        GS.msg[0]= "* Loox doesn\'t care about&  fighting anymore."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Loox is watering."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* LOOX - ATK 6 DEF 6&* Don\'t pick on him.&* Family name: Eyewalker/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        if(mercymod < 100 and GS.xpreward[myself] < 20)
	            GS.xpreward[myself]+= 5
	        mercymod= -100
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    if(whatiheard == 1) {
	        GS.flag[133]= 1
	        if(GS.xpreward[myself] > 4)
	            GS.xpreward[myself]-= 2
	        mercymod= 100
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}

func _gm_event_7_7():
	frame= 0
	image_speed= 0

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
