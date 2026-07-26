# Auto-converted from GameMaker: obj_asgoremeet_event
extends Node2D

func _ready():
	con= 0
	scale.x= 2
	if(GS.plot > 205) instance_destroy()
	else  asg= instance_create(130, 300, 1322/* obj_asgore_actor */)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    con= 2
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 2) GS.facing= 2
	if(con == 3) {
	    obj_mainchara.velocity.y= -1
	    obj_mainchara.image_speed= 0.1
	    con= 4
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 5) {
	    obj_mainchara.image_speed= 0
	    obj_mainchara.velocity.y= 0
	    con= 6
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 7) {
	    remy= view_yview[0]
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    con= 8
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 8) view_yview[0]--
	if(con == 9) {
	    con= 10
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 11) {
	    GS.facechoice= 0
	    GS.typer= 60
	    GS.msc= 0
	    GS.msg[0]= "* Dum dee dum.../"
	    GS.msg[1]= "* Oh^1?&* Is someone there?/"
	    GS.msg[2]= "* Just a moment!/"
	    GS.msg[3]= "* I have almost finished watering&  these flowers./%%"
	    con= 12
	    if(scr_murderlv() >= 16) {
	        GS.msg[0]= "* Curious^1.&* I\'ve never seen a plant..^1.&* Cry before./%%"
	        con= 99
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.image_speed= 0.2
	    con= 13
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 14) {
	    asg.image_speed= 0
	    asg.frame= 0
	    con= 15
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 16) {
	    GS.msg[0]= "* ... Here we are!/%%"
	    con= 17
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 18
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 19) {
	    asg.sprite_index= asg.rsprite
	    con= 20
	    $Alarm4.start((35) / 30.0)
	}
	if(con == 21) {
	    asg.sprite_index= asg.dtsprite
	    con= 22
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 23) {
	    GS.facechoice= 7
	    GS.msc= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Howdy^1!&* How can I.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 24
	}
	if(con == 24 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 24.1
	    caster_free(-3)
	    // obj_birbnoise
	    with(88) instance_destroy()
	    GS.currentsong= caster_load("music/smallshock.ogg")
	    $Alarm4.start((15) / 30.0)
	    asg.sprite_index= 1906/* spr_asgore_d_shock */
	    asg.velocity.y= -1
	    asg.image_speed= 0.2
	}
	if(con == 25.1) {
	    asg.velocity.y= 0
	    asg.frame= 0
	    asg.image_speed= 0
	    con= 25
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 26) {
	    asg.sprite_index= 1910/* spr_asgore_dt_shock */
	    caster_loop(GS.currentsong, 1, 1)
	    GS.faceemotion= 1
	    GS.msg[0]= "* Oh./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 27
	}
	if(con == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.sprite_index= asg.rsprite
	    con= 28
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 29) {
	    asg.sprite_index= asg.dtsprite
	    con= 30
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 31) {
	    asg.sprite_index= asg.dtsprite
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3* .../"
	    GS.msg[1]= "\\E2* I so badly want to&  say^1, " + chr(ord('"')) + "would you like&  a cup of tea?" + chr(ord('"')) + "/"
	    GS.msg[2]= "* But.../"
	    GS.msg[3]= "\\E3* You know how it is./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 32
	}
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 33
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 34) {
	    asg.sprite_index= asg.lsprite
	    asg.image_speed= 0.2
	    asg.velocity.x= -1
	    $Alarm4.start((80) / 30.0)
	    con= 35
	}
	if(con == 36) {
	    asg.velocity.x= 0
	    asg.image_speed= 0
	    con= 37
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 38) {
	    asg.sprite_index= asg.dtsprite
	    asg.frame= 0
	    con= 39
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 40) {
	    GS.faceemotion= 0
	    GS.msg[0]= "* Nice day today^1, huh?/"
	    GS.msg[1]= "* Birds are singing^1,&  flowers are blooming.../"
	    GS.msg[2]= "* Perfect weather for a&  game of catch./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 41
	}
	if(con == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.sprite_index= asg.lsprite
	    con= 42
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 43) {
	    asg.sprite_index= 1911/* spr_asgore_dt_sad */
	    con= 44
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 45) {
	    GS.faceemotion= 3
	    GS.msg[0]= "* .../"
	    GS.msg[1]= "* You know what we must&  do./"
	    GS.msg[2]= "* When you are ready^1,&  come into the next&  room./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 46
	}
	if(con == 46 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.sprite_index= asg.usprite
	    asg.image_speed= 0.25
	    asg.velocity.y= -2
	    con= 47
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 48) {
	    if(view_yview[0] < remy)
	        view_yview[0]+= 2
	    else  {
	        view_yview[0]= remy
	        obj_mainchara.cutscene= 0
	        view_object[0]= 1570
	        GS.interact= 0
	        with(asg) instance_destroy()
	        instance_destroy()
	        GS.plot= 206
	        con= 49
	    }
	}
	if(con == 99 and not instance_exists(782/* OBJ_WRITER */)) {
	    asg.sprite_index= asg.rtsprite
	    con= 100
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 101) {
	    asg.sprite_index= asg.dtsprite
	    con= 102
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 103) {
	    GS.facechoice= 7
	    GS.msc= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E3* ... huh?/"
	    GS.msg[1]= "* You must be the one&  that flower just warned&  me about./"
	    GS.msg[2]= "\\E0* Howdy!/"
	    GS.msg[3]= "* .../"
	    GS.msg[4]= "\\E3* Erm..^1.&* What kind of monster&  are you...?/"
	    GS.msg[5]= "\\E0* Sorry^1, I cannot tell./"
	    GS.msg[6]= "* Well^1, we can always%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 111
	}
	if(con == 111 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 100
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 112
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    GS.facing= 2
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
