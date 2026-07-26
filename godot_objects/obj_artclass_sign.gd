# Auto-converted from GameMaker: obj_artclass_sign
# GM parent: obj_interactable
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	murd= 0
	if(scr_murderlv() >= 12) murd= 1
	con= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	if(con == 0) {
	    myinteract= 3
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    skip= 0
	    GS.msg[0]= "* Ark Club: Meet here!&* Next meeting:&* Tuesday Oct 10th 8PM/%%"
	    if(murd == 1) {
	        skip= 1
	        GS.msg[0]= "* (Art club is cancelled!)/%%"
	    }
	    if(GS.flag[281] == 1) {
	        GS.msg[0]= "* (Art is dead.)/%%"
	        skip= 1
	    }
	    if(GS.flag[281] == 2) {
	        GS.msg[0]= "* Let\'s meet again someday!/%%"
	        skip= 1
	    }
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Who knows what lies in the&  future for Art Club!?/%%"
	        skip= 1
	    }
	    if(skip == 0 and current_weekday == 2 and current_month == 10 and current_day == 10 and (current_hour == 8 or current_hour == 20))
	        con= 1
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	}

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(myinteract == 1) {
	    if(con == 0) {
	        GS.interact= 1
	        myinteract= 3
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        skip= 0
	        GS.msg[0]= "* Art Club: Meet here!&* Next meeting:&* October 10th 8PM/%%"
	        if(murd == 1) {
	            skip= 1
	            GS.msg[0]= "* (Art club is cancelled!)/%%"
	        }
	        if(GS.flag[281] == 1) {
	            GS.msg[0]= "* (Art is dead.)/%%"
	            skip= 1
	        }
	        if(GS.flag[281] == 2) {
	            GS.msg[0]= "* Let\'s meet again someday!/%%"
	            skip= 1
	        }
	        if(GS.flag[7] == 1 or GS.flag[8] == 1) {
	            GS.msg[0]= "* Who knows what lies in the&  future for Art Club!?/%%"
	            skip= 1
	        }
	        if(skip == 0 and GS.plot > 164 and current_month == 10 and current_day == 10 and (current_hour == 8 or current_hour == 20)) {
	            con= 1
	            myinteract= -1
	        }
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        talkedto++
	    } else  myinteract= 0
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 0
	    snd_play(50/* snd_escaped */)
	    con= 2
	    $Alarm4.start((60) / 30.0)
	    GS.interact= 1
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 0
	    GS.interact= 1
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Ahhhh!!^1!&* I\'m late!!^1!&* I\'m late!!!/"
	    GS.msg[1]= "* I\'m so sorry!!!/%%"
	    scr_regulartext()
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(20/* snd_arrow */)
	    sory= scr_marker(obj_mainchara.x - 10, 240, 1670)
	    sory.velocity.y= -5
	    sory.z_index= 1000
	    sory.image_speed= 0.5
	    con= 5
	}
	if(con == 5 and sory.y <= obj_mainchara.y + 15) {
	    with(sory) instance_destroy()
	    snd_play(21/* snd_impact */)
	    dk= scr_marker(-5, -5, 996)
	    dk.scale.x= 300
	    dk.scale.y= 300
	    con= 6
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 7) {
	    with(dk) instance_destroy()
	    GS.battlegroup= 140
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 8
	    $Alarm4.start((31) / 30.0)
	}
	if(con == 9) {
	    myinteract= 0
	    GS.mercy= 0
	    GS.interact= 0
	    con= 0
	    $Alarm4.start((-1) / 30.0)
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
