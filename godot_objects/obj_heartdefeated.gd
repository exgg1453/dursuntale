# Auto-converted from GameMaker: obj_heartdefeated
extends Node2D

func _ready():
	$Alarm0.start((20) / 30.0)
	image_speed= 0
	if(GS.flag[500] == 0) {
	    if(GS.flag[272] == 0)
	        gameoversong= caster_load("music/gameover.ogg")
	    if(GS.flag[272] == 1)
	        gameoversong= caster_load("music/dogsong.ogg")
	}
	dingus= 0
	currentvol= 1
	heartcon= 0
	hearttimer= 0
	if(GS.flag[500] == 1) {
	    GS.flag[502]++
	    GS.border= 0
	    dingus= 0
	}

func _gm_event_2_4():
	caster_stop(-3)
	caster_free(-3)
	instance_create(0, 0, 148/* obj_persistentfader */)
	obj_gameover.unpersist= 1

func _gm_event_2_3():
	iniwrite= ini_open("undertale.ini")
	gs= ini_read_real("General", "Gameover", 0)
	ini_write_real("General", "Gameover", gs + 1)
	ini_close()
	if(gs == 0) {
	    GS.typer= 30
	    GS.msg[0]= "  You cannot give&  up just yet.../"
	    GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	}
	if(gs > 0 and GS.kills == 0) {
	    GS.typer= 32
	    gg= floor(random(8))
	    if(gg == 0) {
	        GS.msg[0]= "  " + GS.charname + ", this is just&  a bad dream.../"
	        GS.msg[1]= "  Wake up^1!&  It\'s not over!/%%"
	    }
	    if(gg == 1) {
	        GS.msg[0]= "  " + GS.charname + "! It\'s like&  he says.../"
	        GS.msg[1]= "  You have to&  stay determined.../%%"
	    }
	    if(gg == 2) {
	        GS.msg[0]= "  " + GS.charname + "! Please&  don\'t give up.../"
	        GS.msg[1]= "  Have some&  determination.../%%"
	    }
	    if(gg == 3) {
	        GS.msg[0]= "  " + GS.charname + "! You\'re&  " + GS.charname + "!/"
	        GS.msg[1]= "  You can\'t quit^1!&  Stay determined.../%%"
	    }
	    if(gg == 4) {
	        GS.msg[0]= "  " + GS.charname + ", is this&  a kind of joke?/"
	        GS.msg[1]= "  Cut it out^1!&  Wake up!/%%"
	    }
	    if(gg == 5) {
	        GS.msg[0]= "  " + GS.charname + ", it\'s not&  time to leave!/"
	        GS.msg[1]= "  Hold on!/%%"
	    }
	    if(gg == 6) {
	        GS.msg[0]= "  " + GS.charname + ", gather&  your strength./"
	        GS.msg[1]= "  Stay determined!/%%"
	    }
	    if(gg == 7) {
	        GS.msg[0]= "  " + GS.charname + ", you have&  to keep going./"
	        GS.msg[1]= "  Stay determined!/%%"
	    }
	}
	if(gs > 0) {
	    GS.typer= 30
	    gg= floor(random(5))
	    if(gg == 0) {
	        GS.msg[0]= "  You cannot give&  up just yet.../"
	        GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	    }
	    if(gg == 1) {
	        GS.msg[0]= "  Our fate rests &  upon you.../"
	        GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	    }
	    if(gg == 2) {
	        GS.msg[0]= "  You\'re going to&  be alright!/"
	        GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	    }
	    if(gg == 3) {
	        GS.msg[0]= "  Don\'t lose hope!/"
	        GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	    }
	    if(gg == 4) {
	        GS.msg[0]= "  It cannot end&  now!/"
	        GS.msg[1]= "  " + GS.charname + "^1!&  Stay determined.../%%"
	    }
	}
	if(GS.flag[272] == 1) {
	    GS.typer= 110
	    GS.msg[0]= "  geeettttttt&  dunked on!!!/"
	    GS.msg[1]= "  if we\'re really&  friends.../"
	    GS.msg[2]= "  you won\'t come back./%%"
	}
	dingus= 1
	script_execute(150/* SCR_TEXTTYPE */, GS.typer)
	GS.msc= 0
	instance_create(100, 300, 782/* OBJ_WRITER */)

func _gm_event_2_2():
	if(GS.flag[272] == 0) caster_loop(gameoversong, 1, 1)
	if(GS.flag[272] == 1) caster_loop(gameoversong, 0.9, 1.25)
	instance_create(0, 0, 180/* obj_gameoverbg */)
	$Alarm3.start((80) / 30.0)

func _gm_event_2_1():
	snd_play(30/* snd_break2 */)
	visible= 0
	instance_create(x - 2, y, 746/* obj_heartshard */)
	instance_create(x, y + 3, 746/* obj_heartshard */)
	instance_create(x + 2, y + 6, 746/* obj_heartshard */)
	instance_create(x + 8, y, 746/* obj_heartshard */)
	instance_create(x + 10, y + 3, 746/* obj_heartshard */)
	instance_create(x + 12, y + 6, 746/* obj_heartshard */)
	$Alarm2.start((50) / 30.0)

func _on_destroy():
	$Alarm1.start((40) / 30.0)
	snd_play(31/* snd_break1 */)
	sprite_index= 44/* spr_heartbreak */
	x-= 2
	if(GS.flag[500] == 1) {
	    $Alarm1.start((-1) / 30.0)
	    heartcon= 5
	    thisx= x
	    thisy= y
	}

func _process(delta: float):
	if(dingus == 2) {
	    currentvol-= 0.02
	    caster_set_volume(gameoversong, currentvol)
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */)) event_user(0)
	if(heartcon == 5) {
	    hearttimer++
	    if(GS.flag[502] < 2) {
	        if(hearttimer > 80 and hearttimer < 120) {
	            x= thisx + random(3) - random(3)
	            y= thisy + random(3) - random(3)
	        }
	        if(hearttimer == 120) {
	            x= thisx + 2
	            y= thisy
	            snd_play(31/* snd_break1 */)
	            sprite_index= 34/* spr_heart */
	        }
	        if(hearttimer == 150) {
	            GS.typer= 61
	            GS.msc= 0
	            GS.msg[0]= "* But it refused^5.%%"
	            instance_create(160, 100, 782/* OBJ_WRITER */)
	        }
	        if(hearttimer == 220) instance_create(0, 0, 557/* obj_screenwhiter */)
	        if(hearttimer == 254) {
	            GS.border= 0
	            GS.hp= GS.maxhp
	            caster_free(-3)
	            // obj_gameover
	            with(153) instance_destroy()
	            get_tree().change_scene_to_file("res://godot_rooms/306.tscn")
	        }
	    } else  {
	        if(hearttimer > 20 and hearttimer < 40) {
	            x= thisx + random(3) - random(3)
	            y= thisy + random(3) - random(3)
	        }
	        if(hearttimer == 40) {
	            x= thisx + 2
	            y= thisy
	            snd_play(31/* snd_break1 */)
	            sprite_index= 34/* spr_heart */
	        }
	        if(hearttimer == 60) instance_create(0, 0, 557/* obj_screenwhiter */)
	        if(hearttimer == 94) {
	            GS.border= 0
	            GS.hp= GS.maxhp
	            caster_free(-3)
	            // obj_gameover
	            with(153) instance_destroy()
	            get_tree().change_scene_to_file("res://godot_rooms/306.tscn")
	        }
	    }
	}

func _gm_event_7_10():
	if(dingus == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    dingus= 2
	    unfader= instance_create(0, 0, 149/* obj_unfader */)
	    unfader.tspeed= 0.03
	    $Alarm4.start((60) / 30.0)
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
