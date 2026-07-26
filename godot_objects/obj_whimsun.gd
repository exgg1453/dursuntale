# Auto-converted from GameMaker: obj_whimsun
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0.1
	hurtanim= 0
	hurtsound= 51
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	outside= 0
	mercymod= 99
	path_start(42/* path_whimsun */, 0.5, 1, 0/* path_action_stop */)
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod == 101) GS.goldreward[3]+= 2
	scr_monsterdefeat(0, 0, 0, 0, 0)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width - 8, ystart, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "I\'m&sorry..."
	if(mycommand >= 30 and mycommand < 50)
	    GS.msg[0]= "I have&no&choice.."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "Forgive&me..."
	if(mycommand >= 80 and mycommand <= 100)
	    GS.msg[0]= "*sniff&sniff*"
	if(whatiheard == 1 or whatiheard == 3)
	    GS.msg[0]= "I&can\'t&handle&this..."
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
	if(sprite_index != 181) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 80, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    sprite_index= 181/* spr_whimsunhurt */
	    snd_play(hurtsound)
	    x= xstart
	    y= ystart
	    path_end()
	    gravity= 0
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
	    $Alarm5.start((60) / 30.0)
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
	        sprite_index= 180/* spr_whimsun */
	        path_start(42/* path_whimsun */, 0.5, 1, 0/* path_action_stop */)
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
	    GS.turntimer= 100
	    if(mycommand >= 0 and mycommand <= 50) script_execute(123/* scr_rotategen */, 10, 20, 624, obj_heart.x, obj_heart.y + 42)
	    else  gen= instance_create(0, 0, 702/* obj_butterfly2gen */)
	    gen.myself= myself
	    if(mycommand >= 0) GS.msg[0]= "* Whimsun avoids eye contact."
	    if(mycommand >= 30)
	        GS.msg[0]= "* Whimsun continues to mutter&  apologies."
	    if(mycommand >= 70) GS.msg[0]= "* Whimsun is fluttering."
	    if(mycommand >= 90)
	        GS.msg[0]= "* It\'s starting to smell like&  lavender and mothballs."
	    if(mercymod > 100) GS.msg[0]= "* Whimsun is hyperventilating."
	    if(GS.monsterhp[myself] < GS.monstermaxhp[myself])
	        GS.msg[0]= "* Whimsun is having trouble&  flying."
	    attacked= 1
	}
	if(whatiheard == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* WHIMSUN - ATK 5 DEF 0&* This monster is too&  sensitive to fight.../^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.flag[131]= 1
	        GS.msc= 0
	        GS.msg[0]= "* Halfway through your first&  word^1, Whimsun bursts into&  tears and runs away./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You raise your arms and&  wiggle your fingers.&* Whimsun freaks out!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 101
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
