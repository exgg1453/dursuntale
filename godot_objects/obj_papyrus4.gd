# Auto-converted from GameMaker: obj_papyrus4
extends CharacterBody2D

func _ready():
	if(GS.plot >= 58) instance_destroy()
	else  {
	    conversation= 0
	    scale.y= 999
	    sans= instance_create(245, 120, 1033/* obj_sans_actor */)
	    papyrus= instance_create(245, 74, 1032/* obj_papyrus_actor */)
	    papyrus.sprite_index= 1316/* spr_papyrus_dt */
	    sans.sprite_index= 1362/* spr_sans_u */
	    computersound= caster_load("music/computer.ogg")
	}
	look= 0
	spinagain= 0
	murder= 0
	if(scr_murderlv() >= 4 and GS.flag[27] == 0) murder= 1

func _gm_event_2_4():
	conversation++

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
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    conversation= 2
	}
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 3
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm0.start((30) / 30.0)
	    $Alarm4.start((40) / 30.0)
	}
	if(conversation == 4) {
	    GS.msc= 243
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.interact= 1
	    conversation= 6
	    if(murder == 1) {
	        obj_mainchara.visible= 0
	        mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1045)
	        conversation= 120
	        $Alarm4.start((-1) / 30.0)
	        $Alarm0.start((-1) / 30.0)
	        GS.msc= 0
	        GS.msg[0]= "HEY!/"
	        GS.msg[1]= "IT\'S THE HUMAN!/"
	        GS.msg[2]= "\\E0YOU\'RE GONNA&LOVE THIS&PUZZLE!/"
	        GS.msg[3]= "IT WAS MADE&BY THE GREAT.../%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.fun= 1
	    papyrus.image_speed= 0.2
	    papyrus.sprite_index= papyrus.usprite
	    sans.sprite_index= sans.ltsprite
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    conversation= 7
	    x= 220
	    GS.interact= 0
	    solid= 0
	}
	if(conversation == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_specialtile.$Alarm0.start((2) / 30.0)
	    conversation= 51
	    papyrus.sprite_index= papyrus.usprite
	    papyrus.fun= 1
	    papyrus.image_speed= 0.2
	    $Alarm4.start((60) / 30.0)
	    caster_set_volume(GS.currentsong, 0.3)
	    caster_loop(computersound, 0.6, 0.1)
	}
	if(conversation == 52) {
	    papyrus.sprite_index= papyrus.lsprite
	    papyrus.image_speed= 0
	    if(obj_specialtile.randofactor == -1) {
	        i= 0
	        while(i < 4) {
	            instance_create(80 + i * 40, 80, 8/* obj_solidwide */)
	            instance_create(80 + i * 40, 100, 8/* obj_solidwide */)
	            instance_create(80 + i * 40, 160, 8/* obj_solidwide */)
	            instance_create(80 + i * 40, 180, 8/* obj_solidwide */)
	            i++
	        }
	        caster_free(GS.currentsong)
	        caster_free(computersound)
	        $Alarm4.start((110) / 30.0)
	        conversation= 53
	    }
	}
	if(conversation == 54) {
	    sans.sprite_index= sans.usprite
	    papyrus.sprite_index= 1321/* spr_papyrus_spin */
	    papyrus.image_speed= 0.2
	    papyrus.velocity.y= 1
	    $Alarm4.start((10) / 30.0)
	    conversation= 55
	}
	if(conversation == 56) {
	    sans.fun= 1
	    sans.image_speed= 0.25
	    sans.velocity.y= 2
	    sans.sprite_index= 1362/* spr_sans_u */
	    conversation= 57
	    $Alarm4.start((10) / 30.0)
	}
	if(conversation == 58) {
	    sans.velocity.y= 0
	    sans.image_speed= 0
	    $Alarm4.start((20) / 30.0)
	    conversation= 59
	}
	if(conversation == 60) {
	    papyrus.velocity.y= 0
	    papyrus.velocity.x= 1
	    if(papyrus.sprite_index == papyrus.dsprite) {
	        papyrus.sprite_index= papyrus.rsprite
	        dddd= instance_create(0, 0, 92/* obj_musfadeout */)
	        dddd.fadespeed= 0.05
	    }
	    $Alarm4.start((100) / 30.0)
	    conversation= 61
	}
	if(conversation == 62) conversation= 63
	if(conversation == 80 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(papyrus.x + 10, papyrus.y + 20, 946/* obj_spagnot */)
	    // obj_spagnot
	    with(946) scr_depth()
	    papyrus.sprite_index= papyrus.utsprite
	    $Alarm4.start((30) / 30.0)
	    conversation= 81
	}
	if(conversation == 82) {
	    sans.sprite_index= sans.usprite
	    papyrus.fun= 0
	    papyrus.sprite_index= papyrus.dsprite
	    papyrus.image_speed= 0.2
	    papyrus.velocity.y= 1
	    $Alarm4.start((10) / 30.0)
	    conversation= 55
	}
	if(conversation == 99 and not instance_exists(782/* OBJ_WRITER */))
	    conversation= 22
	if(conversation == 22) {
	    GS.interact= 1
	    GS.msc= 228
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.typer= 19
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 23
	}
	if(conversation == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.velocity.x= 5
	    papyrus.fun= 1
	    papyrus.sprite_index= papyrus.rsprite
	    papyrus.image_speed= 0.25
	    hhh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hhh.fadespeed= 0.05
	    $Alarm1.start((30) / 30.0)
	    conversation= 24
	}
	if(conversation == 63) {
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    GS.plot= 58
	    GS.interact= 0
	    instance_create(sans.x, sans.y, 1022/* obj_sans_room */)
	    with(sans) instance_destroy()
	    with(papyrus) instance_destroy()
	    instance_destroy()
	}
	if(conversation == 120 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 1
	    if(OBJ_WRITER.stringno == 2) {
	        obj_mainchara.visible= 0
	        mc.velocity.x= 3
	        mc.image_speed= 0.25
	    }
	    if(mc.x > mc.xstart + 90) {
	        mc.x= mc.xstart + 93
	        mc.image_speed= 0
	    }
	}
	if(conversation == 120 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 1
	    if(mc.x > mc.xstart + 90) {
	        mc.x= mc.xstart + 93
	        mc.image_speed= 0
	        obj_mainchara.x= mc.x
	        obj_mainchara.visible= 1
	        with(mc) instance_destroy()
	        GS.msc= 0
	        GS.msg[0]= "\\E3... ARE YOU&SERIOUS?/"
	        GS.msg[1]= "\\E1SANS!!^1!&HELP!!!/"
	        GS.msg[2]= "THEY KEEP WALKING&THROUGH MY PUZZLES!/"
	        GS.msg[3]= "\\E3THEY\'RE SUPPOSED&TO LET ME&EXPLAIN THEM./"
	        GS.msg[4]= "\\E0THEN THREATEN AND&BAFFLE THEM WITH&DANGEROUS JAPES./"
	        scr_sansface(5, 0)
	        GS.msg[6]= "* well^1, maybe they&  don\'t like japes./"
	        scr_papface(7, 4)
	        GS.msg[8]= "EVERYONE LIKES&JAPES!!!/"
	        scr_sansface(9, 0)
	        GS.msg[10]= "* what about undyne^1?&* doesn\'t she hate&  puzzles?/"
	        scr_papface(11, 0)
	        GS.msg[12]= "SHE HATES PUZZLES^1.&BUT SHE LOVES&JAPES./"
	        scr_sansface(13, 1)
	        GS.msg[14]= "* that makes sense./"
	        scr_papface(15, 1)
	        GS.msg[16]= "HUMAN!^1!&WHAT DO YOU&THINK!?/"
	        GS.msg[17]= "PUZZLES OR JAPES?/"
	        GS.msg[18]= ".../"
	        GS.msg[19]= "\\E3.../"
	        GS.msg[20]= "OKAY^1, THIS IS&NORMALLY THE&PART./"
	        GS.msg[21]= "WHERE YOU EITHER&AGREE OR DISAGREE./"
	        GS.msg[22]= "AND DEPENDING ON&YOUR ANSWER./"
	        GS.msg[23]= "\\E0WE SAY SOMETHING&GREAT IN RESPONSE./"
	        GS.msg[24]= "\\E3.../"
	        GS.msg[25]= "\\E0HERE^1, WHY DON\'T&YOU DO THIS&PUZZLE YOURSELF./%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        conversation= 80
	    }
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
