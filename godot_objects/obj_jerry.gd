# Auto-converted from GameMaker: obj_jerry
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	normalgfx= 210
	hurtgfx= 211
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= 65
	image_speed= 0.1
	ditch= 0
	thisturn= 0
	thisturn2= 0
	mycommand= 0
	ht= 110
	wd= 200

func _gm_event_1_0():
	scr_monsterdefeat()

func _gm_event_2_10():
	if(GS.turntimer > 1) GS.turntimer+= 60

func _gm_event_2_6():
	if(ditch == 0) {
	    blcon= instance_create(x - 8, ystart - 100, 186/* obj_blconsm */)
	    blcon.sprite_index= 24/* spr_blconabove */
	    mycommand= round(random(100))
	    gg= floor(random(3))
	    if(mycommand >= 0 and mycommand < 20)
	        GS.msg[0]= "Guys, it\'s COLD.&Does ANYONE care?"
	    if(mycommand >= 20 and mycommand < 40)
	        GS.msg[0]= "Why are we doing&this? What a fail."
	    if(mycommand >= 40 and mycommand < 60)
	        GS.msg[0]= "Wow, you guys&SUCK at this."
	    if(mycommand >= 60 and mycommand <= 80)
	        GS.msg[0]= "SHHHH! I\'m&THINKING, guys!!"
	    if(mycommand >= 80 and mycommand <= 100)
	        GS.msg[0]= "Ka-SIGH."
	    if(scr_monstersum() == 1) {
	        if(mycommand > 0)
	            GS.msg[0]= "Well... can YOU&give me a ride&home?"
	        if(mycommand > 20)
	            GS.msg[0]= "Huh? Did they&ditch me...? SOME&friends!"
	        if(mycommand > 40) GS.msg[0]= "Awkwarrrd."
	        if(mycommand > 60)
	            GS.msg[0]= "So, like, what&are you even&doing?"
	        if(mycommand > 80) GS.msg[0]= "The wi-fi here&sucks."
	    }
	    if(whatiheard == 1) {
	        if(gg == 0) GS.msg[0]= "Better&a hatter&than a&HATER."
	        if(gg == 1) GS.msg[0]= "Insults&won\'t&fix your&outfit!"
	        if(gg == 2) GS.msg[0]= "What?&My hat\'s&too loud&sorry."
	    }
	    if(whatiheard == 3) {
	        if(gg == 0) GS.msg[0]= "DUH!&Who&DOESN\'T&know?"
	        if(gg == 1) GS.msg[0]= "Envious?&TOO BAD!"
	        if(gg == 2) GS.msg[0]= "Get your&own,&twerp."
	    }
	    if(whatiheard == 4) {
	        if(gg == 0) GS.msg[0]= "I KNEW&IT!!!&THIEF!!"
	        if(gg == 1 or gg == 2)
	            GS.msg[0]= "HELP!!!&FASHION&POLICE!!"
	    }
	    if(whatiheard == 20) {
	        if(gg == 0) GS.msg[0]= "Hahaha!&Say something&else funny!"
	        if(gg == 1) GS.msg[0]= "Haha! Wow!&Drake, you suck!"
	        if(gg == 2) GS.msg[0]= "Hahaha!&Where do you get&your ideas!?!"
	        mercymod= 200
	    }
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    GS.border= 3
	    obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	    obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	}

func _gm_event_2_5():
	if(ditch == 0) {
	    with(blconwd) instance_destroy()
	    with(blcon) instance_destroy()
	    talked= 0
	    whatiheard= -1
	    GS.mnfight= 2
	}

func _gm_event_2_3():
	if(sprite_index != hurtgfx) {
	    dmgwriter= instance_create(x + 10, y + 80, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= ceil(GS.damage / 5)
	    sprite_index= hurtgfx
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
	if(ditch == 1 and GS.mnfight > 0) {
	    talked= 0
	    if(modulate.a > 0.05) modulate.a-= 0.05
	    thisturn2= GS.turn - thisturn
	    if(thisturn2 >= 2 and scr_monstersum() > 0) ditch= 0
	    GS.monster[myself]= 0
	}
	if(ditch == 0) {
	    GS.monster[myself]= 1
	    if(modulate.a < 1) modulate.a+= 0.05
	}
	if(GS.mnfight == 3) attacked= 0
	scr_blconmatch()
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((100) / 30.0)
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
	    GS.monsterhp[myself]-= ceil(takedamage / 5)
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        sprite_index= normalgfx
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
	    if(ditch == 0) {
	        if(scr_monstersum() > 1) {
	            if(GS.turntimer < 1) GS.turntimer= 1
	            $Alarm10.start((10) / 30.0)
	        } else  GS.mnfight= 3
	    }
	    if(mycommand < 50) {
	    }
	    if(mycommand >= 50) {
	    }
	    if(ditch == 0) {
	        if(mycommand >= 0)
	            GS.msg[0]= "* Jerry eats powdery food and&  licks its hands loudly."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Jerry sneezes without covering&  its nose."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Jerry tells everyone it has to&  go to the bathroom."
	        if(mycommand >= 75) GS.msg[0]= "* Jerry lets out a yawn."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like....... Jerry."
	        if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	            GS.msg[0]= "* Jerry is wounded."
	    }
	    if(ditch == 1 and thisturn2 == 0)
	        GS.msg[0]= "* The other monsters celebrate&  Jerry\'s disappearance."
	    if(ditch == 0 and thisturn2 == 2)
	        GS.msg[0]= "* Return of Jerry."
	    attacked= 1
	}
	if(whatiheard == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) {
	        killed= 0
	        instance_destroy()
	    }
	}
	if(GS.myfight == 2 and ditch == 0 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* JERRY - ATK 0 DEF 30&* Everyone knows Jerry.&* Makes attacks 2 seconds longer./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You and the other&  monsters ditch Jerry&  when it looks away!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        ditch= 1
	        thisturn= GS.turn
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        script_execute(163/* scr_mercystandard */)
	        GS.msg[0]= "* You tried to steal Ice Cap\'s&  hat.../"
	        GS.msg[1]= "* ... but failed!/^"
	        if(mercy < 0) {
	            GS.msg[1]= "* And succeeded!&* (It melts in your hands...)/^"
	            m= 0
	            GS.monster[myself]= 0
	            if(GS.monster[1] == 1 and GS.monster[0] == 0) m= 1
	            GS.monster[1]= 0
	            GS.monstertype[myself]= 20
	            cube= 1
	            GS.monsterinstance[myself]= instance_create(x, y, 218/* obj_icecube */)
	            if(m == 1) GS.monster[1]= 1
	            instance_destroy()
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and ditch == 0 and GS.mercyuse == 0) {
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
