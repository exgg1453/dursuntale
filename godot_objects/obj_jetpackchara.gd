# Auto-converted from GameMaker: obj_jetpackchara
extends Node2D

func _ready():
	image_speed= 0
	con= 0
	$Alarm5.start((20) / 30.0)
	timertime= 1800
	maxdist= 20250
	dist= 20250
	instance_create(view_xview[0] - 103, view_yview[0] + 40, 1184/* obj_cookhud */)
	won= 0
	eligible= 1

func _gm_event_2_5():
	mett= instance_create(xx + 350, yy + 20, 1182/* obj_trueflymett */)
	con= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(won == 0) {
	    if(Input.is_action_pressed("move_left") and x > 330) x-= 4
	    if(Input.is_action_pressed("move_right") and x < 620) x+= 4
	}
	if(won == 0 and obj_counterscroller.fakev < 15)
	    obj_counterscroller.fakev+= 0.25
	myfakev= obj_counterscroller.fakev
	dist-= myfakev
	if(dist < 200 or timertime < 90) eligible= 0
	if(con == 1 and mett.x < xx + 150) con= 2
	if(dist < 600 and is_instance_valid(mett)) mett.$Alarm1.start((-1) / 30.0)
	if(con == 2) {
	    mett.overmode= 1
	    if(dist / maxdist < 0.75) mett.movemode= 1
	    if(dist / maxdist < 0.35) mett.overmode= 2
	}
	if(con == 10) {
	    mett.overmode= 0
	    mett.movemode= 0
	    mett.mode= 4
	    mett.con= 9
	    wrong= 0
	    if(mett.y < 200) mett.y+= 5
	    if(mett.x < 580) {
	        mett.x+= 4
	        wrong= 1
	    }
	    if(mett.x > 590) {
	        mett.x-= 4
	        wrong= 1
	    }
	    if(wrong == 0) {
	        // obj_cookhud
	        with(1184) finished= 1
	        con= 11
	        obj_counterscroller.seg= -98
	        obj_counterscroller.on= 1
	    }
	}
	if(con == 11) {
	    if(mett.y < 200) mett.y+= 5
	    if(mett.x < 580) mett.x+= 4
	    if(obj_counterscroller.fakev > 2)
	        obj_counterscroller.fakev--
	    else  {
	        con= 12
	        instance_create(0, 0, 92/* obj_musfadeout */)
	    }
	}
	if(con == 12) {
	    if(obj_counterscroller.seg <= -104) {
	        obj_counterscroller.fakev= 0
	        con= 13
	    }
	    if(mett.y < 200) mett.y+= 5
	    if(mett.x < 580) mett.x+= 4
	}
	if(con == 13) {
	    remx= obj_mainchara.x
	    remy= obj_mainchara.y
	    obj_mainchara.x= 400
	    obj_mainchara.y= 100
	    GS.typer= 27
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* MY MY./"
	    GS.msg[1]= "* IT SEEMS YOU\'VE BESTED ME./"
	    GS.msg[2]= "* BUT ONLY BECAUSE YOU HAD&  THE HELP OF THE BRILLIANT&  DOCTOR ALPHYS!/"
	    GS.msg[3]= "* OH^1, I LOATHE TO THINK OF&  WHAT WOULD HAVE HAPPENED&  TO YOU WITHOUT HER!!!/"
	    GS.msg[4]= "* WELL^1, TOODLES!!/%%"
	    ggg= instance_create(0, 0, 779/* obj_dialoguer */)
	    ggg.side= 0
	    con= 14
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.x+= 8
	    if(mett.x > 800) con= 15
	}
	if(con == 15) {
	    mett.x-= 8
	    if(mett.x < xx + 240) con= 16
	}
	if(con == 16) {
	    GS.msg[0]= "* OH YES^1!&* ABOUT THE SUBSTITUTION.../"
	    GS.msg[1]= "* HAVEN\'T YOU EVER SEEN&  A COOKING SHOW BEFORE?/"
	    GS.msg[2]= "* I ALREADY BAKED THE CAKE&  AHEAD OF TIME!!!!!&* SO FORGET IT!!!/%%"
	    ggg= instance_create(0, 0, 779/* obj_dialoguer */)
	    ggg.side= 0
	    con= 17
	}
	if(con == 17 and not instance_exists(779/* obj_dialoguer */)) {
	    mett.x+= 8
	    obj_counterscroller.fakev= -3
	    con= 18
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 18) {
	    if(x < 467) x+= 3
	    if(x > 473) x-= 3
	    mett.x+= 8
	}
	if(con == 19) {
	    obj_counterscroller.fakev= 0
	    if(y < 367) y+= 3
	    else  y= 367
	    if(x < 467) x+= 4
	    if(x > 473) x-= 4
	    if(x >= 467 and x <= 473) x= 470
	    if(view_yview[0] < 240) view_yview[0]+= 6
	    else  view_yview[0]= 240
	    if(view_yview[0] == 240 and x == 470 and y == 367) {
	        with(mett) instance_destroy()
	        view_yview[0]= 240
	        con= 20
	    }
	}
	if(con == 20) {
	    con= 21
	    obj_cookshowevent.con= 70
	}
	if(con == 30) {
	    if(obj_counterscroller.fakev < 0)
	        obj_counterscroller.fakev+= 0.25
	    if(obj_counterscroller.fakev > 0)
	        obj_counterscroller.fakev-= 0.25
	    if(abs(obj_counterscroller.fakev) < 0.5) obj_counterscroller.fakev= 0
	    mett.overmode= 0
	    mett.movemode= 0
	    mett.$Alarm1.start((-1) / 30.0)
	    if(mett.y < 200) mett.y+= 5
	    if(mett.x < 580) mett.x+= 4
	    if(abs(obj_counterscroller.fakev) < 0.5) {
	        // obj_cookhud
	        with(1184) finished= 1
	        instance_create(0, 0, 92/* obj_musfadeout */)
	        obj_counterscroller.fakev= 0
	        con= 31
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 32) {
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Wh-what!^1?&* Wh-why aren\'t you&  m-m-moving?/"
	    GS.msg[3]= "* N-no...^1!&* I must not have&  added enough fuel!/"
	    GS.msg[4]= "\\E8* D-darnit..^1.&* I\'m sorry.../"
	    GS.msg[5]= "* Even when it\'s&  something like&  this^1, I.../"
	    GS.msg[6]= "* I still...^1!&* I still.../%%"
	    scr_regulartext()
	    snd_play(104/* snd_phone */)
	    con= 33
	}
	if(con == 33) {
	    if(mett.y < 240) mett.y+= 5
	    if(mett.x < 580) mett.x+= 4
	}
	if(con == 33 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[377]= 1
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msg[0]= "* OH NO^1, WOULD YOU LOOK AT&  THAT!/"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* What?/"
	    GS.msg[3]= "\\TS \\E0 \\F0 \\TM %"
	    GS.msg[4]= "* I FORGOT!&* RIGHT ABOUT NOW IS WHEN&  WE HAVE OUR COMMERCIAL BREAK!/"
	    GS.msg[5]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[6]= "* Wh..^1.&* What are you...%"
	    GS.msg[7]= "\\TS \\E0 \\F0 \\TM %"
	    GS.msg[8]= "* UNFORTUNATELY, THAT MEANS&  NO ONE IS WATCHING THIS&  RIGHT NOW./"
	    GS.msg[9]= "* I\'M NOT GOING TO DESTROY&  YOU WITHOUT A LIVE&  TELEVISION AUDIENCE!!/"
	    GS.msg[10]= "* LOOKS LIKE YOU\'VE FOILED ME&  ONCE AGAIN, THANKS TO THE&  BRILLIANT DR. ALPHYS!!!/"
	    GS.msg[11]= "* UNTIL NEXT TIME, BEAUTIFUL!/"
	    GS.msg[12]= "* TOODLES!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 34
	}
	if(con == 34 and instance_exists(782/* OBJ_WRITER */) and mett.y < 240)
	    mett.y+= 5
	if(con == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mett) velocity.y= -4
	    con= 17
	}
	if(dist <= 1 and timertime >= 0 and won == 0) {
	    won= 1
	    con= 10
	}
	if(dist > 1 and timertime <= 0 and won == 0) {
	    won= 2
	    con= 30
	}

func _gm_event_7_10():
	if(instance_exists(1196/* obj_counterscroller */)) {
	    if(obj_counterscroller.fakev > -1)
	        obj_counterscroller.fakev-= 6
	    if(obj_counterscroller.fakev < -1) obj_counterscroller.fakev= -1
	    if(not instance_exists(184/* obj_shaker */)) scr_shake(2, 2, 2)
	}

func _on_outside_room():
	xx= view_xview[0]
	yy= view_yview[0]
	draw_sprite(sprite_index, frame, x, y)
	timertime--
	if(timertime < 300) timertime+= 0.25

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
