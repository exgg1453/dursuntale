# Auto-converted from GameMaker: obj_onionsan_event
extends Node2D

func _ready():
	if(scr_murderlv() >= 8) GS.flag[496]= -1
	GS.flag[20]= 0
	onion= instance_create(100, 62, 1077/* obj_onionbody */)
	tents= 0
	con= 0
	once= 0
	if(GS.flag[496] >= 1 and GS.flag[496] <= 7) con= 7

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(GS.flag[496] == 0) {
	        if(obj_mainchara.x > 100 and tents == 0) {
	            tent1= instance_create(obj_mainchara.x, 70, 1078/* obj_oniont */)
	            tent1.follow= 1
	            tent1.type= 0
	            tents= 1
	            tent1.on= 2
	            snd_play(22/* snd_splash */)
	        }
	        if(obj_mainchara.x > 210 and tents == 1) {
	            tent2= instance_create(obj_mainchara.x, 220, 1078/* obj_oniont */)
	            tent2.follow= 1
	            tent2.type= 1
	            tent2.on= 2
	            tents= 2
	            snd_play(22/* snd_splash */)
	        }
	        if(obj_mainchara.x > 420 and tents == 2 and GS.interact == 0) {
	            GS.facing= 0
	            tents= 3
	            con= 1
	            $Alarm4.start((90) / 30.0)
	            GS.interact= 1
	            with(tent1) on= 4
	            with(tent2) on= 4
	            GS.flag[496]= 1
	            snd_play(22/* snd_splash */)
	        }
	    }
	    if(con == 2) {
	        // obj_oniont
	        with(1078) instance_destroy()
	        GS.flag[20]= 0
	        with(onion) {
	            x= obj_mainchara.x + 10
	            follow= 0
	            velocity.x= 0
	        }
	        with(onion) on= 1
	        con= 3
	        $Alarm4.start((50) / 30.0)
	    }
	    if(con == 4) {
	        GS.facing= 2
	        with(onion) on= 2
	        // obj_oniont
	        with(1078) on= 2
	        con= 5
	        $Alarm4.start((150) / 30.0)
	    }
	    if(con == 6) {
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "* Hey..^1. there..^1.&* Noticed you were..^1.&* Here.../"
	        GS.msg[1]= "\\M1* I\'m Onionsan^1!&* Onionsan^1, y\'hear!/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 7
	    }
	    if(con == 7 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1) {
	        // obj_oniont
	        with(1078) on= 4
	    }
	    if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        onion.follow= 1
	        onion.on= 2
	        con= 8
	    }
	    if(GS.flag[496] == 1 and obj_mainchara.x > 550 and GS.interact == 0) {
	        GS.flag[496]= 2
	        GS.interact= 1
	        con= 11
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "\\M1* You\'re visiting Waterfall^1, huh^1!* It\'s great here^1, huh^1!&* You love it^1, huh!/"
	        GS.msg[1]= "\\M0* Yeah^1!&* Me too^1!&* It\'s my Big Favorite./%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(GS.flag[496] == 2 and obj_mainchara.x > 700 and GS.interact == 0) {
	        GS.flag[496]= 3
	        GS.interact= 1
	        con= 11
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "\\M3* Even though^1, the water\'s&  getting so shallow here..^1./"
	        GS.msg[1]= "* I^1, have to sit down all&  the time^1, but.../"
	        GS.msg[2]= "\\M1* He^1-hey^1! That\'s OK^1!&* It beats moving to the city!/"
	        GS.msg[3]= "* And living in a crowded&  aquarium!/"
	        GS.msg[4]= "\\M2* Like all my friends did!/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(GS.flag[496] == 3 and obj_mainchara.x > 850 and GS.interact == 0) {
	        GS.flag[496]= 4
	        GS.interact= 1
	        con= 11
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "\\M3* And the aquarium\'s full^1,&  a-anyway^1, so^1, even if I&  wanted to^1, I.../"
	        GS.msg[1]= "\\M1* That\'s okay though^1, y\'hear!&* Undyne\'s gonna fix&  everything^1, y\'hear!/"
	        GS.msg[2]= "* I\'m gonna get out of here&  and live in the ocean^1!&* Y\'hear!/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(GS.flag[496] == 4 and obj_mainchara.x > 1000 and GS.interact == 0) {
	        GS.flag[496]= 5
	        GS.interact= 1
	        con= 15
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "\\M2* Hey..^1. there..^1.&* That\'s the end of this room./"
	        GS.msg[1]= "* I\'ll see you around^1!&* Have a good time!/"
	        GS.msg[2]= "* In Waterfalllllllllllllllll&  lllllllllllll/%%"
	        with(onion) event_user(2)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        con= 10
	    }
	    if(con == 15 and instance_exists(782/* OBJ_WRITER */) and con == 15 and OBJ_WRITER.stringno == 2) {
	        // obj_oniont
	        with(1078) on= 4
	        with(onion) on= 4
	        with(onion) follow= 0
	    }
	    if(con == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 16
	        GS.interact= 0
	    }
	    if(GS.flag[496] == 5 and obj_mainchara.x > 600 and obj_mainchara.x < 640 and GS.interact == 0 and onion.on != 4 and onion.on != 0) {
	        GS.flag[496]= 6
	        GS.interact= 1
	        con= 11
	        GS.facechoice= 0
	        GS.msc= 0
	        GS.typer= 5
	        GS.msc= 839
	        once= 1
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(GS.flag[496] == 6 and obj_mainchara.x > 600 and obj_mainchara.x < 640 and GS.interact == 0 and once == 0 and onion.on != 4 and onion.on != 0) {
	        once= 1
	        GS.interact= 1
	        con= 11
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.msg[0]= "\\M1* Oh^1!&* Did y\'hear!!!/"
	        GS.msg[1]= "\\M1* .../"
	        GS.msg[2]= "\\M1* I got nothing else..^1.&* To talk about.../%%"
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "\\M2* I\'ve been wondering when&  we\'re all gonna go free./"
	            GS.msg[1]= "\\M3* S-since..^1. if we did..^1.&* How would I ever know?/"
	            GS.msg[2]= "\\M1* Well^1, I\'ll keep my&  tentacles out for you^1!&* Y\'hear!/"
	            GS.msg[3]= "* As soon as I know I\'ll be&  the first to tell you^1!&* Y\'hear!!/%%"
	            GS.flag[496]= 7
	            once= 1
	        }
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(GS.flag[496] == 7 and obj_mainchara.x > 600 and obj_mainchara.x < 640 and GS.interact == 0 and once == 0 and onion.on != 4 and onion.on != 0) {
	        once= 1
	        GS.facechoice= 0
	        GS.interact= 1
	        con= 11
	        GS.msc= 0
	        GS.typer= 5
	        GS.msg[0]= "\\M0* It\'s gotta be any day now!/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(con == 25) {
	        GS.facing= 2
	        con= 26
	        GS.interact= 1
	        $Alarm4.start((60) / 30.0)
	    }
	    if(con == 27) {
	        con= 28
	        $Alarm4.start((120) / 30.0)
	        onion.on= 4
	    }
	    if(con == 29) {
	        GS.interact= 0
	        con= 30
	        GS.facing= 0
	    }
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
