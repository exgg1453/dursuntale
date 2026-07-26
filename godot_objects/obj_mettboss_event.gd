# Auto-converted from GameMaker: obj_mettboss_event
extends Node2D

func _ready():
	tile_layer_hide(999995)
	GS.flag[15]= 0
	if(GS.plot > 197) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.plot == 193) {
	        instance_create(0, 0, 1248/* obj_mettdestroyed_event */)
	        instance_destroy()
	        exit
	    } else  {
	        murder= 0
	        if(scr_murderlv() >= 12) murder= 1
	        GS.flag[20]= 6
	        con= 0
	        mett= instance_create(146, 705, 1172/* obj_mettaton_actor */)
	        mett.image_speed= 0
	        bl= 0
	        drawblack= 0
	        bly= 0
	        skip= 0
	        sixty= scr_marker(60, 680, 1964)
	        sixty.z_index= 999995
	        sixty.modulate.a= 0
	        sixtyflash= 0
	        sixtyon= 0
	        s_siner= 0
	        x_maroon= merge_color(0, 128, 0.35)
	        exit
	    }
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(obj_mainchara.y < 840 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    GS.facing= 2
	    obj_mainchara.image_speed= 0.334
	    obj_mainchara.velocity.y= -3
	    con= 1
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 2) {
	    obj_mainchara.velocity.y= 0
	    view_object[0]= -4
	    obj_mainchara.cutscene= 1
	    con= 3
	}
	if(con == 3) {
	    view_yview[0]-= 3
	    if(view_yview[0] <= 622) {
	        view_yview[0]= 620
	        con= 4
	    }
	}
	if(con == 4) {
	    ini_open("undertale.ini")
	    already= ini_read_real("Mettaton", "BossMet", 0)
	    ini_close()
	    con= 5
	    $Alarm4.start((15) / 30.0)
	    if(murder == 1) already= 0
	    if(already >= 1) {
	        con= 3.1
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 4.1) {
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 833
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 4.2
	}
	if(con == 4.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 4.4
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 5.4) {
	    mett.sprite_index= 1657/* spr_mettaton_silent_behind */
	    GS.flag[20]= 7
	    mett.image_speed= 0
	    mett.frame= 0
	    GS.typer= 27
	    GS.msc= 0
	    GS.msg[0]= "* REALLY^1?&* WHERE?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    skip= 1
	    con= 5.5
	}
	if(con == 5.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(-3)
	    snd_play(108/* snd_item */)
	    mett.frame= 1
	    con= 4.6
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 5.6 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* CLEVER..^1.&* VERY CLEVER./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 5.7
	    babytimer= 500
	}
	if(con == 5.7 and not instance_exists(782/* OBJ_WRITER */)) con= 19
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 27
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* OH YES.&* THERE YOU ARE, DARLING./"
	    GS.msg[1]= "* IT\'S TIME TO HAVE OUR&  LITTLE SHOWDOWN./"
	    GS.msg[2]= "* IT\'S TIME TO FINALLY STOP&  THE " + chr(ord('"')) + "MALFUNCTIONING" + chr(ord('"')) + " ROBOT./"
	    GS.msg[3]= "* ... NOT!!!/"
	    GS.msg[4]= "* MALFUNCTION?&* REPROGRAMMING?&* PLEASE./"
	    GS.msg[5]= "* THIS WAS ALL JUST A BIG&  SHOW./"
	    GS.msg[6]= "* AN ACT./"
	    GS.msg[7]= "* MY " + chr(ord('"')) + "MALFUNCTION" + chr(ord('"')) + " WAS ALL&  MADE UP BY DR. ALPHYS./"
	    GS.msg[8]= "* AS SHE WATCHED YOU ON THE&  SCREEN^1, SHE GREW ATTACHED&  TO YOUR ADVENTURE./"
	    GS.msg[9]= "* SHE DESPERATELY WANTED TO&  BE A PART OF IT./"
	    GS.msg[10]= "* SO SHE DECIDED TO INSERT&  HERSELF INTO YOUR STORY./"
	    GS.msg[11]= "* THIS SCENARIO, WHERE SHE&  " + chr(ord('"')) + "SAVES" + chr(ord('"')) + " YOU FROM ME, WAS&  HER CREATION./"
	    GS.msg[12]= "* EVEN NOW, SHE IS WAITING&  OUTSIDE THIS ROOM./"
	    GS.msg[13]= "* DURING OUR " + chr(ord('"')) + "BATTLE," + chr(ord('"')) + " SHE&  WILL INTERRUPT./"
	    GS.msg[14]= "* THEN SHE WILL PRETEND TO&  " + chr(ord('"')) + "DEACTIVATE" + chr(ord('"')) + " ME, " + chr(ord('"')) + "SAVING" + chr(ord('"')) + " YOU&  ONE FINAL TIME./"
	    GS.msg[15]= "* FINALLY.&* SHE\'LL BE THE HEROINE OF&  YOUR ADVENTURE./"
	    GS.msg[16]= "* FINALLY.&* SHE\'LL BE SOMEONE SOMEBODY&  ACTUALLY LIKES./"
	    GS.msg[17]= "* YOU\'LL REGARD HER SO HIGHLY&  SHE\'LL EVEN BE ABLE TO&  CONVINCE YOU NOT TO LEAVE./"
	    GS.msg[18]= "* ... OR NOT./"
	    GS.msg[19]= "* YOU SEE, I\'VE HAD ENOUGH OF&  THIS PREDICTABLE CHARADE./"
	    GS.msg[20]= "* I HAVE NO DESIRE TO HARM&  HUMANS.&* FAR FROM IT, ACTUALLY./"
	    GS.msg[21]= "* AS METTATON, MY ONLY DESIRE&  IS TO ENTERTAIN./"
	    GS.msg[22]= "* AFTER ALL, THE AUDIENCE&  DESERVES A GOOD SHOW,&  DON\'T THEY?/"
	    GS.msg[23]= "* AND WHAT\'S A GOOD SHOW.../"
	    GS.msg[24]= "* WITHOUT A PLOT TWIST?/%%"
	    GS.msg[0]= "* OH YES.&* THERE YOU ARE, DARLING./"
	    GS.msg[1]= "* IT\'S TIME TO HAVE OUR&  LITTLE SHOWDOWN./"
	    GS.msg[2]= "* IT\'S TIME TO FINALLY STOP&  THE " + chr(ord('"')) + "MALFUNCTIONING" + chr(ord('"')) + " ROBOT./"
	    GS.msg[3]= "* ... NOT!!!/"
	    GS.msg[4]= "* MALFUNCTION?&* REPROGRAMMING?&* GET REAL./"
	    GS.msg[5]= "* THIS WAS ALL JUST A BIG&  SHOW./"
	    GS.msg[6]= "* AN ACT./"
	    GS.msg[7]= "* ALPHYS HAS BEEN PLAYING&  YOU FOR A FOOL THE&  WHOLE TIME./"
	    GS.msg[8]= "* AS SHE WATCHED YOU ON THE&  SCREEN^1, SHE GREW ATTACHED&  TO YOUR ADVENTURE./"
	    GS.msg[9]= "* SHE DESPERATELY WANTED TO&  BE A PART OF IT./"
	    GS.msg[10]= "* SO SHE DECIDED TO INSERT&  HERSELF INTO YOUR STORY./"
	    GS.msg[11]= "* SHE REACTIVATED PUZZLES^1.&* SHE DISABLED ELEVATORS^1.&* SHE ENLISTED ME TO TORMENT YOU./"
	    GS.msg[12]= "* ALL SO SHE COULD SAVE&  YOU FROM DANGERS THAT&  DIDN\'T EXIST./"
	    GS.msg[13]= "* ALL SO YOU WOULD THINK&  SHE\'S THE GREAT PERSON.../"
	    GS.msg[14]= "* THAT SHE\'S NOT./"
	    GS.msg[15]= "* AND NOW^1, IT\'S TIME FOR&  HER FINEST HOUR./"
	    GS.msg[16]= "* AT THIS VERY MOMENT,&  ALPHYS IS WAITING OUTSIDE&  THE ROOM./"
	    GS.msg[17]= "* DURING OUR " + chr(ord('"')) + "BATTLE," + chr(ord('"')) + " SHE&  WILL INTERRUPT./"
	    GS.msg[18]= "* SHE WILL PRETEND TO&  " + chr(ord('"')) + "DEACTIVATE" + chr(ord('"')) + " ME, " + chr(ord('"')) + "SAVING" + chr(ord('"')) + " YOU&  ONE FINAL TIME./"
	    GS.msg[19]= "* FINALLY.&* SHE\'LL BE THE HEROINE OF&  YOUR ADVENTURE./"
	    GS.msg[20]= "* YOU\'LL REGARD HER SO HIGHLY&  SHE\'LL EVEN BE ABLE TO&  CONVINCE YOU NOT TO LEAVE./"
	    GS.msg[21]= "* ... OR NOT./"
	    GS.msg[22]= "* YOU SEE, I\'VE HAD ENOUGH OF&  THIS PREDICTABLE CHARADE./"
	    GS.msg[23]= "* I HAVE NO DESIRE TO HARM&  HUMANS.&* FAR FROM IT, ACTUALLY./"
	    GS.msg[24]= "* MY ONLY DESIRE IS TO&  ENTERTAIN./"
	    GS.msg[25]= "* AFTER ALL, THE AUDIENCE&  DESERVES A GOOD SHOW,&  DON\'T THEY?/"
	    GS.msg[26]= "* AND WHAT\'S A GOOD SHOW.../"
	    GS.msg[27]= "* WITHOUT A PLOT TWIST?/%%"
	    if(murder == 1) {
	        GS.msg[0]= "* MY^1, MY^1.&* SO YOU\'VE FINALLY ARRIVED./"
	        GS.msg[1]= "* AFTER OUR FIRST MEETING^1, I&  REALIZED..^1.&* SOMETHING GHASTLY./"
	        GS.msg[2]= "* YOU\'RE NOT JUST A THREAT&  TO MONSTERS..^1.&* BUT HUMANITY^1, AS WELL./"
	        GS.msg[3]= "* OH MY^1.&* THAT\'S AN ISSUE./"
	        GS.msg[4]= "* YOU SEE^1, I CAN\'T BE A&  STAR WITHOUT AN AUDIENCE./"
	        GS.msg[5]= "* AND BESIDES.../"
	        GS.msg[6]= "* THERE ARE SOME PEOPLE..^1.&* I WANT TO PROTECT./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 7
	    if(murder == 1) con= 30
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    mtsong2= caster_load("music/mettafly.ogg")
	    drawblack= 1
	    snd_play(21/* snd_impact */)
	    con= 8
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 9) {
	    snd_play(17/* snd_knock */)
	    con= 10
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 11) {
	    GS.typer= 47
	    GS.msc= 0
	    GS.facechoice= 6
	    GS.faceemotion= 3
	    GS.msg[0]= "* H-hey!!^1!&* Wh-wh-what\'s going on!?/"
	    GS.msg[1]= "* Th-th-the door just&  locked itself!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(13/* snd_spearappear */)
	    sixtyon= 1
	    sixtyflash= 1
	    GS.typer= 27
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.faceemotion= 3
	    mett.image_speed= 0.25
	    GS.msg[0]= "\\M1* SORRY^1, FOLKS^1!&* THE OLD PROGRAM\'S BEEN&  CANCELLED!!!/"
	    GS.msg[1]= "* BUT WE\'VE GOT A FINALE&  THAT WILL DRIVE YOU WILD!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 14
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    babytimer= 0
	    scr= instance_create(0, 0, 1251/* obj_scrollaway_event */)
	    scr.sixty= sixty
	    con= 15
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 16 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_play(mtsong2, 0.7, 1)
	    GS.msc= 0
	    GS.typer= 27
	    GS.msg[0]= "\\M5* REAL DRAMA!!&* REAL ACTION!!&* REAL BLOODSHED!!/"
	    GS.msg[1]= "* ON OUR NEW SHOW.../"
	    GS.msg[2]= "* " + chr(ord('"')) + "ATTACK OF THE KILLER&  ROBOT!" + chr(ord('"')) + "/%%"
	    ss= instance_create(0, 0, 779/* obj_dialoguer */)
	    ss.side= 0
	    con= 17
	}
	if(con > 14 and murder == 0) babytimer++
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */) and babytimer > 300) {
	    snd_play(30/* snd_break2 */)
	    con= 18
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 19) {
	    GS.mercy= 1
	    GS.battlegroup= 80
	    if(skip == 1) GS.battlegroup= 81
	    GS.flag[15]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 20
	    $Alarm4.start((33) / 30.0)
	}
	if(con == 21) {
	    GS.mercy= 0
	    GS.border= 0
	    SCR_BORDERSETUP()
	    // obj_scrollaway_event
	    with(1251) con= 6
	    with(mett) instance_destroy()
	    view_yview[0]-= 60
	    instance_create(0, 0, 1248/* obj_mettdestroyed_event */)
	    instance_destroy()
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.visible= 0
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1044)
	    with(mc) frame= 1
	    with(mc) velocity.y= -0.5
	    con= 31
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 32) {
	    with(mc) frame= 0
	    with(mc) velocity.y= 0
	    con= 33
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 34) {
	    GS.msg[0]= "* AH HA HA^1.&* EAGER, AS ALWAYS, EH?/"
	    GS.msg[1]= "* BUT DON\'T TOUCH THAT DIAL.&* THERE\'S SOMETHING YOU&  HAVEN\'T ACCOUNTED FOR./"
	    GS.msg[2]= "* AS ANY TRUE FAN WOULD KNOW,&  I WAS FIRST CREATED AS&  A HUMAN ERADICATION ROBOT./"
	    GS.msg[3]= "* IT WAS ONLY AFTER BECOMING A&  STAR THAT I WAS GIVEN A&  MORE... PHOTOGENIC BODY./"
	    GS.msg[4]= "* HOWEVER./"
	    GS.msg[5]= "* THOSE ORIGINAL FUNCTIONS&  HAVE NEVER BEEN FULLY&  REMOVED.../"
	    GS.msg[6]= "* COME ANY CLOSER, AND&  I\'LL BE FORCED TO SHOW&  YOU.../"
	    GS.msg[7]= "\\M5* MY TRUE FORM!/%%"
	    con= 35
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mc) frame= 1
	    with(mc) velocity.y= -0.5
	    con= 36
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 37) {
	    with(mc) frame= 0
	    with(mc) velocity.y= 0
	    con= 38
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 39) {
	    GS.msg[0]= "\\M0* FINE THEN!/"
	    GS.msg[1]= "\\M5* RRRRREADY^1?&* IIIIIIIT\'S SHOWTIME!!!/%%"
	    con= 40
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    shkwv= caster_load("music/f_destroyed2.ogg")
	    pt= 0
	    vl= 0.5
	    caster_loop(shkwv, vl, pt)
	    con= 49
	    $Alarm4.start((110) / 30.0)
	    brt= scr_marker(-10, -10, 999)
	    brt.scale.x= 800
	    brt.scale.y= 800
	    brt.modulate.a= 0
	    br= 0
	}
	if(con == 49) {
	    br+= 0.02
	    brt.modulate.a= br
	    pt+= 0.02
	    vl+= 0.01
	    vol= vl
	    if(vl > 1) vol= 2 - vl
	    caster_set_pitch(shkwv, pt)
	    caster_set_volume(shkwv, vol)
	}
	if(con == 50 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(brt) instance_destroy()
	    caster_free(shkwv)
	    GS.mercy= 1
	    GS.battlegroup= 94
	    GS.flag[15]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 51
	    $Alarm4.start((33) / 30.0)
	}
	if(con == 52) {
	    with(mett) visible= 0
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    obj_mainchara.visible= 1
	    with(sixty) instance_destroy()
	    with(mc) instance_destroy()
	    // obj_npc_marker
	    with(1363) instance_destroy()
	    GS.interact= 0
	    con= 43
	    GS.plot= 199
	    caster_free(-3)
	    instance_destroy()
	    exit
	} else  {
	    if(is_instance_valid(sixty)) {
	        if(sixtyon == 1 and sixty.modulate.a < 1)
	            sixty.modulate.a+= 0.05
	        if(sixtyflash == 1) {
	            s_siner++
	            sixty.image_blend= merge_color(16777215, 8421504, abs(sin(s_siner / 6) / 2))
	        }
	    }
	    exit
	}

func _on_outside_room():
	if(drawblack == 1) {
	    if(bl < 20) bl+= 4
	    if(bl > 20) {
	        bl= 20
	        snd_play(106/* snd_noise */)
	    }
	    draw_set_color(x_maroon)
	    draw_rectangle(140 + bl, 840 + bly, 140, 880, 0)
	    draw_rectangle(180 - bl, 840 + bly, 180, 880, 0)
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
