# Auto-converted from GameMaker: obj_spidertalkevent
extends Node2D

func _ready():
	scale.y= 6
	active= 0
	GS.flag[200]= 205
	if(GS.flag[396] < 5 and GS.tempvalue[11] > 0) GS.flag[396]= 5
	con= GS.flag[396]
	x+= GS.flag[396] * 90
	pausewait= 0
	pausewaittime= 0
	if(GS.plot > 164) {
	    instance_destroy()
	    exit
	} else  {
	    murder= 0
	    if(scr_murderlv() >= 12) murder= 1
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(active == 1) {
	    GS.typer= 5
	    GS.msc= 0
	    GS.facechoice= 0
	    if(con == 0) {
	        GS.msg[0]= "* Ahuhuhuhu.../"
	        GS.msg[1]= "* Did you hear what they&  just said?/%%"
	        if(murder == 1) GS.msg[1]= "* Did you hear what she&  said?/%%"
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 1) {
	        GS.msg[0]= "* They said a human wearing a&  striped shirt will come&  through./%%"
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 2) {
	        GS.msg[0]= "* I heard that they hate&  spiders./%%"
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 3) {
	        GS.msg[0]= "* I heard that they love to&  stomp on them./%%"
	        if(murder == 1)
	            GS.msg[1]= "* I heard that they hate&  everybody./%%"
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 4) {
	        GS.msg[0]= "* I heard that they like to&  tear their legs off./%%"
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 5) {
	        if(GS.flag[59] < 9000) GS.msg[0]= "* I heard.../%%"
	        else  {
	            GS.msg[0]= "* However.../%%"
	            if(murder == 1)
	                GS.msg[0]= "* And even if they gave us&  money^1, I heard.../%%"
	        }
	        snd_play(35/* snd_hurtgirl */)
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 90
	    }
	    if(con == 90 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        active= 0
	        x+= 90
	        GS.flag[396]++
	        con= GS.flag[396]
	        if(con == 6) pausewait= 1
	    }
	}
	if(pausewait == 1) {
	    GS.flag[17]= 1
	    if(obj_mainchara.image_speed == 0)
	        pausewaittime+= 3
	    else  pausewaittime++
	    if(pausewaittime > 150) {
	        pausewait= 0
	        con= 15
	    }
	}
	if(con == 15 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[17]= 0
	    bigweb= scr_marker(582, 84, 1801)
	    bigweb.z_index= 99999
	    muffet= scr_marker(635, 96, 1802)
	    muffet.z_index= 99998
	    bigweb.modulate.a= 0
	    muffet.modulate.a= 0
	    con= 15.1
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 15.1) {
	    bigweb.modulate.a+= 0.04
	    muffet.modulate.a+= 0.04
	}
	if(con == 16.1) {
	    hspider[0]= instance_create(556, -20, 1234/* obj_highspider */)
	    hspider[0].velocity.y= 3
	    hspider[0].$Alarm5.start((38) / 30.0)
	    hspider[1]= instance_create(600, -20, 1234/* obj_highspider */)
	    hspider[1].velocity.y= 3
	    hspider[1].$Alarm5.start((35) / 30.0)
	    hspider[2]= instance_create(684, -20, 1234/* obj_highspider */)
	    hspider[2].velocity.y= 3
	    hspider[2].$Alarm5.start((35) / 30.0)
	    hspider[3]= instance_create(720, -20, 1234/* obj_highspider */)
	    hspider[3].velocity.y= 3
	    hspider[3].$Alarm5.start((38) / 30.0)
	    ss1= scr_marker(428, 180, 1804)
	    ss2= scr_marker(438, 170, 1804)
	    ss1.image_speed= 0.25
	    ss1.velocity.x= 4
	    ss2.velocity.x= 3.5
	    ss2.image_speed= 0.25
	    ss3= scr_marker(854, 180, 1804)
	    ss4= scr_marker(864, 170, 1804)
	    ss3.velocity.x= -4
	    ss3.image_speed= 0.25
	    ss4.velocity.x= -3.5
	    ss4.image_speed= 0.25
	    con= 16
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 17) {
	    ss1.speed= 0
	    ss2.speed= 0
	    ss3.speed= 0
	    ss4.speed= 0
	    ss1.image_speed= 0
	    ss2.image_speed= 0
	    ss3.image_speed= 0
	    ss4.image_speed= 0
	    conner= 0
	    GS.facing= 2
	    GS.typer= 5
	    GS.msc= 0
	    GS.facechoice= 0
	    if(GS.flag[59] < 9000) {
	        if(GS.tempvalue[11] == 0)
	            GS.msg[0]= "* ... that they\'re awfully&  stingy with their money./"
	        else  GS.msg[0]= "* ... a certain stingy human&  hates spiders./%%"
	        GS.msg[1]= "* Ahuhuhuhu.../"
	        GS.msg[2]= "* You think your taste&  is too refined for our&  pastries^1, don\'t you^1, deary?/"
	        GS.msg[3]= "* Ahuhuhu..^1.&* I disagree with that&  notion./"
	        GS.msg[4]= "* I think your taste.../"
	        GS.msg[5]= "* Is exactly what this&  next batch needs!/%%"
	        con= 18
	    } else  {
	        GS.msg[0]= "* ... that can\'t be true^1,&  can it?/"
	        GS.msg[1]= "* Ahuhuhu.../"
	        GS.msg[2]= "* You donated so much money&  to us./"
	        GS.msg[3]= "* All the spiders want you&  to know how thankful&  they are!/"
	        GS.msg[4]= "* We\'re in your debt^1, dearie~/%%"
	        con= 40
	    }
	    if(murder == 1) {
	        GS.msg[0]= "* ... that they have some awful&  taste./"
	        GS.msg[1]= "* What a shame^1.&* A human comes through and they&  aren\'t even fit to be eaten~/"
	        GS.msg[2]= "* Oh well^1!&* Rotten ingredients can&  always be discarded~/%%"
	        con= 18
	    }
	    dr= instance_create(0, 0, 779/* obj_dialoguer */)
	    dr.side= 0
	}
	if(con == 18 and not instance_exists(782/* OBJ_WRITER */) and conner == 0 and OBJ_WRITER.stringno == 1) {
	    snd_play(35/* snd_hurtgirl */)
	    conner= 1
	}
	if(con == 18 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 19
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 19) {
	    muffet.frame+= 0.25
	    if(muffet.frame >= 5.75) muffet.frame= 4
	}
	if(con == 20) {
	    GS.mercy= 1
	    GS.battlegroup= 56
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 21
	    $Alarm4.start((33) / 30.0)
	}
	if(con == 21) GS.interact= 1
	if(con == 22) {
	    con= 23
	    with(ss1) instance_destroy()
	    with(ss2) instance_destroy()
	    with(ss3) instance_destroy()
	    with(ss4) instance_destroy()
	    if(GS.flag[12] == 1) {
	        GS.flag[397]= 1
	        with(muffet) instance_destroy()
	        // obj_highspider
	        with(1234) instance_destroy()
	        with(bigweb) instance_destroy()
	    } else  {
	        muffet.image_speed= 0
	        muffet.frame= 0
	        con= 30
	    }
	    // obj_slowdownwalk_x
	    with(1236) instance_destroy()
	    obj_mainchara.cutscene= 0
	    GS.interact= 1
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 23 or con == 30) GS.interact= 1
	if(con == 24) con= 60
	if(con == 31) {
	    snd_play(35/* snd_hurtgirl */)
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* Ahuhuhuhu.../"
	    GS.msg[1]= "* That was fun^1!&* See you again^1, dearie!/%%"
	    con= 32
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	}
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 33
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    muffet.frame+= 0.25
	    if(muffet.frame >= 5.75) muffet.frame= 4
	}
	if(con == 34) {
	    con= 35
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 35) {
	    muffet.modulate.a-= 0.04
	    bigweb.modulate.a-= 0.04
	    // obj_highspider
	    with(1234) {
	        velocity.y= -4
	        image_speed= 0.2
	    }
	}
	if(con == 36) con= 60
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    ss1.image_speed= 0.25
	    ss1.velocity.x= -4
	    ss2.velocity.x= -3.5
	    ss2.image_speed= 0.25
	    ss3.velocity.x= 4
	    ss3.image_speed= 0.25
	    ss4.velocity.x= 3.5
	    ss4.image_speed= 0.25
	    // obj_slowdownwalk_x
	    with(1236) instance_destroy()
	    obj_mainchara.cutscene= 0
	    con= 35
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 60) {
	    GS.plot= 165
	    GS.mercy= 0
	    GS.border= 0
	    GS.flag[17]= 0
	    GS.interact= 0
	    if(murder == 1) GS.plot= 185
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and active == 0) {
	    GS.interact= 1
	    active= 1
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
