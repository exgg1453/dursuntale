# Auto-converted from GameMaker: obj_dateheart
extends Node2D

func _ready():
	GS.sp= GS.asp
	movement= 1
	hgo= 0
	vgo= 0
	deleteafter= 0
	blconwd= 39482894
	canpress= 1

func _gm_event_2_3():
	canpress= 1

func _process(delta: float):
	GS.invc--
	if(GS.invc > 0) image_speed= 0.5
	else  {
	    frame= 0
	    image_speed= 0
	}
	if(obj_time.left == 1 and movement == 1) {
	    x-= GS.sp
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x+= GS.sp / 2
	}
	if(obj_time.right == 1 and movement == 1) {
	    x+= GS.sp
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x+= GS.sp / 2
	}
	if(obj_time.up == 1 and movement == 1) {
	    y-= GS.sp
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x+= GS.sp / 2
	}
	if(obj_time.down == 1 and movement == 1) {
	    y+= GS.sp
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x+= GS.sp / 2
	}
	if(GS.hp < 1) script_execute(158/* scr_gameoverb */)
	if(deleteafter == 1 and not is_instance_valid(blconwd)) {
	    $Alarm3.start((10) / 30.0)
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    movement= 1
	    if(instance_exists(169/* obj_papdate */)) {
	        obj_papdate.face_index= 0
	        obj_papdate.face_speed= 0
	    }
	    deleteafter= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and movement == 1 and canpress == 1 and instance_exists(169/* obj_papdate */)) {
	    snd_play(28/* snd_bell */)
	    bodypart= 0
	    xx= obj_papdate.x
	    yy= obj_papdate.y
	    if(collision_rectangle(xx + 24, yy + 58, xx + 86, yy + 130, 749, 0, 0))
	        bodypart= 1
	    if(collision_rectangle(xx + 84, yy + 56, xx + 110, yy + 164, 749, 0, 0))
	        bodypart= 2
	    if(collision_rectangle(xx + 0, yy + 66, xx + 24, yy + 112, 749, 0, 0))
	        bodypart= 2
	    if(collision_rectangle(xx + 90, yy + 144, xx + 138, yy + 172, 749, 0, 0))
	        bodypart= 3
	    if(collision_rectangle(xx + 0, yy + 112, xx + 44, yy + 146, 749, 0, 0))
	        bodypart= 3
	    if(collision_rectangle(xx + 34, yy + 130, xx + 84, yy + 196, 749, 0, 0))
	        bodypart= 4
	    if(collision_rectangle(xx + 12, yy + 196, xx + 124, yy + 216, 749, 0, 0))
	        bodypart= 5
	    if(collision_rectangle(xx + 36, yy, xx + 88, yy + 58, 749, 0, 0))
	        bodypart= 6
	    if(bodypart > 0) {
	        deleteafter= 1
	        if(bodypart == 2) {
	            GS.msg[0]= "\\E3I SEE^1. I SEE./"
	            GS.msg[1]= "\\E0YOU LIKE CARESSING&MY BICEPS WITH A&FLOATING HEART./"
	            GS.msg[2]= "\\E1BUT WHO DOESN\'T!?/%%"
	            GS.msg[3]= "\\E0TRY AGAIN!/%%"
	        }
	        if(bodypart == 1) {
	            GS.msg[0]= "\\E0THIS SHIRT DIDN\'T&ORIGINALLY SAY&\'COOL^1,\' BUT I&IMPROVED IT./"
	            GS.msg[1]= "EXPERT TIP^1: ALL&CLOTHING ARTICLES&CAN BE IMPROVED&THIS WAY./%%"
	            GS.msg[2]= "\\E1BUT THAT\'S NOT A&SECRET!!!/"
	            GS.msg[3]= "IT\'S JUST GOOD&ADVICE!!!/%%"
	        }
	        if(bodypart == 3) {
	            GS.msg[0]= "\\E2HOLDING MY HAND&SO I\'LL TELL&YOU THE ANSWER.../"
	            GS.msg[1]= "\\E7NO!!^1!&I MUST RESIST!!/%%"
	        }
	        if(bodypart == 4) {
	            GS.msg[0]= "\\E0THERE\'S NO SECRET&TO MY LEGS./"
	            GS.msg[1]= "JUST HARD WORK&AND PERSEVERANCE.../%%"
	        }
	        if(bodypart == 5) {
	            GS.msg[0]= "\\E3HUMAN SOULS ARE&STRONGER THAN&MONSTER SOULS.../"
	            GS.msg[1]= "\\E0BUT THE SOLES OF&OUR SHOES ON THE&OTHER HAND...!/"
	            GS.msg[2]= "\\E3... ARE ABOUT THE&SAME./%%"
	        }
	        if(bodypart == 6) GS.msg[0]= "HAT DIALOGUE./%%"
	        if(bodypart < 6) event_user(1)
	        if(bodypart == 6) {
	            obj_papdate.cn= 47
	            instance_destroy()
	        }
	    }
	}

func _on_alarm_0_timeout():
	y= obj_dborder.y + 6

func _gm_event_7_11():
	GS.typer= 22
	blcon= instance_create(obj_papdate.x + 145, obj_papdate.y + 22, 187/* obj_blconwdflowey */)
	movement= 0
	blconwd= instance_create(blcon.x + 25, blcon.y + 10, 782/* OBJ_WRITER */)
	canpress= 0

func _gm_event_7_0():
	if(instance_exists(169/* obj_papdate */) and deleteafter == 0) {
	    GS.msg[0]= "\\E0I UNDERSTAND&WHY YOU\'RE&RUNNING AWAY./"
	    GS.msg[1]= "\\E2YOU\'RE OVERWHELMED&BY THE SIGHT OF&MY COOL VIBES./"
	    GS.msg[2]= "\\E0BUT YOU CAN\'T&BACK DOWN NOW!!!/%%"
	    deleteafter= 1
	    x= xstart
	    y= ystart
	    event_user(1)
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
