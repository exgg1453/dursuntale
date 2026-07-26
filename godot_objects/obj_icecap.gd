# Auto-converted from GameMaker: obj_icecap
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	normalgfx= 202
	hurtgfx= 201
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= 10
	image_speed= 0.1
	cube= 0
	ignore= 0
	ht= 180
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and killed == 0 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 13
	if(cube == 0) scr_monsterdefeat()

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart, 186/* obj_blconsm */)
	mycommand= round(random(100))
	gg= floor(random(3))
	if(mycommand >= 0 and mycommand < 20)
	    GS.msg[0]= "Where\'s&YOUR&hat?"
	if(mycommand >= 20 and mycommand < 40)
	    GS.msg[0]= "Your&head&looks so&...NAKED"
	if(mycommand >= 40 and mycommand < 60)
	    GS.msg[0]= "What a&great&hat!&(Mine)"
	if(mycommand >= 60 and mycommand <= 80)
	    GS.msg[0]= "Snow?&No! It\'s&hat&residue."
	if(mycommand >= 80 and mycommand <= 100)
	    GS.msg[0]= "I just&looove&my hat.&OK?"
	if(whatiheard == 1) {
	    if(ignore > 0) {
	        if(gg == 0) GS.msg[0]= "Fine!!!&I don\'t&care!!!"
	        if(gg == 1) GS.msg[0]= "OK!&I\'ll&ignore&you too."
	        if(gg == 2) GS.msg[0]= "Better&a hatter&than a&HATER."
	        ignore= 2
	        mercymod= 300
	    }
	    if(ignore == 0) {
	        if(gg == 0 or gg == 1)
	            GS.msg[0]= "HELLO???&My hat\'s&up here."
	        if(gg == 2) GS.msg[0]= "What?&What are&you&doing?"
	        ignore= 1
	    }
	}
	if(whatiheard == 3) {
	    if(gg == 0) GS.msg[0]= "DUH!&Who&DOESN\'T&know?"
	    if(gg == 1) GS.msg[0]= "Envious?&TOO BAD!"
	    if(gg == 2) GS.msg[0]= "My hat\'s&too loud&for me to&hear you."
	}
	if(whatiheard == 4) {
	    if(gg == 0) GS.msg[0]= "I KNEW&IT!!!&THIEF!!"
	    if(gg == 1 or gg == 2)
	        GS.msg[0]= "HELP!!!&FASHION&POLICE!!"
	}
	if(whatiheard == 20) {
	    if(gg == 0) GS.msg[0]= "Haha!&That was&ACTUALLY&funny!"
	    if(gg == 1) GS.msg[0]= "Ha!&Imitated&it spot-&on!"
	    if(gg == 2) GS.msg[0]= "That\'s&the best&one in&a while!"
	    mercymod= 200
	}
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
	if(sprite_index != hurtgfx) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 80, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
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
	if(GS.mnfight == 3) attacked= 0
	scr_blconmatch()
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
	    pop= scr_monstersum()
	    if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	        pop--
	    GS.turntimer= 150
	    if(mycommand < 50) {
	        if(pop == 1) GS.turntimer= 100
	        gen= instance_create(0, GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2] - 40) / 2, 650/* obj_iceteeth */)
	    }
	    if(mycommand >= 50) {
	        pop= scr_monstersum()
	        if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	            pop--
	        GS.firingrate= 33
	        if(pop == 2) GS.firingrate= 45
	        if(pop == 3) GS.firingrate= 60
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        gen.bullettype= 11
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0) GS.msg[0]= "* It\'s snowing dandruff."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Ice Cap also wants a hat&  for its nose."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Ice Cap makes sure its hat&  is still there."
	    if(mycommand >= 75)
	        GS.msg[0]= "* Ice Cap is thinking about a&  certain article of clothing."
	    if(mycommand >= 90)
	        GS.msg[0]= "* Here comes that new clothes&  smell."
	    if(ignore == 1)
	        GS.msg[0]= "* Ice Cap is secretly checking&  if you\'re looking at&  its hat."
	    if(ignore > 1)
	        GS.msg[0]= "* Ice Cap is desperate for&  attention."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Ice Cap\'s hat is loose."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* ICE CAP - ATK 11 DEF 4&* This teen wonders why&  it isn\'t named \'Ice Hat.\'/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(ignore > 0) {
	            GS.msg[0]= "* You continue not looking&  at Ice Cap\'s hat./"
	            GS.msg[1]= "* It seems defeated.../^"
	        }
	        if(ignore == 0) {
	            GS.msg[0]= "* You manage to tear your&  eyes away from Ice Cap\'s&  hat./"
	            GS.msg[1]= "* It looks annoyed.../^"
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You inform Ice Cap that&  it has a great hat!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        script_execute(163/* scr_mercystandard */)
	        GS.msg[0]= "* You tried to steal Ice Cap\'s&  hat.../"
	        GS.msg[1]= "* ... but it\'s not weakened&  enough!/^"
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
