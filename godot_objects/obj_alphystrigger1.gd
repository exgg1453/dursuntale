# Auto-converted from GameMaker: obj_alphystrigger1
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 125) instance_destroy()
	if(scr_murderlv() >= 12) instance_destroy()
	scale.y= 8
	looktimer= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.flag[20]= 0
	    alphys= instance_create(obj_slidingdoor.x + 10, obj_slidingdoor.y + 5, 1171/* obj_alphys_actor */)
	    alphys.d= 1
	    alphys.z_index= obj_slidingdoor.z_index + 1
	    lab= caster_load("music/lab.ogg")
	    smash= caster_load("music/mettsmash.ogg")
	    gameshow= caster_load("music/mtgameshow.ogg")
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    obj_mainchara.cutscene= 1
	    con= 2
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2) view_xview[0]+= 2
	if(con == 3) {
	    con= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5) {
	    // obj_slidingdoor
	    with(1291) event_user(0)
	    con= 6
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 7) {
	    alphys.d= 0
	    alphys.velocity.y= 2
	    con= 8
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 9) {
	    // obj_slidingdoor
	    with(1291) event_user(1)
	    con= 10
	}
	if(con == 10 and alphys.y >= obj_mainchara.y - 4) {
	    con= 11
	    $Alarm4.start((60) / 30.0)
	    alphys.velocity.y= 0
	    alphys.image_speed= 0
	}
	if(con == 12) {
	    snd_play(106/* snd_noise */)
	    // obj_labdarkness
	    with(1304) instance_destroy()
	    con= 13
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 14) {
	    alphys.sprite_index= alphys.lsprite
	    alphys.direction= 180
	    alphys.speed= 3
	    con= 15
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 16) {
	    alphys.speed= 0
	    blc= instance_create(alphys.x, alphys.y - 6, 1337/* obj_cosmeticblcon */)
	    snd_play(29/* snd_b */)
	    con= 17
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 18) {
	    with(blc) instance_destroy()
	    alphys.fun= 1
	    alphys.sprite_index= 1641/* spr_alphys_freaked */
	    GS.facechoice= 6
	    GS.faceemotion= 3
	    GS.typer= 47
	    GS.msc= 0
	    GS.msg[0]= "* Oh^1.&* My god./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 19
	}
	if(con == 19 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* I didn\'t expect you&  to show up so&  soon!/"
	    GS.msg[1]= "* I haven\'t showered^1, I\'m&  barely dressed^1, it\'s&  all messy^1, and.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 20
	    alphys.sprite_index= alphys.lsprite
	    alphys.image_speed= 0.334
	}
	if(con == 20) {
	    looktimer++
	    if(looktimer > 8) {
	        rr= floor(random(4))
	        if(rr == 0) alphys.sprite_index= alphys.lsprite
	        if(rr == 1) alphys.sprite_index= alphys.rsprite
	        if(rr == 2) alphys.sprite_index= alphys.usprite
	        if(rr == 3) alphys.sprite_index= alphys.dsprite
	        looktimer= 0
	    }
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 21
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 21)
	    alphys.image_speed-= 0.0033
	if(con == 22) {
	    alphys.frame= 0
	    alphys.sprite_index= alphys.ltsprite
	    alphys.fun= 0
	    con= 23
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 24) {
	    con= 25
	    caster_loop(lab, 1, 1)
	    labvolume= 1
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ummm.../"
	    GS.msg[1]= "* H-h-hiya!/"
	    GS.msg[2]= "* I\'m Dr. Alphys^1.&* I\'m ASGORE\'s royal&  scientist!/"
	    GS.msg[3]= "\\E3* B-b-but^1, ahhhh^1,&  I\'m not one of&  the " + chr(ord('"')) + "bad guys" + chr(ord('"')) + "!/"
	    GS.msg[4]= "\\E0* Actually^1, since you&  stepped out of the&  RUINS^1, I\'ve^1, um.../"
	    GS.msg[5]= "\\E7* ... been " + chr(ord('"')) + "observing" + chr(ord('"')) + "&  your journey through&  my console./"
	    GS.msg[6]= "\\E3* Your fights..^1.&* Your friendships..^1.&* Everything!/"
	    GS.msg[7]= "\\E0* I was originally&  going to stop&  you^1, but.../"
	    ini_open("undertale.ini")
	    ad= ini_read_real("Alphys", "AD", 0)
	    ini_close()
	    GS.msg[8]= "\\E7* Watching someone on&  a screen really makes&  you root for them./"
	    if(ad > 0)
	        GS.msg[8]= "\\E7* Watching you^1, I felt&  like..^1. like I was&  seeing an old friend./"
	    GS.msg[9]= "\\E0* S-so^1, ahhh^1, now I&  want to help you!/"
	    GS.msg[10]= "\\E6* Using my knowledge^1,&  I can easily guide&  you through Hotland!/"
	    GS.msg[11]= "\\E0* I know a way right&  to ASGORE\'s castle^1,&  no problem!/"
	    GS.msg[12]= "\\E2* .../"
	    GS.msg[13]= "\\E7* Well^1, actually^1, umm^1,&  there\'s just a&  tiny issue./"
	    GS.msg[14]= "\\E0* A long time ago^1, I&  made a robot named&  Mettaton./"
	    GS.msg[15]= "* Originally^1, I built&  him to be an&  entertainment robot./"
	    GS.msg[16]= "\\E7* Uh^1, you know^1, like&  a robotic TV star&  or something./"
	    GS.msg[17]= "\\E0* Anyway^1, recently I&  decided to make him&  more useful./"
	    GS.msg[18]= "\\E7* You know^1, just some&  small practical&  adjustments./"
	    GS.msg[19]= "\\E0* Like^1, um.../"
	    GS.msg[20]= "\\E4* Anti..^1. anti-human&  combat features?/"
	    GS.msg[21]= "\\E6* Of c-course^1, when I&  saw you coming^1, I&  immediately decided.../"
	    GS.msg[22]= "\\E3* I have to remove&  those features!/"
	    GS.msg[23]= "\\E4* Unfortunately^1, I may&  have made a teensy&  mistake while doing so./"
	    GS.msg[24]= "* And^1, um.../"
	    GS.msg[25]= "\\E5* Now he\'s an unstoppable&  killing machine with a&  thirst for human blood?/"
	    GS.msg[26]= "* Ehehehehe.../"
	    GS.msg[27]= "\\E8* Heh./"
	    GS.msg[28]= "\\E0* But^1, ummm^1, hopefully&  we won\'t run into&  him!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 25 and not instance_exists(782/* OBJ_WRITER */)) {
	    labvolume-= 0.03
	    caster_set_volume(lab, labvolume)
	    if(labvolume <= 0) {
	        con= 26
	        $Alarm4.start((60) / 30.0)
	        caster_stop(lab)
	    }
	}
	if(con == 27) {
	    scr_shake(2, 2, 2)
	    caster_play(smash, 0.25, 1)
	    scr_bouncer(alphys, 2, 0.8)
	    scr_bouncer(1570, 2, 0.8)
	    con= 28
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 29) {
	    GS.faceemotion= 1
	    GS.msg[0]= "* ...?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 30
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 31
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 32) {
	    scr_shake(3, 3, 2)
	    caster_play(smash, 0.4, 1)
	    scr_bouncer(alphys, 3, 1)
	    scr_bouncer(1570, 3, 1)
	    con= 33
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 34) {
	    GS.faceemotion= 0
	    GS.msg[0]= "* Did you hear&  something?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 35
	}
	if(con == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 36
	    $Alarm4.start((30) / 30.0)
	    smashamt= 0
	}
	if(con == 37) {
	    caster_play(smash, 0.5 + smashamt, 1)
	    scr_shake(3, 3, 2)
	    scr_bouncer(alphys, 4, 1)
	    scr_bouncer(1570, 4, 1)
	    con= 38
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 39) {
	    con= 37
	    smashamt+= 0.1
	    if(smashamt > 0.4) con= 40
	}
	if(con == 40) {
	    GS.faceemotion= 3
	    GS.msg[0]= "* Oh no./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 41
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 42
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 43) {
	    snd_play(44/* snd_laz */)
	    wht= instance_create(0, 0, 113/* obj_whitesploder */)
	    con= 44
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 45) {
	    blk= instance_create(view_xview[0] - 2, -2, 1363/* obj_npc_marker */)
	    blk.z_index= wht.z_index - 2
	    blk.modulate.a= 0
	    blk.visible= 1
	    blk.image_speed= 0
	    blk.sprite_index= 996/* spr_pixblk */
	    blk.scale.x= 200
	    blk.scale.y= 200
	    con= 46
	}
	if(con == 46) {
	    cheer= caster_load("music/mett_cheer.ogg")
	    clap= caster_load("music/mett_applause.ogg")
	    blk.modulate.a+= 0.02
	    if(blk.modulate.a >= 1) {
	        con= 47
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 48) {
	    with(wht) instance_destroy()
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    obj_mainchara.y= 120
	    alphys.y= 120
	    GS.msg[0]= "* OHHHH YES!/"
	    GS.msg[1]= "* WELCOME^1, BEAUTIES.../%%"
	    con= 49
	    GS.facing= 2
	    alphys.sprite_index= alphys.usprite
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    mett= instance_create(760, 60, 1172/* obj_mettaton_actor */)
	    mett.image_speed= 0
	    obj_mettwallhole.visible= 1
	    gamesign= instance_create(720, -40, 1363/* obj_npc_marker */)
	    gamesign.sprite_index= 1654/* spr_gameshowlogo */
	    gamesign.z_index= 14
	    gamesign.image_speed= 0.2
	    gamesign.visible= 1
	}
	if(con == 49 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 50
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 51) {
	    snd_play(10/* snd_drumroll */)
	    con= 52
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 53) {
	    with(blk) instance_destroy()
	    snd_play(28/* snd_bell */)
	    shadow= instance_create(view_xview[0], 0, 1363/* obj_npc_marker */)
	    shadow.image_speed= 0
	    shadow.visible= 1
	    shadow.modulate.a= 1
	    shadow.sprite_index= 1583/* spr_statueshadow */
	    shadow.z_index= 15
	    mett.d= 1
	    mett.z_index= 10
	    con= 54
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 55) {
	    mett.image_speed= 0.2
	    GS.msg[0]= "\\M1* ... TO TODAY\'S QUIZ SHOW!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 56
	}
	if(con == 56 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_play(cheer, 1, 1)
	    caster_loop(gameshow, 1, 1)
	    shadow.modulate.a= 0.95
	    dball= instance_create(view_xview[0] + 60, -30, 1284/* obj_discoball */)
	    obj_discoball.z_index= 13
	    con= 57
	}
	if(con == 57) {
	    repeat(2) 
	        instance_create(view_xview[0] + random(320), view_yview[0] - 10, 109/* obj_confetti */)
	    if(gamesign.y < gamesign.ystart + 40)
	        gamesign.y++
	    shadow.modulate.a-= 0.005
	    if(shadow.modulate.a < 0.7) con= 58
	}
	if(con == 58) {
	    GS.msg[0]= "\\M0* OH BOY^1!&* I CAN ALREADY TELL IT\'S&  GONNA BE A GREAT SHOW!/"
	    GS.msg[1]= "\\M2* EVERYONE GIVE A BIG&  HAND FOR OUR WONDERFUL&  CONTESTANT!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 59
	}
	if(con == 59 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_play(clap, 1, 1)
	    mett.image_speed= 0.5
	    GS.flag[20]= 3
	    con= 60
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 60) {
	    conf= instance_create(obj_mainchara.x + random(20), view_yview[0] - 10, 109/* obj_confetti */)
	    conf.velocity.x= -1 + random(2)
	}
	if(con == 61) {
	    mett.image_speed= 0.2
	    GS.msg[0]= "\\M0* NEVER PLAYED BEFORE^1,&  GORGEOUS?/"
	    GS.msg[1]= "\\M2* NO PROBLEM^1!&* IT\'S SIMPLE!/"
	    GS.msg[2]= "\\M4* THERE\'S ONLY ONE&  RULE./"
	    GS.msg[3]= "* ANSWER CORRECTLY.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 63
	}
	if(con == 63 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.image_speed= 0
	    snd_play(10/* snd_drumroll */)
	    con= 64
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 65) {
	    caster_free(-3)
	    GS.flag[20]= 5
	    mett.image_speed= 0.25
	    GS.msg[0]= "* OR YOU DIE!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 66
	}
	if(con == 66 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(instance_exists(109/* obj_confetti */)) {
	        // obj_confetti
	        with(109) instance_destroy()
	    }
	    active= 0
	    speed= 0
	    GS.interact= 1
	    caster_free(-3)
	    con= 67
	    $Alarm4.start((10) / 30.0)
	    GS.border= 0
	    GS.battlegroup= 48
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	}
	if(con == 68) {
	    with(mett) instance_destroy()
	    with(shadow) instance_destroy()
	    // obj_discoball
	    with(1284) instance_destroy()
	    with(gamesign) instance_destroy()
	    con= 68.1
	    GS.interact= 1
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 69.1 and not instance_exists(142/* obj_battler */)) {
	    GS.mercy= 0
	    GS.interact= 1
	    GS.currentsong= caster_load("music/lab.ogg")
	    con= 70
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 70) GS.interact= 1
	if(con == 71) {
	    GS.flag[462]= 0
	    alphys.sprite_index= alphys.lsprite
	    GS.msg[0]= "* .../"
	    GS.msg[1]= "\\E0* Well that was&  certainly something./%%"
	    GS.typer= 47
	    GS.facechoice= 6
	    GS.faceemotion= 1
	    GS.msc= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 72
	}
	if(con == 72 and not instance_exists(782/* OBJ_WRITER */)) {
	    alphys2= instance_create(alphys.x, alphys.y, 1170/* obj_alphys_npc */)
	    with(alphys) instance_destroy()
	    con= 73
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 73) {
	    view_xview[0]-= 2
	    GS.interact= 1
	}
	if(con == 74) {
	    caster_loop(GS.currentsong, 1, 1)
	    obj_mainchara.cutscene= 0
	    GS.interact= 0
	    con= 75
	    GS.plot= 126
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
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
