# Auto-converted from GameMaker: obj_mettatonb_third
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 302
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -99999
	sha= 0
	shb= 0
	flex= 0
	alphaup= 0
	hurtlast= 0
	skip= 0
	right= 0
	if(instance_exists(185/* obj_battlebg */)) {
	    // obj_battlebg
	    with(185) instance_destroy()
	}
	x-= 100
	y-= 100
	scale.x= 2
	scale.y= 2
	hurta= 0
	turns= 0
	con= 0
	obj_heart.shot= 1
	obj_heart.sprite_index= 2094/* spr_heartyellow_flip */
	writer= 9
	i= 0
	repeat(99)  {
	    GS.failure[i]= 0
	    i++
	}
	GS.attacktype= 26
	GS.specialdam[0]= 0
	GS.specialdam[1]= 0
	GS.specialdam[2]= 0
	con_2= 0
	ht= 200
	wd= 200

func _gm_event_1_0():
	with(mypart1) instance_destroy()

func _gm_event_2_7():
	attacked= 2

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msc= 0
	GS.msg[0]= "THIS IS IT, DARLING!&SAY GOODBYE!/%%"
	turns++
	if(turns > 0) {
	    if(turns == 1) {
	        GS.msg[0]= "YES, I WAS THE ONE&THAT RE-ARRANGED&THE CORE!/"
	        GS.msg[1]= "I WAS THE ONE THAT&HIRED EVERYONE TO&KILL YOU!/"
	        GS.msg[2]= "THAT, HOWEVER, WAS A&SHORT-SIGHTED PLAN./"
	        GS.msg[3]= "YOU KNOW WHAT WOULD&BE A HUNDRED TIMES&BETTER?/"
	        GS.msg[4]= "KILLING YOU MYSELF!!/%%"
	    }
	    if(turns == 2) {
	        GS.msg[0]= "LISTEN, DARLING.&I\'VE SEEN YOU FIGHT./"
	        GS.msg[1]= "YOU\'RE WEAK./"
	        GS.msg[2]= "IF YOU CONTINUE&FORWARD, ASGORE WILL&TAKE YOUR SOUL./"
	        GS.msg[3]= "AND WITH YOUR SOUL,&ASGORE WILL DESTROY&HUMANITY./%%"
	    }
	    if(turns == 3) {
	        GS.msg[0]= "BUT IF I GET YOUR&SOUL, I CAN STOP&ASGORE\'S PLAN!/"
	        GS.msg[1]= "I CAN SAVE HUMANITY&FROM DESTRUCTION!/%%"
	    }
	    if(turns == 4) {
	        GS.msg[0]= "THEN, USING YOUR SOUL,&I\'LL CROSS THROUGH&THE BARRIER.../"
	        GS.msg[1]= "AND BECOME THE STAR&I\'VE ALWAYS DREAMED&OF BEING!/"
	        GS.msg[2]= "HUNDREDS, THOUSANDS.../"
	        GS.msg[3]= "NO!&MILLIONS OF HUMANS&WILL WATCH ME!/%%"
	    }
	    if(turns == 5) {
	        GS.msg[0]= "GLITZ! GLAMOUR!&I\'LL FINALLY HAVE&IT ALL!/"
	        GS.msg[1]= "SO WHAT IF A FEW&PEOPLE HAVE TO DIE?/"
	        GS.msg[2]= "THAT\'S SHOW BUSINESS,&BABY!/%%"
	    }
	}
	GS.typer= 51
	scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	GS.border= 24
	if(turns == 0) GS.border= 0
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(hurta == 0) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    hurta= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
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
	if(GS.mnfight == 3) {
	    attacked= 0
	    talked= 0
	}
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1) {
	    if(talked == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	        $Alarm5.start((1) / 30.0)
	        talked= 2
	    }
	    if(talked == 0) {
	        attacked= 0
	        $Alarm6.start((1) / 30.0)
	        talked= 1
	        GS.heard= 0
	    }
	    if(keyboard_multicheck_pressed(1/* ANYKEY */) and instance_exists(782/* OBJ_WRITER */))
	        OBJ_WRITER.stringpos= string_length(OBJ_WRITER.originalstring)
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        hurta= 0
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
	    if(turns >= 5 and con == 0) con= 1
	    if(con != 1) {
	        if(turns == 1) GS.attacktype= 100
	        else  mypart1.tang= 0
	        if(turns == 2) GS.attacktype= 26
	        if(turns == 3) GS.attacktype= 27
	        if(turns == 4) GS.attacktype= 28
	        if(turns > 4) GS.attacktype= 29
	        gen= instance_create(0, 0, 414/* obj_mettattackgen */)
	        if(turns == 1) gen.dark= 0
	    }
	    with(mypart1) event_user(0)
	    GS.msg[0]= "* MEttaton Rules the school."
	    if(mycommand >= 0) GS.msg[0]= "* Mettaton Is A- OK ."
	    if(mycommand >= 25)
	        GS.msg[0]= "* Aaron is sweating bullets^3.&* Literally."
	    if(mycommand >= 50)
	        GS.msg[0]= "* Aaron is admiring his own&  muscles."
	    if(mycommand >= 75)
	        GS.msg[0]= "* Smells like an underwater&  barnyard."
	    if(mycommand >= 90) GS.msg[0]= "* Smells like a mussel farm."
	    GS.msg[0]= "* Mettaton."
	    if(GS.monsterhp[myself] < 30) GS.msg[0]= "* No on e cares."
	    attacked= 1
	    $Alarm7.start((20) / 30.0)
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* METTATON - ATK 30 DEF 255&* Seriously^1, his metal body&  is invulnerable!/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* This is probably what you\'ll&  do if things continue in&  this manner./^"
	        if(GS.flag[424] == 1) {
	            GS.flag[424]= 2
	            GS.msg[0]= "* You tell Mettaton that there\'s&  a mirror behind him./%%"
	            con= 40
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(whatiheard == 3 and flex == 3 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	    velocity.y= -4
	    mypart1.velocity.y= -4
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(con == 1) {
	    obj_heart.shot= 0
	    GS.border= 0
	    snd_play(104/* snd_phone */)
	    SCR_BORDERSETUP()
	    con= 1.1
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 2.1) {
	    phone= instance_create(520, 260, 1363/* obj_npc_marker */)
	    phone.sprite_index= 317/* spr_fakephone */
	    phone.image_speed= 0
	    phone.visible= 1
	    phone.z_index= 20
	    snd_play(104/* snd_phone */)
	    phone.velocity.y= -2
	    con= 2
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 3) {
	    phone.velocity.y= 0
	    snd_play(104/* snd_phone */)
	    con= 5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    shblcon= instance_create(phone.x + 10, phone.y, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    shake= 1
	    GS.typer= 49
	    GS.msg[0]= "U..uh... I can\'t see&what\'s going on in&there, but.../"
	    GS.msg[1]= "D-d-don\'t give up,&okay!?/"
	    GS.msg[2]= "Th... there\'s o-one&l-l-last way to beat&Mettaton.../"
	    GS.msg[3]= "It\'s... um... it\'s.../"
	    GS.msg[4]= "This is a work in-&progress, so don\'t&judge it too hard.../"
	    GS.msg[5]= "But, you know how&Mettaton always faces&f-f-forward?/"
	    GS.msg[6]= "That\'s because&there\'s a switch&on his backside./"
	    GS.msg[7]= "S-s-so if y-y-you&c-c-can turn him&around... um.../"
	    GS.msg[8]= "And, umm... press&th-th-th-the&switch.../"
	    GS.msg[9]= "He\'ll be... um...&He\'ll be.../"
	    GS.msg[10]= "Vulnerable./"
	    GS.msg[11]= "Well, g-g-gotta go!/%%"
	    instance_create(phone.x - 100, phone.y - 140, 782/* OBJ_WRITER */)
	    con= 6.1
	}
	if(con == 6.1 and instance_exists(782/* OBJ_WRITER */) and keyboard_multicheck_pressed(1/* ANYKEY */) and instance_exists(782/* OBJ_WRITER */))
	    OBJ_WRITER.stringpos= string_length(OBJ_WRITER.originalstring)
	if(con == 6.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 5.2
	    $Alarm4.start((20) / 30.0)
	    phone.velocity.y= 5
	}
	if(con == 6.2) {
	    con= 7
	    with(phone) instance_destroy()
	    obj_heart.shot= 1
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Seems like a good time to&  turn Mettaton around."
	    GS.flag[424]= 1
	    with(shblcon) instance_destroy()
	    con= 8
	    shake= 0
	    GS.turntimer= -1
	    GS.mnfight= 3
	    GS.myfight= -1
	}
	if(con > 6 and shake == 1 and is_instance_valid(shblcon)) {
	    shblcon.x= shblcon.xstart + random(2)
	    shblcon.y= shblcon.ystart + random(2)
	}
	if(con == 11) {
	    obj_heart.movement= -1
	    con= 12
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 13) {
	    caster_stop(GS.batmusic)
	    ctheart= instance_create(obj_heart.x + 8, obj_heart.y + 8, 742/* obj_cutsceneheart */)
	    obj_heart.x= -999
	    obj_heart.movement= -1
	    con= 14
	}
	if(con == 15) {
	    shblcon= instance_create(phone.x + 10, phone.y, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    shake= 1
	    GS.typer= 49
	    GS.msg[0]= "Now press [Z]!!!"
	    instance_create(phone.x - 100, phone.y - 140, 782/* OBJ_WRITER */)
	    con= 16
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 17) {
	    if(GS.hp > 999) {
	        GS.turntimer= 300
	        instance_create(obj_heart.x, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x - 20, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x - 40, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x - 60, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x + 20, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x + 40, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x + 60, obj_heart.y - 180, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x, obj_heart.y - 220, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x, obj_heart.y - 260, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x - 20, obj_heart.y - 220, 675/* obj_blackboxtest */)
	        instance_create(obj_heart.x + 20, obj_heart.y - 220, 675/* obj_blackboxtest */)
	        obj_blackboxtest.velocity.y= 3
	        obj_blackboxtest.friction= -0.1
	        obj_blackboxtest.dmg= 1
	    }
	    con= 18
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 25) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    with(shblcon) instance_destroy()
	    // obj_heartshot
	    with(739) instance_destroy()
	    con= 24.5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 25.5) {
	    GS.msc= 0
	    GS.msg[0]= "OOOH!/"
	    GS.msg[1]= "OOOOOOOH!/"
	    GS.msg[2]= "YOU\'VE DEFEATED ME!!/"
	    GS.msg[3]= "HOW CAN THIS BE,&YOU WERE STRONGER&THAN I THOUGHT, ETC./%%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 26
	}
	if(con == 26 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "WHATEVER."
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 27
	    mypart1.velocity.x= -7
	    mypart1.hurta= 1
	    $Alarm4.start((60) / 30.0)
	}
	if(con >= 27 and con < 53 and instance_exists(188/* obj_blconwideslave */)) {
	    obj_blconwideslave.x= mypart1.x - 320
	    OBJ_WRITER.writingx= mypart1.x - 280
	}
	if(con == 28) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 29
	    $Alarm4.start((13) / 30.0)
	}
	if(con == 30) {
	    caster_free(-3)
	    room_goto(GS.currentroom)
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.mnfight= -1
	    GS.myfight= -1
	    GS.msc= 0
	    GS.msg[0]= "OH???&A MIRROR???/"
	    GS.msg[1]= "RIGHT, I HAVE TO&LOOK PERFECT FOR&OUR GRAND FINALE!/%%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 41
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    mypart1.behind= 1
	    GS.msg[0]= "HMMM...&I DON\'T SEE IT...&WHERE IS IT...?/%%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    mypart1.behind= 2
	    snd_play(108/* snd_item */)
	    con= 43
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 44) {
	    GS.msg[0]= "DID YOU./"
	    GS.msg[1]= "JUST FLIP./"
	    GS.msg[2]= "MY SWITCH?/%%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 46
	    cc= caster_load("music/computer.ogg")
	    pit= 0.8
	}
	if(con == 46 and not instance_exists(782/* OBJ_WRITER */)) {
	    mypart1.behind= 3
	    mypart1.trueanim= 0.1
	    cc= caster_loop(cc, 0.6, pit)
	    con= 47
	}
	if(con == 47) {
	    pit+= 0.013
	    mypart1.trueanim+= 0.04
	    caster_set_pitch(cc, pit)
	    if(pit > 2.8) con= 48
	}
	if(con == 48) {
	    caster_free(-3)
	    snd_play(44/* snd_laz */)
	    wht= scr_marker(0, 0, 999)
	    wht.scale.x= 700
	    wht.scale.y= 700
	    wht.modulate.a= 0.2
	    wht.z_index= -9000
	    con= 49
	}
	if(con == 49) {
	    wht.modulate.a+= 0.05
	    if(wht.modulate.a > 0.98) {
	        wht.modulate.a= 1
	        con= 49.1
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 50.1) {
	    oyea= caster_load("music/ohyes.ogg")
	    caster_play(oyea, 1, 1)
	    con= 50
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 51) {
	    with(mypart1) visible= 0
	    instance_create(0, 0, 405/* obj_mett_bossintro */)
	    con= 52
	}
	if(con == 52) {
	    wht.modulate.a-= 0.05
	    if(wht.modulate.a < 0.06) {
	        with(wht) instance_destroy()
	        con= 53
	    }
	}
	if(con_2 > 0) GS.turntimer= 11
	if(con_2 == 1) {
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    GS.msc= 0
	    GS.msg[0]= "THAT WORTHLESS PEA-&SHOOTER WON\'T WORK&ON ME, DARLING. ^3 %"
	    GS.msg[1]= "DON\'T YOU UNDERSTAND&WHAT ACTING IS!?^3 %%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con_2= 2
	}
	if(con_2 == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Mettaton."
	    con_2= -1
	    GS.turntimer= 3
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
