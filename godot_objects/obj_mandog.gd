# Auto-converted from GameMaker: obj_mandog
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 241
	part2= 243
	mypart1= _spawn("part1", x, y)
	mypart2= _spawn("part2", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -999
	joketold= 0
	smell= 0
	axhp= GS.hp
	ht= sprite_height
	wd= sprite_width

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 30
	if(mercymod > 80 and mercymod < 400) GS.flag[53]= 2
	if(killed == 1) GS.flag[53]= 1
	if(killed == 0) GS.flag[27]= 1
	GS.plot= 50
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x - 123, y + 52, 186/* obj_blconsm */)
	blcon.sprite_index= 20/* spr_blconsm2 */
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "Take my&wife...&\'s fleas."
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "Don\'t&touch my&hot dog."
	if(mycommand >= 50 and mycommand < 75)
	    GS.msg[0]= "No. 2&Nuzzle&Champs&\'98!!"
	if(mycommand >= 75 and mycommand <= 100)
	    GS.msg[0]= "Let\'s&kick&human&tail!!"
	if(instance_exists(246/* obj_womandog */)) {
	    if(whatiheard == 1 or obj_womandog.whatiheard == 1) {
	        GS.msg[0]= "Hm?&What\'s&that&smell?"
	        if(smell > 0) GS.msg[0]= "What!&Smells&like a&..."
	    }
	    if(whatiheard == 3) {
	        if(smell < 2) GS.msg[0]= "Paws off&you&smelly&human."
	        else  GS.msg[0]= "Wow!!!&Pet by&another&pup!!!"
	    }
	    if(obj_womandog.whatiheard == 3) {
	        if(smell < 2) GS.msg[0]= "Stop!&Don\'t&touch&her!"
	        if(smell >= 2) GS.msg[0]= "What&about&me......&........"
	    }
	}
	if(scr_monstersum() == 1) {
	    GS.monsterdef[myself]= -30
	    mercymod= -1000
	    if(mycommand < 50) GS.msg[0]= "Whine."
	    else  GS.msg[0]= "Whimper."
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
	GS.border= 9

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    dmgwriter= instance_create(x, y + 10, 189/* obj_dmgwriter */)
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
	    $Alarm5.start((120) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and alarm[5] < 119 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
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
	    GS.turntimer= 172
	    GS.firingrate= 15
	    if(mycommand <= 50 and scr_monstersum() > 1) {
	        gen= instance_create(0, 0, 656/* blt_whiteax */)
	        gen.dmg= GS.monsteratk[myself]
	        gen= instance_create(0, 0, 656/* blt_whiteax */)
	        gen.dmg= GS.monsteratk[myself]
	        GS.border= 8
	    } else  {
	        GS.turntimer= 200
	        gen= instance_create(0, 0, 687/* obj_loopdog */)
	        GS.border= 9
	    }
	    gen.myself= myself
	    if(mycommand >= 0) GS.msg[0]= "* Dogamy is brokenhearted."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* DOGAMY - ATK 14 DEF 5&* Husband of Dogaressa.&* Knows only what he smells./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(smell == 0) {
	            GS.msg[0]= "* The Dogs sniff you again.../"
	            GS.msg[1]= "* But you smell just as&  weird as before!/^"
	        }
	        if(smell == 1) {
	            GS.msg[0]= "* The Dogs sniff you again.../"
	            GS.msg[1]= "* After rolling in the dirt^1,&  you smell all right!/^"
	        }
	        if(smell >= 2)
	            GS.msg[0]= "* The Dogs already know you&  smell fine./^"
	        if(scr_monstersum() == 1)
	            GS.msg[0]= "* Dogamy won\'t even lift&  up his snout./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        if(smell == 1) obj_dogeparent.smell= 2
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        if(scr_monstersum() == 1)
	            GS.msg[0]= "* Dogamy just growls at&  you./^"
	        else  {
	            if(smell < 2)
	                GS.msg[0]= "* The Dogs are too suspicious&  of your smell./^"
	            if(smell == 2 or smell == 3) {
	                GS.msg[0]= "* You pet Dogamy./^"
	                smell= 3
	            }
	            if(smell == 3 and obj_womandog.smell == 3) {
	                obj_dogeparent.mercymod= 999
	                GS.flag[140]= 1
	            }
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You roll around in the&  dirt and snow./"
	        GS.msg[1]= "* You smell like a weird&  puppy./^"
	        if(smell == 0) obj_dogeparent.smell= 1
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
