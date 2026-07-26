# Auto-converted from GameMaker: obj_parsnik
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 598
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 7
	sha= 0
	shb= 0
	ht= 100
	wd= 100
	eat= 0
	ate= 0

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 2
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 100, y + 10, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	if(mycommand >= 0) GS.msg[0]= "Hisssss"
	if(mycommand >= 25) GS.msg[0]= "Hisssss"
	if(mycommand >= 50) GS.msg[0]= "Hisssss"
	if(mycommand >= 75) GS.msg[0]= "Herssss"
	if(ate == 1) GS.msg[0]= "Ate&Your&Green&Snakes"
	if(whatiheard == 3) GS.msg[0]= "Don\'t&Be Rude"
	if(whatiheard == 4) GS.msg[0]= "Eat Your&Green&Tasty&Snakes"
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
	GS.mnfight= 2
	GS.border= 3

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.pause= 1
	    osh= instance_create(0, 0, 1669/* obj_objshake */)
	    osh.obj= mypart1
	    snd_play(51/* snd_damage */)
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

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	if(GS.myfight == 0 and GS.mnfight == 0) eat= 0
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
	        GS.turntimer= 150
	        if(mycommand < 50) {
	            GS.firingrate= 4
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] > 1)
	                GS.firingrate= 7
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	                GS.firingrate= 11
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            if(eat == 1) gen.specgreen= 1
	            gen.bullettype= 6
	        }
	        if(mycommand >= 50) {
	            GS.firingrate= 12
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	                GS.firingrate= 22
	            if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	                GS.firingrate= 30
	            gen= instance_create(0, 0, 713/* obj_1sidegen */)
	            if(eat == 1) gen.specgreen= 1
	            gen.bullettype= 5
	        }
	        gen.myself= myself
	        gen.dmg= GS.monsteratk[myself]
	        if(mycommand >= 0) GS.msg[0]= "* Parsnik has a hissy fit."
	        if(mycommand >= 25)
	            GS.msg[0]= "* Parsnik\'s snakes shift to&  change hairstyles^1.&* Mohawk^1. Ponytail^1. Undercut."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Parsnik completely closes its&  mouth^1.&* It looks short and weird."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Snakes play with a beach ball."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like tasty snakes."
	        if(mercymod > 100) GS.msg[0]= "* Parsnik seems satisfied."
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* The snakes are wilting."
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
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
	        GS.msg[0]= "* PARSNIK - ATK 30 DEF 28&* This cobrafied carrot has&  a headful of tasty snakes./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.myfight= 0
	        GS.mnfight= 1
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        script_execute(163/* scr_mercystandard */)
	        GS.msg[0]= "* You tried to eat Parsnik^1,&  but it wasn\'t weakened&  enough./^"
	        if(mercy < 8) {
	            GS.msg[0]= "* You start eating snakes like&  they\'re spaghetti.&* You recovered 5 HP!/^"
	            instance_create(0, 0, 91/* obj_foodsound */)
	            script_execute(56/* scr_recover */, 5)
	            mypart1.pause= 1
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        eat= 1
	        GS.msc= 0
	        GS.msg[0]= "* Parsnik mishears you and fires&  a series of tasty snakes./^"
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
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
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
