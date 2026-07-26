# Auto-converted from GameMaker: obj_dummytrigger
extends CharacterBody2D

func _ready():
	if(GS.plot > 115) instance_destroy()
	con= 0
	touched= 0
	scale.x= 100
	murder= 0
	if(scr_murderlv() >= 9 and GS.flag[27] == 0) murder= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    caster_pause(GS.currentsong)
	    con= 2
	    curview= view_yview[0]
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 3) {
	    GS.facing= 0
	    view_yview[0]++
	    if(view_yview[0] > curview + 60) con= 4
	}
	if(con == 4) {
	    con= 4.1
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 5.1) {
	    con= 4.2
	    rememberxview= view_xview[view_current]
	    rememberyview= view_yview[view_current]
	    xdiff= 130
	    ydiff= 192 - view_yview[view_current]
	    view_object[view_current]= -4
	    $Alarm4.start((12) / 30.0)
	}
	if(con == 4.2) {
	    if(view_xview[0] < 130)
	        view_xview[0]+= xdiff / 10
	    if(view_xview[0] > 130) view_xview[0]= 130
	    if(view_yview[0] < 192)
	        view_yview[0]+= ydiff / 10
	    if(view_yview[0] > 192) view_yview[0]= 192
	    if(view_hview[0] > 120) view_hview[0]-= 12
	    if(view_hview[0] < 120) view_hview[0]= 120
	    if(view_wview[0] > 160) view_wview[0]-= 16
	    if(view_wview[0] < 160) view_wview[0]= 160
	}
	if(con == 5.2) {
	    con= 5
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 6) {
	    dummy.sprite_index= 1574/* spr_dummymad */
	    caster_play(shock, 1, 0.8)
	    con= 6.3
	    remx= dummy.x
	    remy= dummy.y
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 6.2) {
	    dummy.x= remx - 2 + random(4)
	    dummy.y= remy - 2 + random(4)
	}
	if(con == 7.1) {
	    $Alarm4.start((30) / 30.0)
	    con= 6.2
	}
	if(con == 7.2) {
	    with(dummy) event_user(1)
	    con= 7
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 7.3) {
	    con= 6.4
	    $Alarm4.start((14) / 30.0)
	}
	if(con == 6.4) {
	    if(view_xview[view_current] > 0)
	        view_xview[view_current]-= xdiff / 10
	    if(view_xview[0] < 0) view_xview[0]= 0
	    if(view_yview[view_current] > rememberyview)
	        view_yview[view_current]-= ydiff / 10
	    if(view_yview[0] < rememberyview)
	        view_yview[0]= rememberyview
	    if(view_hview[view_current] < 240)
	        view_hview[view_current]+= 12
	    if(view_hview[0] > 240) view_hview[0]= 240
	    if(view_wview[view_current] < 320)
	        view_wview[view_current]+= 16
	    if(view_wview[0] > 320) view_wview[0]= 320
	}
	if(con == 7.4) {
	    view_object[view_current]= 1570
	    con= 6.2
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 8) {
	    view_yview[0]-= 6
	    if(view_yview[0] <= curview - 20) {
	        con= 7.5
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 8.5) {
	    GS.facing= 2
	    dummy.x= 180
	    dummy.y= 80
	    with(dummy) {
	        event_user(0)
	        event_user(1)
	    }
	    con= 7.6
	    $Alarm4.start((16) / 30.0)
	}
	if(con == 8.6) con= 9
	if(con == 9) {
	    GS.facing= 2
	    dummy.velocity.y= 0
	    con= 10
	    caster_loop(predummy, 0.8, 1)
	    if(GS.flag[355] == 0)
	        GS.msg[0]= "* Hahaha..^1.&* It\'s just like you to&  run away./"
	    if(GS.flag[355] == 1)
	        GS.msg[0]= "* FOOL^1!&* You think you can hurt&  ME???/"
	    if(GS.flag[355] == 2)
	        GS.msg[0]= "* Hahaha..^1.&* Too intimidated to fight&  me^1, huh!?/"
	    GS.msg[1]= "* I am a ghost that lives&  inside a DUMMY./"
	    GS.msg[2]= "* My cousin used to live&  inside a DUMMY^1, too^1.&* Until.../"
	    if(GS.flag[14] == 0) {
	        GS.msg[3]= "* YOU CAME ALONG!/"
	        GS.msg[4]= "* They were a shy sort^1.&* Living a lonely life in&  the RUINS.../"
	        GS.msg[5]= "* They saw you and hoped you&  might TALK to them./"
	        GS.msg[6]= "* Perhaps strike up a&  friendly conversation./"
	        GS.msg[7]= "* But NO!!!/"
	        GS.msg[8]= "* You ran away..^1.&* And broke their little&  ethereal heart./"
	        GS.msg[9]= "* Despicable^1.&* Despicable^1!&* DESPICABLE!/"
	        GS.msg[10]= "* HUMAN^1!&* I\'ll show you what REAL&  heartbreak is!/%%"
	    }
	    if(GS.flag[14] == 1) {
	        GS.msg[3]= "* YOU DESTROYED THEIR HOME!/"
	        GS.msg[4]= "* Us ghosts spend our whole&  lives looking for a&  proper vessel./"
	        GS.msg[5]= "* Slowly^1, slowly^1, we grow&  closer to our new&  bodies.../"
	        GS.msg[6]= "* Until one day^1, we too&  may become corporeal&  beings./"
	        GS.msg[7]= "* Beings able to laugh^1,&  love^1, and dance like&  any other.../"
	        GS.msg[8]= "* But YOU!!!^1!&* My cousin\'s future...^1!&* You took it all away!/"
	        GS.msg[9]= "* Despicable^1.&* Despicable^1!&* DESPICABLE!/"
	        GS.msg[10]= "* HUMAN^1!&* I hope you\'re not too&  attached to YOUR body.../"
	        GS.msg[11]= "* Because your SOUL\'s about&  to get EVICTED!!!/%%"
	    }
	    if(GS.flag[14] == 2) {
	        GS.msg[3]= "* YOU CAME ALONG!/"
	        GS.msg[4]= "* When you talked to them^1,&  they thought they were&  in for a nice chat.../"
	        GS.msg[5]= "* But the things you&  SAID...!/"
	        GS.msg[6]= "* Horrible^1.&* Shocking^1!&* UNBELIEVABLE!/"
	        GS.msg[7]= "* It spooked them right&  out of their dummy!/"
	        GS.msg[8]= "* HUMAN^1!&* I\'ll scare your SOUL&  out of your body!/%%"
	    }
	    if(GS.flag[14] == 3) {
	        GS.msg[3]= "* YOU...!/"
	        GS.msg[4]= "* You.../"
	        GS.msg[5]= "* Shucks^1!&* You were really boring!/"
	        GS.msg[6]= "* They got annoyed and flew&  away like any self-&  respecting spectre./"
	        GS.msg[7]= "* Well then^1.&* Well then!&* WELL THEN!/"
	        GS.msg[8]= "* Boring people are crumbs&  sticking to the face&  of this world./"
	        GS.msg[9]= "* Human!/"
	        GS.msg[10]= "* I\'ll wipe you away with&  the dainty handkerchief&  of vengeance!/%%"
	    }
	    if(murder == 1) {
	        if(GS.flag[355] == 0)
	            GS.msg[0]= "* Hahaha..^1.&* It\'s just like you to&  run away./"
	        if(GS.flag[355] == 1)
	            GS.msg[0]= "* FOOL^1!&* You think you can hurt&  ME???/"
	        if(GS.flag[355] == 2)
	            GS.msg[0]= "* Hahaha..^1.&* Too intimidated to fight&  me^1, huh!?/"
	        GS.msg[1]= "* I am a ghost that lives&  inside a DUMMY./"
	        GS.msg[2]= "* My cousin used to live&  inside a DUMMY^1, too^1.&* Until.../"
	        GS.msg[3]= "* YOU CAME ALONG!/"
	        GS.msg[4]= "* Not only did YOUR actions&  cause them to leave their&  home.../"
	        GS.msg[5]= "* But now all of their neighbors&  are gone^1, too!/"
	        GS.msg[6]= "* Despicable^1.&* Despicable^1!&* DESPICABLE!!!/"
	        GS.msg[7]= "* You\'re the worst person I\'ve&  ever met^1!&* I\'ve NEVER been more mad!!!/"
	        GS.msg[8]= "* Guooooohhhh!!!^1!&* My mannequin levels are&  going OFF THE CHARTS!!!/%%"
	        con= 30
	    }
	    scr_regulartext()
	    if(instance_exists(779/* obj_dialoguer */)) obj_dialoguer.side= 1
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(shock)
	    caster_free(predummy)
	    snd_play(30/* snd_break2 */)
	    dummy.sprite_index= 1577/* spr_dummymad_toot */
	    dummy.frame= 0
	    dummy.image_speed= 0.45
	    con= 11
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 12) {
	    con= 13
	    GS.battlegroup= 45
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 14) {
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 1
	    if(GS.interact == 0) GS.interact= 1
	    dummy.sprite_index= 1128/* spr_napstablook_d */
	    con= 15
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 15) {
	    GS.mercy= 0
	    if(GS.interact == 0) GS.interact= 1
	}
	if(con == 16) {
	    GS.border= 0
	    GS.msg[0]= "* well..^1.&* i\'m going to head home&  now.../"
	    GS.msg[1]= "* oh..^1. umm..^1.&* feel free to " + chr(ord('"')) + "come&  with" + chr(ord('"')) + " if you want.../"
	    GS.msg[2]= "* but no pressure.../"
	    GS.msg[3]= "* i understand if you\'re&  busy.../"
	    GS.msg[4]= "* it\'s fine.../"
	    GS.msg[5]= "* no worries.../"
	    GS.msg[6]= "* just thought i\'d&  offer.../%%"
	    if(GS.flag[36] == 0) {
	        GS.msg[0]= "* well..^1.&* i\'m going to head home&  now.../"
	        GS.msg[1]= "* just warning you.../"
	        GS.msg[2]= "* so you don\'t accidentally&  follow me to my&  house.../"
	        GS.msg[3]= "* you probably wouldn\'t&  like that.../%%"
	    }
	    scr_regulartext()
	    if(instance_exists(779/* obj_dialoguer */)) obj_dialoguer.side= 1
	    GS.plot= 116
	    greg= 1
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    dummy.velocity.y= -3
	    if(greg > 0) greg-= 0.04
	    if(dummy.modulate.a == greg) solid= 0
	    con= 18
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 19) {
	    with(dummy) instance_destroy()
	    instance_destroy()
	}
	if(con == 30) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        if(OBJ_WRITER.stringno == 7) {
	            dummy.sprite_index= 1577/* spr_dummymad_toot */
	            dummy.frame= 0
	            dummy.image_speed= 0.45
	        }
	    } else  {
	        caster_free(-3)
	        snd_play(30/* snd_break2 */)
	        instance_create(0, 0, 118/* obj_flasher */)
	        con= 31
	        $Alarm4.start((2) / 30.0)
	    }
	}
	if(con == 32) {
	    with(dummy) sprite_index= 1575/* spr_dummysurprise */
	    con= 33
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 34) {
	    GS.msc= 0
	    GS.msg[0]= "* ...?/"
	    GS.msg[1]= "* This..^1.&* This feeling...?/%%"
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 1
	    con= 35
	}
	if(con == 35 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(dummy) sprite_index= 1576/* spr_dummyglad */
	    GS.msg[0]= "* Eureka^1.&* Eureka^1!&* EUREKA!/"
	    GS.msg[1]= "* Human^1.&* That moment of unbridled&  emotion./"
	    GS.msg[2]= "* It allowed me to finally&  fuse with my body!/"
	    GS.msg[3]= "* I\'m fully corporeal now^1!&* My lifelong dream^1, realized!/"
	    GS.msg[4]= "* In return^1, I guess I&  won\'t stomp you./"
	    GS.msg[5]= "* How\'s that sound?/%%"
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 1
	    con= 36
	}
	if(con == 36 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 37
	    GS.battlegroup= 93
	    GS.flag[200]= 204
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 38) {
	    with(dummy) instance_destroy()
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 1
	    if(GS.interact == 0) GS.interact= 1
	    con= 39
	    $Alarm4.start((4) / 30.0)
	}
	if(con == 40) {
	    GS.mercy= 0
	    GS.plot= 117
	    GS.interact= 0
	    instance_destroy()
	    con= 41
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
	    shock= caster_load("music/dununnn.ogg")
	    predummy= caster_load("music/predummy.ogg")
	    dummy= 1055
	    obj_mainchara.cutscene= 1
	    curview= view_yview[0]
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
