# Auto-converted from GameMaker: obj_mettatonb_second
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
	ht= 200
	wd= 200

func _gm_event_1_0():
	if(mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 10
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_7():
	attacked= 2

func _gm_event_2_6():
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msc= 0
	GS.msg[0]= "THIS IS IT, DARLING!&SAY GOODBYE!/%%"
	turns++
	if(turns > 1 and GS.flag[385] < 2) {
	    if(turns == 2)
	        GS.msg[0]= "HA!&THAT BUTTON WON\'T&SAVE YOU NOW, DARLING!/%%"
	    if(turns == 3)
	        GS.msg[0]= "YOU WOULDN\'T DARE&USE THE [ACT] COMMAND&AND PRESS THAT&BUTTON!/%%"
	    if(turns == 4)
	        GS.msg[0]= "THAT\'S RIGHT!&DON\'T PRESS IT!&I\'LL DESTROY YOU!/%%"
	    if(turns == 5)
	        GS.msg[0]= "WITHOUT THAT BUTTON,&YOU ARE INCHING&CLOSER AND CLOSER&TO YOUR DEMISE!/%%"
	    if(turns == 6) GS.msg[0]= "ANY MINUTE NOW!&    /%%"
	    if(turns == 7) GS.msg[0]= "ANY... MINUTE...&....NOW!/%%"
	    if(turns == 8) {
	        GS.msg[0]= ".............&............/%%"
	        turns= 7
	    }
	    if(turns > 8) {
	        GS.msg[0]= "..........&...(COUGH)/%%"
	        turns= 7
	    }
	}
	if(con == 10 and GS.msg[0] == "OH!!!&THAT YELLOW GLOW...!/%%" and turns > 6)
	    GS.msg[0]= "TOOK YOU LONG&ENOUGH!/%%"
	GS.msg[1]= "%%%"
	GS.typer= 51
	scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	if(GS.hp > 1 and GS.flag[385] == 1) GS.border= 6
	if(turns == 0) GS.border= 0
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	whatiheard= -1
	GS.mnfight= 2
	if(GS.hp > 1 and GS.flag[385] == 1) GS.border= 6
	if(turns == 0) GS.border= 0
	if(con == 10) {
	    GS.border= 6
	    con= 11
	}

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
	    if(con == 0) con= 1
	    if(turns > 1 and GS.flag[385] == 1) {
	        GS.firingrate= 6
	        g= instance_create(100, 100, 696/* obj_blackbulletgen1 */)
	        g.velocity.x= 4
	        GS.turntimer= 90
	    }
	    with(mypart1) event_user(0)
	    GS.msg[0]= "* Mettaton."
	    if(mycommand >= 0) GS.msg[0]= "* Mettaton."
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
	        GS.msg[0]= "* METTATON - ATK 30 DEF 255&* His metal body STILL renders&  him invulnerable to attack./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You yell..^1.&* Nothing happened./^"
	        if(GS.flag[385] == 1) {
	            GS.flag[385]= 2
	            GS.msg[0]= "* You press the yellow button^1.&* The phone is resonating with&  Mettaton\'s presence...!/^"
	            con= 10
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
	    phone= instance_create(500, 260, 1363/* obj_npc_marker */)
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
	    con= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5) {
	    GS.msc= 0
	    GS.msg[0]= "IS THAT YOUR PHONE?&YOU\'D BETTER ANSWER&IT!/%%"
	    GS.typer= 51
	    scr_blcon(mypart1.x - 320, mypart1.y - 120, 1)
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    shblcon= instance_create(phone.x + 10, phone.y, 186/* obj_blconsm */)
	    shblcon.sprite_index= 27/* spr_shockblcon2 */
	    shake= 1
	    GS.typer= 49
	    GS.msg[0]= "H-hey!!&Th-this seems bad,&but don\'t worry!!/"
	    GS.msg[1]= "Th-there\'s one last&thing I installed&on your phone...!/"
	    GS.msg[2]= "\\WYou see that\\Y &yellow button\\W...?/"
	    GS.msg[3]= "Go to this phone\'s&[[ACT]] menu and&press it!!!/%%"
	    instance_create(phone.x - 100, phone.y - 140, 782/* OBJ_WRITER */)
	    con= 7
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Your phone\'s [[ACT]] menu is&  glowing."
	    GS.flag[385]= 1
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
	if(con >= 27 and instance_exists(188/* obj_blconwideslave */)) {
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
