# Auto-converted from GameMaker: obj_dogeB
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	hurtanim= 0
	mercymod= 0
	instance_create(x, y, 223/* obj_dogeBtail */)
	hurtsound= 51
	hurtsprite= 195
	normalsprite= sprite_index
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	image_speed= 0.1

func _gm_event_1_0():
	if(mercymod > 99) GS.goldreward[3]+= 5
	if(killed == 1) GS.flag[53]= 1
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_8():
	snd_play(40/* snd_doghurt1 */)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart + 8, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(GS.turn == 0) mycommand= 10
	if(GS.turn == 1) mycommand= 90
	if(mycommand >= 0 and mycommand < 33)
	    GS.msg[0]= "You\'re&rather&slow."
	if(mycommand >= 33 and mycommand < 66)
	    GS.msg[0]= "Come on,&let\'s go."
	if(mycommand >= 66 and mycommand <= 100)
	    GS.msg[0]= "Hurry&up..."
	if(GS.turn == 3) GS.msg[0]= "Want to&go on&a walk?"
	if(whatiheard == 2 and mercymod == 21)
	    GS.msg[0]= "Pet...&me..."
	if(whatiheard == 2 and mercymod == 20) {
	    GS.msg[0]= "Oh boy!&Oh boy!&Oh boy!&Oh boy!"
	    mercymod= 21
	}
	if(whatiheard == 5 and mercymod == 100) {
	    GS.msg[0]= "Ahhhh,&humans&are&nice."
	    GS.monsterdef[myself]= -30
	}
	if(mercymod == 102) {
	    mercymod= 103
	    GS.msg[0]= "Hey!!&That&was&fun!!"
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
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0])
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
	    GS.turntimer= 110
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
	    if(mycommand >= 0) GS.msg[0]= "* Doge is pacing anxiously."
	    if(mycommand >= 30)
	        GS.msg[0]= "* Doge paws at an imaginary&  door."
	    if(mycommand >= 70)
	        GS.msg[0]= "* Doge is looking at you and&  whining."
	    if(mycommand >= 90)
	        GS.msg[0]= "* Doge is wondering where she&  put her leash."
	    if(mercymod >= 20)
	        GS.msg[0]= "* Doge is now primed for petting."
	    if(mercymod >= 100) GS.msg[0]= "* Doge looks satisfied."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself] / 3)
	        GS.msg[0]= "* Doge needs a vet."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* DOGE - ATK 7 DEF 5&* Pronounced " + chr(ord('"')) + "dohj." + chr(ord('"')) + " Soft j^1.&* Seems like she wants a walk./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You tried to bathe Doge^2,&  but she\'s perfectly clean.../^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 2) {
	        if(mercymod <= 10) {
	            GS.msc= 0
	            GS.msg[0]= "* You go on a short walk with&  the Doge./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            mercymod= 20
	        } else  {
	            GS.msc= 0
	            GS.msg[0]= "* The Doge seems all tuckered&  out./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You called Doge over.&* Doge came close./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        if(mercymod == 0) mercymod= 10
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* Dry a dry doge?&* Your mind boggles at this&  impossibility./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 5) {
	        if(mercymod >= 20) {
	            GS.msc= 0
	            GS.msg[0]= "* You pet the Doge.&* What a good Doge./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	            mercymod= 100
	        } else  {
	            GS.msc= 0
	            GS.msg[0]= "* Doge seems too dangerous&  to pet..^1.&* For now./^"
	            OBJ_WRITER.halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
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
