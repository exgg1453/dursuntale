# Auto-converted from GameMaker: obj_gladdummy
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
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
	ht= 100
	wd= 80
	t= 0

func _gm_event_1_0():
	if(killed == 1) {
	    GS.flag[252]= 1
	    GS.vaporspeed= 0
	    GS.monstersprite= 193
	    ddd= instance_create(x, y, 157/* obj_vaporized */)
	    ddd.scale.x= scale.x
	    ddd.scale.y= scale.y
	    ddd.image_speed= 0
	    ddd.frame= 1
	    GS.kills++
	    GS.monster[myself]= 0
	} else  GS.flag[27]= 1

func _gm_event_2_7():
	action_move("000000010", 4)
	snd_play(48/* snd_slidewhist */)

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width, y, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 100)
	    GS.msg[0]= " Thanks!"
	t++
	if(t == 1) GS.msg[0]= "Thanks!"
	if(t == 2) GS.msg[0]= "Thank&you!"
	if(t == 3) GS.msg[0]= "Great&work!"
	if(t == 4) GS.msg[0]= "Bravo!"
	if(t == 5) GS.msg[0]= "OK!"
	if(t >= 6) GS.msg[0]= "..."
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_3():
	if(frame != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
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
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    attacked= 0
	    $Alarm5.start((80) / 30.0)
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
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        caster_free(-3)
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
	    GS.turntimer= 1
	    GS.firingrate= 1
	    if(mycommand >= 0)
	        GS.msg[0]= "* Dummy looks like it\'s&  going to fall over."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Dummy stands around&  absentmindedly."
	    GS.mnfight= 3
	    if(GS.turn > 6 and outside == 0) {
	        GS.msg[0]= "* Dummy tires of your&  aimless shenanigans."
	        $Alarm7.start((2) / 30.0)
	        GS.mnfight= 2
	        GS.typer= 1
	        GS.msc= 0
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	    }
	    attacked= 1
	}
	if(whatiheard == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.mnfight= 1
	    GS.myfight= 0
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* GLAD DUMMY - ATK 0 DEF 0^1 &* Wipe that smile off your&  face./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    GS.monster[myself]= 0
	}

func _gm_event_7_0():
	if(outside == 0) {
	    OBJ_WRITER.halt= 3
	    GS.monster[myself]= 0
	    if(GS.mnfight == 2) GS.mnfight= 1
	    outside= 1
	    instance_destroy()
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
