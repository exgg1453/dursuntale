# Auto-converted from GameMaker: obj_laserswitch1
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	if(room == 147 and GS.flag[371] == 1) $Alarm1.start((3) / 30.0)
	con= 0

func _gm_event_2_1():
	event_user(0)

func _on_destroy():
	myinteract= 3
	GS.msc= 682
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Hi./%%"
	if(GS.plot > 184) {
	    GS.msc= 0
	    GS.msg[0]= "* (Didn\'t work.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	if(GS.flag[370] == 2 and GS.hp == 1 and GS.flag[372] == 0 and con == 0 and GS.interact == 0 and GS.flag[367] == 0 and GS.plot < 184) {
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "\\E3* H-hey^1, watch out^1!&* You\'re going to get&  really hurt!/"
	    GS.msg[3]= "\\E8* I can\'t watch this^1.&* I\'m disabling the&  lasers./%%"
	    scr_regulartext()
	    snd_play(104/* snd_phone */)
	    GS.interact= 1
	    con= 0.5
	}
	if(con == 0.5 and not instance_exists(782/* OBJ_WRITER */) and instance_exists(1281/* obj_bluelaser_o */)) {
	    obj_bluelaser_o.active= 0
	    obj_bluelaser_o.$Alarm0.start((30) / 30.0)
	}
	if(con == 0.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    sc= instance_create(0, 0, 90/* obj_soundcombo */)
	    with(sc) {
	        sound1= 132
	        sound2= 13
	        $Alarm1.start((8) / 30.0)
	    }
	    event_user(0)
	    con= 0.6
	    timer= 0
	}
	if(con == 0.6) {
	    timer++
	    if(timer > 30) {
	        con= 1
	        GS.faceemotion= 0
	        GS.msg[0]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[1]= "\\E6* Th..^1. there./"
	        GS.msg[2]= "\\E3* Be careful^1, okay?/"
	        GS.msg[3]= "\\E8* .../"
	        GS.msg[4]= "\\E8* I-I\'m sorry^1, it\'s&  m-my fault you&  got hurt./"
	        GS.msg[5]= "\\E8* I didn\'t explain the&  lasers well enough^1,&  and../"
	        GS.msg[6]= "\\E8* If I hadn\'t..^1.&* If I hadn\'t..^1./"
	        GS.msg[7]= "\\E4* Um^1, delayed using&  my hacking skills^1,&  I mean.../"
	        GS.msg[8]= "\\E8* ... sorry./"
	        GS.msg[9]= "\\TS \\F0 \\T0 %"
	        GS.msg[10]= "* Click.../%%"
	        if(room == 166) {
	            GS.msg[1]= "\\E8* I-I\'m sorry^1, it\'s&  m-my fault you&  got hurt./"
	            GS.msg[2]= "\\E8* I didn\'t explain the&  lasers well enough^1,&  and.../"
	            GS.msg[3]= "\\E3* O-oh^1, there\'s no&  time for this now!/"
	            GS.msg[4]= "\\E8* Sorry./"
	            GS.msg[5]= "\\TS \\F0 \\T0 %"
	            GS.msg[6]= "* Click.../%%"
	        }
	        scr_regulartext()
	    }
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    sc= instance_create(0, 0, 90/* obj_soundcombo */)
	    with(sc) {
	        sound1= 132
	        sound2= 13
	        $Alarm1.start((8) / 30.0)
	    }
	    GS.flag[372]= 1
	    GS.interact= 0
	    event_user(0)
	    con= 2
	}

func _gm_event_7_11():
	obj_bluelaser_o.active= 1
	// obj_bluelaser_o
	with(1281) velocity.x= remembervelocity.x
	sprite_index= 1853/* spr_onoffswitch_off */
	image_speed= 0.25
	GS.flag[371]= 0

func _gm_event_7_10():
	obj_bluelaser_o.active= 2
	obj_bluelaser_o.velocity.x= 0
	sprite_index= 1854/* spr_onoffswitch_on */
	image_speed= 0.25
	GS.flag[371]= 1

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
