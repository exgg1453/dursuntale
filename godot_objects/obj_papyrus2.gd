# Auto-converted from GameMaker: obj_papyrus2
extends CharacterBody2D

func _ready():
	if(GS.plot >= 43) instance_destroy()
	else  {
	    conversation= 0
	    scale.y= 999
	    sans= instance_create(240, 74, 1033/* obj_sans_actor */)
	    papyrus= instance_create(240, 100, 1032/* obj_papyrus_actor */)
	    papyrus.sprite_index= 1327/* spr_papyrus_ut */
	    sans.sprite_index= 1355/* spr_sans_dt */
	}
	look= 0
	spinagain= 0
	murder= 0
	if(scr_murderlv() >= 3) murder= 1
	if(GS.flag[27] == 1) murder= 0
	mcmove= 0

func _gm_event_2_3():
	conversation++
	// obj_cosmeticblcon
	with(1337) instance_destroy()

func _gm_event_2_2():
	GS.plot= 37
	caster_loop(GS.currentsong, 1, 0.95)
	GS.interact= 0

func _gm_event_2_1():
	if(conversation == 9) conversation= 10
	if(conversation == 11) conversation= 12
	if(conversation == 17) conversation= 18
	if(conversation == 24) conversation= 25

func _on_destroy():
	// obj_cosmeticblcon
	with(1337) instance_destroy()
	conversation= 4

func _process(delta: float):
	if(conversation == 1) {
	    fade= instance_create(0, 0, 92/* obj_musfadeout */)
	    fade.fadespeed= 0.5
	    GS.currentsong= caster_load("music/papyrus.ogg")
	    caster_loop(GS.currentsong, 0.6, 1)
	    myinteract= 3
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    GS.msg[0]= "YOU\'RE SO&LAZY!!/"
	    GS.msg[1]= "YOU WERE&NAPPING&ALL NIGHT!!/"
	    scr_sansface(2, 0)
	    GS.msg[3]= "* i think that\'s called.../"
	    GS.msg[4]= "\\E1* sleeping./"
	    scr_papface(5, 1)
	    GS.msg[6]= "EXCUSES^1,&EXCUSES!/%%"
	    ini_open("undertale.ini")
	    M1= ini_read_real("Papyrus", "M1", 0)
	    ini_close()
	    if(M1 > 1) {
	        GS.msg[0]= "REALLY THOUGH!!^1!&THAT HUMAN!!!/"
	        GS.msg[1]= "\\E2DO I KNOW THAT&PERSON???/"
	        scr_sansface(2, 0)
	        GS.msg[3]= "* do you not know.../"
	        GS.msg[4]= "\\E1* who you know?/"
	        scr_papface(5, 0)
	        GS.msg[6]= "PBPBPPBPT!!/"
	        GS.msg[7]= "OF COURSE I KNOW&WHO I KNOW!!/"
	        GS.msg[8]= "I WANTED TO KNOW IF&YOU KNOW.../"
	        GS.msg[9]= "I KNOW WHO I KNOW&AS MUCH AS I KNOW&I KNOW WHO I KNOW!/"
	        GS.msg[10]= "\\E2...YOU KNOW?/%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 3
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm0.start((45) / 30.0)
	    if(murder == 1) {
	        $Alarm0.start((-1) / 30.0)
	        $Alarm3.start((45) / 30.0)
	        x= 400
	        conversation= 49
	    }
	}
	if(conversation == 4) {
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.interact= 1
	    GS.msg[0]= "OH-HO^1!&THE HUMAN&ARRIVES!/"
	    if(M1 > 1) GS.msg[0]= "OH-HO^1!&SPEAK OF THE DEVIL!/"
	    GS.msg[1]= "IN ORDER TO&STOP YOU^1.../"
	    GS.msg[2]= "MY BROTHER AND&I HAVE CREATED&SOME PUZZLES!/"
	    GS.msg[3]= "I THINK YOU&WILL FIND&THIS ONE.../"
	    GS.msg[4]= "\\E2QUITE&SHOCKING!!!/"
	    GS.msg[5]= "\\E0FOR YOU SEE^1,&THIS IS THE&INVISIBLE.../"
	    GS.msg[6]= "ELECTRICITY&MAZE!!!/"
	    GS.msg[7]= "WHEN YOU TOUCH&THE WALLS OF&THIS MAZE,/"
	    GS.msg[8]= "THIS ORB WILL&ADMINISTER A&HEARTY ZAP!/"
	    GS.msg[9]= "\\E2SOUND LIKE&FUN???/"
	    GS.msg[10]= "BECAUSE!/"
	    GS.msg[11]= "THE AMOUNT OF&FUN YOU WILL&PROBABLY HAVE,/"
	    GS.msg[12]= "\\E3IS ACTUALLY&RATHER SMALL&I THINK./"
	    GS.msg[13]= "\\E0OK^1, YOU CAN&GO AHEAD NOW./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 6
	}
	if(conversation == 6 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno > 7)
	    papyrus.sprite_index= 1317/* spr_papyrus_orb */
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(10, 0, 1007/* obj_puzzlewall1 */)
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    conversation= 7
	    x+= 20
	    GS.interact= 0
	    solid= 0
	}
	if(conversation == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    conversation= 9
	    papyrus.fun= 1
	    snd_play(24/* snd_shock */)
	    papyrus.sprite_index= 1339/* spr_papyrus_electrocute */
	    papyrus.image_speed= 0.5
	    $Alarm1.start((30) / 30.0)
	}
	if(conversation == 9) {
	    ggg= floor(random(6) - 2)
	    papyrus.x= papyrus.xstart + ggg
	    ggg= floor(random(6) - 2)
	    papyrus.y= papyrus.ystart + ggg
	}
	if(conversation == 10) {
	    papyrus.x= papyrus.xstart
	    papyrus.y= papyrus.ystart
	    papyrus.sprite_index= 1319/* spr_papyrus_toasted */
	    papyrus.image_speed= 0.2
	    $Alarm1.start((60) / 30.0)
	    conversation= 11
	}
	if(conversation == 12) {
	    sans.sprite_index= sans.dtsprite
	    papyrus.sprite_index= 1308/* spr_papyrus_mad1 */
	    papyrus.image_speed= 0.33334
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.msg[0]= "SANS!!^1!&WHAT DID YOU&DO?!?!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 13
	}
	if(conversation == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.fun= 0
	    papyrus.sprite_index= papyrus.utsprite
	    papyrus.image_speed= 0
	    GS.faceemotion= 1
	    GS.facechoice= 3
	    GS.typer= 17
	    GS.msg[0]= "* i think the human&  has to hold the orb./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 14
	}
	if(conversation == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.sprite_index= papyrus.ltsprite
	    papyrus.image_speed= 0
	    GS.faceemotion= 0
	    GS.facechoice= 4
	    GS.typer= 19
	    GS.msg[0]= "OH^1, OKAY./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 15
	}
	if(conversation == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    sans.sprite_index= sans.ltsprite
	    papyrus.npcdir= 1
	    papyrus.frame= 0
	    papyrus.image_speed= 0.2
	    crunchybunchy= 0
	    with(papyrus) path_start(31/* path_papyrus1 */, 2, 0, 0/* path_action_stop */)
	    conversation= 16
	}
	if(conversation == 16 and instance_exists(1032/* obj_papyrus_actor */)) {
	    stepmake= 0
	    crunchybunchy+= 0.5
	    if(crunchybunchy == 1) stepmake= 1
	    if(crunchybunchy == 3) stepmake= 1
	    if(crunchybunchy == 4) crunchybunchy= 0
	    if(stepmake == 1 and papyrus.x < papyrus.xstart - 10)
	        instance_create(papyrus.x, papyrus.y, 1006/* obj_papyrussteps */)
	}
	if(conversation == 16 and instance_exists(1032/* obj_papyrus_actor */) and papyrus.path_position == 1) {
	    papyrus.npcdir= 0
	    papyrus.sprite_index= 1317/* spr_papyrus_orb */
	    GS.msg[0]= "HOLD THIS PLEASE!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 16.5
	}
	if(conversation == 16.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm1.start((30) / 30.0)
	    papyrus.sprite_index= 1318/* spr_papyrus_orbtoss */
	    instance_create(papyrus.x + 1, papyrus.y + 1, 995/* obj_orbhead */)
	    conversation= 17
	}
	if(conversation == 18) {
	    papyrus.npcdir= 1
	    papyrus.image_speed= 0.2
	    with(papyrus) path_start(32/* path_papyrus1A */, 5, 0, 0/* path_action_stop */)
	    conversation= 19
	}
	if(conversation == 19 and instance_exists(1032/* obj_papyrus_actor */) and papyrus.path_position == 1) {
	    papyrus.npcdir= 0
	    $Alarm1.start((30) / 30.0)
	    conversation= 20
	    papyrus.sprite_index= papyrus.ltsprite
	    papyrus.image_speed= 0
	    GS.faceemotion= 0
	    GS.facechoice= 4
	    GS.typer= 19
	    GS.msg[0]= "OKAY^1, TRY NOW!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 20
	}
	if(conversation == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    x= 248
	    GS.interact= 0
	    conversation= 21
	}
	if(conversation == 22) {
	    GS.interact= 1
	    GS.msc= 0
	    papyrus.sprite_index= papyrus.dtsprite
	    sans.sprite_index= sans.dtsprite
	    GS.faceemotion= 0
	    GS.facechoice= 4
	    GS.typer= 19
	    GS.msg[0]= "\\E1INCREDIBLE!!&YOU SLIPPERY&SNAIL!!/"
	    GS.msg[1]= "\\E3YOU SOLVED IT&SO EASILY..^1.&TOO EASILY!/"
	    GS.msg[2]= "\\E0HOWEVER!!/"
	    GS.msg[3]= "THE NEXT&PUZZLE WILL&NOT BE EASY!/"
	    GS.msg[4]= "IT IS DESIGNED&BY MY BROTHER^1,&SANS!/"
	    GS.msg[5]= "YOU WILL&SURELY BE&CONFOUNDED!/"
	    GS.msg[6]= "I KNOW I AM!/"
	    GS.msg[7]= "NYEH HEH HEH&HEH HEH!!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 23
	}
	if(conversation == 23) GS.interact= 1
	if(conversation == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(instance_exists(995/* obj_orbhead */)) {
	        // obj_orbhead
	        with(995) instance_destroy()
	    }
	    // obj_shockblock
	    with(994) instance_destroy()
	    papyrus.velocity.x= 5
	    papyrus.sprite_index= papyrus.lsprite
	    papyrus.image_speed= 0.2
	    hhh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hhh.fadespeed= 0.05
	    $Alarm1.start((30) / 30.0)
	    conversation= 24
	}
	if(conversation == 25) {
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    if(murder == 1) caster_set_pitch(GS.currentsong, 0.5)
	    GS.plot= 43
	    GS.interact= 0
	    if(instance_exists(1007/* obj_puzzlewall1 */)) {
	        // obj_puzzlewall1
	        with(1007) instance_destroy()
	    }
	    instance_create(sans.x, sans.y, 1022/* obj_sans_room */)
	    with(sans) instance_destroy()
	    with(papyrus) instance_destroy()
	    instance_destroy()
	}
	if(conversation == 50) {
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1045)
	    // obj_mainchara
	    with(1570) visible= 0
	    with(mc) scr_depth()
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.interact= 1
	    GS.msg[0]= "OH-HO^1!&THE HUMAN&ARRIVES!/"
	    GS.msg[1]= "IN ORDER TO&STOP YOU^1.../"
	    GS.msg[2]= "MY BROTHER AND&I HAVE CREATED&SOME PUZZLES!/"
	    GS.msg[3]= "I THINK YOU&WILL FIND&THIS ONE.../"
	    GS.msg[4]= "\\E2QUITE&SHOCKING!!!/"
	    GS.msg[5]= "\\E5FOR YOU SEE^1,&THIS IS..^1.&THE^1, INVISIBLE.../%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 51
	}
	if(conversation == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 4) {
	        mc.velocity.x= 3
	        mc.image_speed= 0.25
	    }
	    if(mc.x >= 158) {
	        mc.x= 160
	        mc.velocity.x= 0
	        mc.frame= 0
	        mc.image_speed= 0
	    }
	}
	if(conversation == 51 and not instance_exists(782/* OBJ_WRITER */) and mc.x >= 158) {
	    mc.x= 160
	    mc.velocity.x= 0
	    mc.frame= 0
	    mc.image_speed= 0
	    conversation= 52
	    $Alarm3.start((50) / 30.0)
	}
	if(conversation == 53) {
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 3
	    GS.interact= 1
	    GS.msg[0]= "\\E5UHHHHHHH...?/"
	    GS.msg[1]= "\\E3HMMM..^1. YOU MUST&BE HAVING&CULTURE SHOCK./"
	    GS.msg[2]= "\\E0YOU SEE^1, WHERE I&COME FROM^1, IT\'S&A LOVING TRADITION./"
	    GS.msg[3]= "TO SUFFER THROUGH&HORRIBLE PUZZLES&FOR NO REASON./"
	    GS.msg[4]= "\\E5SO^1, UH^1, JUST&WALK BACK THERE^1,&AND.../"
	    GS.msg[5]= ".../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 54
	}
	if(conversation == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 4) {
	        mc.velocity.x= 3
	        mc.image_speed= 0.25
	    }
	    if(mc.x >= 218) {
	        mc.x= 220
	        mc.velocity.x= 0
	        mc.frame= 0
	        mc.image_speed= 0
	    }
	}
	if(conversation == 54 and not instance_exists(782/* OBJ_WRITER */) and mc.x >= 218) {
	    mc.x= 220
	    mc.velocity.x= 0
	    mc.frame= 0
	    mc.image_speed= 0
	    conversation= 55
	    $Alarm3.start((50) / 30.0)
	}
	if(conversation == 56) {
	    GS.flag[291]= 1
	    GS.interact= 1
	    GS.msc= 0
	    papyrus.sprite_index= papyrus.dtsprite
	    sans.sprite_index= sans.dtsprite
	    GS.faceemotion= 0
	    GS.facechoice= 4
	    GS.typer= 19
	    GS.msg[0]= "\\E3SIGH.../"
	    GS.msg[1]= "\\E3WHY COULDN\'T WE GET&A HUMAN THAT LIKES&PUZZLES???/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 57
	}
	if(conversation == 57 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(instance_exists(995/* obj_orbhead */)) {
	        // obj_orbhead
	        with(995) instance_destroy()
	    }
	    // obj_shockblock
	    with(994) instance_destroy()
	    papyrus.velocity.x= 5
	    papyrus.sprite_index= papyrus.rsprite
	    papyrus.image_speed= 0.2
	    hhh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hhh.fadespeed= 0.05
	    $Alarm3.start((30) / 30.0)
	    conversation= 58
	}
	if(conversation == 59) {
	    obj_mainchara.x= mc.x
	    obj_mainchara.y= mc.y
	    GS.facing= 0
	    with(mc) instance_destroy()
	    obj_mainchara.visible= 1
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    if(murder == 1) caster_set_pitch(GS.currentsong, 0.5)
	    GS.plot= 43
	    GS.interact= 0
	    if(instance_exists(1007/* obj_puzzlewall1 */)) {
	        // obj_puzzlewall1
	        with(1007) instance_destroy()
	    }
	    instance_create(sans.x, sans.y, 1022/* obj_sans_room */)
	    with(sans) instance_destroy()
	    with(papyrus) instance_destroy()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1
	if(conversation == 7) conversation= 8
	if(conversation == 21) conversation= 22

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
