# Auto-converted from GameMaker: obj_mkid_battle
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup()
	image_speed= 0
	part1= 283
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
	mercymod= 10
	sha= 0
	shb= 0
	ht= 100
	wd= 100
	mercymod= 999999
	con= 0
	GS.flag[20]= 0
	// obj_battlebg
	with(185) instance_destroy()

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 40
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	blcon= instance_create(x + 100, y, 186/* obj_blconsm */)
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "..."
	if(mycommand < 75) GS.msg[0]= "..."
	if(mycommand < 50) GS.msg[0]= "..."
	if(mycommand < 25) GS.msg[0]= "..."
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(con == 19) {
	    con= 20
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= 1
	    with(dmgwriter) dmg= 20000 + round(random(5965))
	    mypart1.pause= 1
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
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0])
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    GS.faceemotion= 6
	    caster_stop(GS.batmusic)
	    con= 15
	    GS.hurtanim[myself]= 99
	}
	if(GS.hurtanim[myself] == 2 and con == 20) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    con= 20.1
	    GS.myfight= 0
	    GS.mnfight= 99
	}
	if(GS.hurtanim[myself] == 5) {
	    if(GS.damage > 0) GS.damage= 20000 + round(random(2964))
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 20000 + round(random(2964))
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
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 50) {
	            gen= instance_create(x, y, 334/* obj_lavafiregen */)
	            gen.dmg= GS.monsteratk[myself]
	        } else 
	            gen= instance_create((GS.idealborder[0] + GS.idealborder[1]) / 2 - 30, GS.idealborder[2] + 2, 331/* obj_vulkincloudbul */)
	        attacked= 1
	    }
	    GS.msg[0]= "* Monster Kid quivers anxiously."
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MONSTER KID 2 ATK 2 DEF&* Looks like free EXP./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    GS.heard= 1
	}
	if(con == 15) {
	    GS.flag[20]= 1
	    wht= scr_marker(-2, -2, 999)
	    wht.image_speed= 0
	    wht.scale.x= 400
	    wht.scale.y= 400
	    wht.modulate.a= 0
	    wht.z_index= -9000
	    con= 16
	}
	if(con == 16) {
	    wht.modulate.a+= 0.02
	    if(GS.tempvalue[13] == 1)
	        wht.modulate.a+= 0.02
	    if(wht.modulate.a >= 1) {
	        con= 17
	        $Alarm4.start((45) / 30.0)
	        if(GS.tempvalue[13] == 1) $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 18) {
	    GS.faceemotion= 0
	    undyne= instance_create(210, 20, 283/* obj_mkid_b_body */)
	    undyne.sprite_index= 291/* spr_undyneb_fatal */
	    undyne.frame= 0
	    undyne.type= 1
	    shk= instance_create(0, 0, 1669/* obj_objshake */)
	    shk.obj= undyne
	    mypart1.x= 70
	    with(wht) instance_destroy()
	    con= 19
	    shudder= 8
	    $Alarm3.start((1) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(con == 20.1) {
	    con= 20.2
	    $Alarm4.start((80) / 30.0)
	    if(GS.tempvalue[13] == 1) $Alarm4.start((30) / 30.0)
	}
	if(con == 21.2) {
	    GS.msc= 0
	    GS.typer= 33
	    skiptext= 0
	    GS.faceemotion= 0
	    GS.flag[20]= 2
	    GS.msg[0]= "Undyne..^1.&You\'re..^1.&You\'re hurt.../%%"
	    scr_blcon_x(mypart1.x - 65, mypart1.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    blcon.z_index= -2000
	    OBJ_WRITER.z_index= -3000
	    con= 23
	}
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 1
	    GS.typer= 39
	    GS.msg[0]= "Hurt?&It\'s nothing./"
	    GS.msg[1]= "Next time^1, listen&when I tell you&to leave^1, okay?/%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 24
	}
	if(con == 24 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 33
	    GS.msg[0]= "Undyne..^1.&I.../%%"
	    scr_blcon_x(mypart1.x - 65, mypart1.y - 110)
	    obj_blconwideslave.sprite_index= 24/* spr_blconabove */
	    con= 25
	}
	if(con == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 2
	    GS.typer= 39
	    GS.msg[0]= "I\'ll take care of&this!/"
	    GS.msg[1]= "Get out of here!/%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 26
	}
	if(con == 26 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 3
	    con= 27
	    $Alarm4.start((30) / 30.0)
	    if(GS.tempvalue[13] == 1) {
	        mypart1.velocity.x= -12
	        con= 199
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 28) {
	    mypart1.velocity.x= -2
	    con= 29
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 30) {
	    con= 31
	    mypart1.velocity.x= 0
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 32) {
	    mypart1.velocity.x= -8
	    con= 33
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 34) {
	    siner= instance_create(undyne.x, undyne.y, 285/* obj_generalsiner */)
	    siner.idealww= 4
	    GS.faceemotion= 3
	    GS.typer= 40
	    GS.msg[0]= "... heh...&" + chr(ord('"')) + "It\'s nothing" + chr(ord('"')) + ".../"
	    GS.msg[1]= "No..^1. s-somehow^1,&with just one&hit.../"
	    GS.msg[2]= "I\'m already.../"
	    GS.msg[3]= "Already.../"
	    GS.msg[4]= "D..^1. damn it..../%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 35
	}
	if(con == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) siner.idealww= 6
	    if(OBJ_WRITER.stringno == 2) siner.idealww= 8
	    if(OBJ_WRITER.stringno == 3) siner.idealww= 10
	    if(OBJ_WRITER.stringno == 4) siner.idealww= 12
	}
	if(con == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.faceemotion= 4
	    GS.typer= 42
	    GS.msg[0]= "Papyrus..^1.&Alphys..^1.&ASGORE.../"
	    GS.msg[1]= "Just like that^1,&I.../"
	    GS.msg[2]= "I\'ve failed you./%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 36
	}
	if(con == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 1) siner.idealww= 15
	    if(OBJ_WRITER.stringno == 2) siner.idealww= 20
	    if(OBJ_WRITER.stringno == 3) siner.idealww= 25
	}
	if(con == 36 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(siner.idealww != 45) snd_play(91/* snd_vaporized */)
	    siner.idealww= 45
	    if(siner.ww >= 45) {
	        con= 37
	        $Alarm4.start((60) / 30.0)
	    }
	}
	if(con == 38) {
	    vol= 0
	    GS.faceemotion= 5
	    siner.idealww= 8
	    GS.typer= 41
	    GS.msg[0]= ".../"
	    GS.msg[1]= "No.../%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 39
	}
	if(con == 39 and not instance_exists(782/* OBJ_WRITER */)) {
	    vol= 0
	    truthmusic= caster_load("music/x_undyne_pre.ogg")
	    caster_loop(truthmusic, vol, 0.9)
	    GS.faceemotion= 5
	    GS.typer= 41
	    GS.msg[0]= "My body..^1.&It feels like it\'s&splitting apart./"
	    GS.msg[1]= "Like any instant..^1.&I\'ll scatter into&a million pieces./"
	    GS.msg[2]= "But.../"
	    GS.msg[3]= "Deep^1, deep in my&soul./"
	    GS.msg[4]= "There\'s a burning&feeling I can\'t&describe./"
	    GS.msg[5]= "\\E6A burning feeling&that WON\'T let me&die./"
	    GS.msg[6]= "\\E5This isn\'t just&about monsters&anymore^1, is it?/"
	    GS.msg[7]= "If you get past&me^1, you\'ll.../"
	    GS.msg[8]= "You\'ll destroy them&all^1, won\'t you?/"
	    GS.msg[9]= "Monsters..^1.&Humans..^1.&Everyone.../"
	    GS.msg[10]= "Everyone\'s hopes^1.&Everyone\'s dreams^1.&Vanquished in an&instant./"
	    GS.msg[11]= "\\E6But I WON\'T let&you do that./"
	    GS.msg[12]= "Right now^1, everyone&in the world.../"
	    GS.msg[13]= "\\E7I can feel their&hearts beating as&one./"
	    GS.msg[14]= "And we all have&ONE goal./"
	    GS.msg[15]= "\\E8To defeat YOU./"
	    GS.msg[16]= "\\E7Human^1.&No^1, WHATEVER you&are./"
	    GS.msg[17]= "\\E8For the sake of&the whole world.../%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 40
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 42
	    GS.msg[0]= "\\E9I^1, UNDYNE^1, will&strike you down!/%%"
	    scr_blcon_x(undyne.x + 160, undyne.y)
	    con= 41
	}
	if(con == 40 or con == 41) {
	    if(vol <= 0.8) vol+= 0.02
	    caster_set_volume(truthmusic, vol)
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(truthmusic)
	    risesfx= caster_load("music/f_destroyed2.ogg")
	    vol= 0
	    pit= 0.5
	    caster_loop(risesfx, 0, 0.5)
	    siner.idealww= 50
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    wht= scr_marker(-2, -2, 999)
	    wht.image_speed= 0
	    wht.scale.x= 400
	    wht.scale.y= 400
	    wht.modulate.a= 0
	    con= 42
	}
	if(con == 42) {
	    wht.modulate.a+= 0.01
	    if(wht.modulate.a >= 1) {
	        con= 43
	        $Alarm4.start((55) / 30.0)
	    }
	}
	if(con == 42) {
	    if(vol < 1) vol+= 0.01
	    if(pit < 2) pit+= 0.01
	    caster_set_volume(risesfx, vol)
	    caster_set_pitch(risesfx, pit)
	}
	if(con == 43) {
	    if(vol > 0) vol-= 0.03
	    if(pit < 2) pit+= 0.02
	    caster_set_volume(risesfx, vol)
	    caster_set_pitch(risesfx, pit)
	}
	if(con == 44) {
	    with(wht) instance_destroy()
	    caster_free(risesfx)
	    undyne.sprite_index= 300/* spr_undynex_example */
	    undyne.y= -40
	    siner.yy= -40
	    siner.y= 0
	    if(GS.osflavor == 2) siner.y= -40
	    con= 45
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 45 and GS.osflavor == 2) siner.y= -40
	if(con == 46) {
	    siner.idealww= 0
	    con= 47
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 47 and siner.ww > 0)
	    siner.ww-= 0.5
	if(con == 48) {
	    with(siner) instance_destroy()
	    GS.typer= 93
	    GS.msc= 0
	    GS.msg[0]= "You\'re gonna have&to try a little&harder than THAT./%%"
	    scr_blcon_x(undyne.x + 163, undyne.y + 50)
	    con= 49
	}
	if(con == 49 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 92
	    caster_free(-3)
	    room_restart()
	}
	if(con >= 20 and con <= 47) scr_textskip()
	if(con == 99) {
	    GS.flag[27]= 1
	    instance_create(0, 0, 149/* obj_unfader */)
	    cc= caster_get_volume(GS.batmusic)
	    con= 100
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 100) {
	    cc*= 0.6
	    caster_set_volume(GS.batmusic, cc)
	}
	if(con == 101) {
	    caster_free(GS.batmusic)
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    room_goto(GS.currentroom)
	}
	if(con == 200) {
	    siner= instance_create(undyne.x, undyne.y, 285/* obj_generalsiner */)
	    siner.idealww= 4
	    GS.faceemotion= 5
	    siner.idealww= 8
	    GS.typer= 40
	    GS.msg[0]= "You.../"
	    GS.msg[1]= "\\E9You\'re gonna have&to try a little&harder than THAT!/%%"
	    scr_blcon_x(undyne.x + 166, undyne.y)
	    con= 201
	}
	if(con == 201) scr_textskip()
	if(con == 201 and not instance_exists(782/* OBJ_WRITER */)) {
	    risesfx= caster_load("music/f_destroyed2.ogg")
	    vol= 0
	    pit= 0.5
	    caster_loop(risesfx, 0, 0.5)
	    siner.idealww= 50
	    wht= scr_marker(-2, -2, 999)
	    wht.image_speed= 0
	    wht.scale.x= 400
	    wht.scale.y= 400
	    wht.modulate.a= 0
	    con= 202
	}
	if(con == 202) {
	    wht.modulate.a+= 0.02
	    if(wht.modulate.a >= 1) {
	        con= 203
	        $Alarm4.start((55) / 30.0)
	    }
	}
	if(con == 202) {
	    if(vol < 1) vol+= 0.02
	    if(pit < 2) pit+= 0.02
	    caster_set_volume(risesfx, vol)
	    caster_set_pitch(risesfx, pit)
	}
	if(con == 203) {
	    if(vol > 0) vol-= 0.03
	    if(pit < 2) pit+= 0.02
	    caster_set_volume(risesfx, vol)
	    caster_set_pitch(risesfx, pit)
	}
	if(con == 204 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 92
	    caster_free(-3)
	    room_restart()
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    con= 99
	    GS.myfight= -99
	    GS.mnfight= -99
	    script_execute(163/* scr_mercystandard */)
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */))
	    script_execute(163/* scr_mercystandard */)

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
