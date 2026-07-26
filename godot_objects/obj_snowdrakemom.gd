# Auto-converted from GameMaker: obj_snowdrakemom
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	// obj_battlebg
	with(185) instance_destroy()
	scr_monstersetup()
	image_speed= 0
	part1= 551
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 42
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -900
	sha= 0
	shb= 0
	pitch= 0.5
	$Alarm0.start((160) / 30.0)
	siner= 0
	sinepitcher= 1
	xlaugh= 0
	xheckle= 0
	joke= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	GS.flag[10]= 1
	GS.flag[23]++
	GS.monster[myself]= 0
	with(mypart1) ender= 1

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 120, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= " sn...& o...& wy..."
	if(whatiheard == 4) {
	    if(joke == 1) GS.msg[0]= " haha...& i...& remem..&  ber..."
	    if(joke == 2) GS.msg[0]= " haha...& thank...& you..."
	}
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 17
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2
	GS.border= 18

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y + 20, 189/* obj_dmgwriter */)
	    GS.damage= 0
	    with(dmgwriter) dmg= 0
	    dmgwriter.special= 1
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    GS.monsterhp[myself]= GS.monstermaxhp[myself]
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _on_destroy():
	pitch= 0.3 + random(0.4)
	if(caster_is_playing(GS.batmusic))
	    caster_set_pitch(GS.batmusic, pitch)
	$Alarm0.start((4 + random(120)) / 30.0)

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
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
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
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 100
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        gen= instance_create(x, y, 531/* obj_clawfailuregen */)
	        if(mycommand >= 0) GS.msg[0]= "* It\'s so cold."
	        if(mycommand >= 25) GS.msg[0]= "* It\'s so cold."
	        if(mycommand >= 50) GS.msg[0]= "* It\'s so cold."
	        if(mycommand >= 75) GS.msg[0]= "* It\'s so cold."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like salty slush."
	        if(mercymod > 100) GS.msg[0]= "* Seems calmed down."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Monster has low HP."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* AMALGAMATE - ATK -12 DEF -5&* Seems like it\'s losing it/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You laugh^1, and keep laughing^1.&* It\'s SO funny^1, you can\'t stop^1.&* Tears run down your face./"
	        GS.msg[1]= "* ... what^1?&* You didn\'t do that?/^"
	        if(xlaugh == 1) GS.msg[0]= "* But it\'s not funny./^"
	        xlaugh= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* You said something like..^1.&* " + chr(ord('"')) + "You look horrible.^1" + chr(ord('"')) + "&* " + chr(ord('"')) + "Why are you even alive?^1" + chr(ord('"')) + "/"
	        GS.msg[1]= "* ... what^1?&* You didn\'t say that?/^"
	        if(xheckle == 1) GS.msg[0]= "* You call this a performance?/^"
	        xheckle= 1
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        if(joke == 0)
	            GS.msg[0]= "* You told a bad pun about&  snow^1.&* Her expression starts to shift./^"
	        if(joke == 1)
	            GS.msg[0]= "* You told a bad pun about&  snow^1.&* Her expression changes more./^"
	        if(joke == 2) {
	            GS.msg[0]= "* You told a bad pun about&  snow^1.&* She\'s completely calmed down./^"
	            mercymod= 22222
	        }
	        joke++
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
	if(mercymod == 22222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(sinepitcher == 1) {
	    siner++
	    caster_set_pitch(GS.batmusic, pitch + sin(siner / 2) * 0.01)
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
