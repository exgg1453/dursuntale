# Auto-converted from GameMaker: obj_icecube
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	normalgfx= 203
	hurtgfx= 204
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= 100
	image_speed= 0.1
	happy= 0
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 7
	if(mercymod > 40 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 15
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart + 50, 186/* obj_blconsm */)
	mycommand= round(random(100))
	gg= floor(random(3))
	if(mycommand >= 0 and mycommand < 25)
	    GS.msg[0]= "I...&I..."
	if(mycommand >= 25 and mycommand < 50)
	    GS.msg[0]= "What can&I say..."
	if(mycommand >= 50 and mycommand < 75)
	    GS.msg[0]= "What\'s&the&point..."
	if(mycommand >= 75 and mycommand <= 101)
	    GS.msg[0]= "So...&Cold..."
	if(happy == 1) {
	    if(mycommand >= 0 and mycommand < 25)
	        GS.msg[0]= "Yeah...&I like&my hair&too."
	    if(mycommand >= 25 and mycommand < 50)
	        GS.msg[0]= "Hmm...&Hats are&for&posers."
	    if(mycommand >= 50 and mycommand < 75)
	        GS.msg[0]= "So I can&still&impress&you?"
	    if(mycommand >= 75 and mycommand <= 101)
	        GS.msg[0]= "I wanted&you to&see me&as cool."
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
	    if(scr_monstersum() == 1) GS.turntimer= 5
	    if(mycommand < 96) {
	        gen= instance_create(0, GS.idealborder[2] + (GS.idealborder[3] - GS.idealborder[2] - 40) / 2, 650/* obj_iceteeth */)
	        gen.toothdist= 500
	    }
	    if(mycommand >= 96) {
	        GS.firingrate= 15
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	            GS.firingrate= 25
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	            GS.firingrate= 35
	        gen= instance_create(0, 0, 713/* obj_1sidegen */)
	        gen.bullettype= 11
	    }
	    gen.myself= myself
	    gen.dmg= GS.monsteratk[myself]
	    if(mycommand >= 0) GS.msg[0]= "* \'Ice Cap\' is no more."
	    if(mycommand >= 90)
	        GS.msg[0]= "* It smells like frozen despair."
	    if(happy == 1) GS.msg[0]= "* Ice doesn\'t mind its identity."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* It\'s melting."
	    attacked= 1
	}
	if(whatiheard == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) {
	        killed= 1
	        instance_destroy()
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* ICE - ATK 1 DEF 0&* Without its cap.../^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You inform Ice Cap that&  it still looks fine.../^"
	        GS.flag[137]= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        happy= 1
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
