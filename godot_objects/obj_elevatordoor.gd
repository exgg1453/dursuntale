# Auto-converted from GameMaker: obj_elevatordoor
# GM parent: obj_interactable
extends Node2D

func _ready():
	if(room == 216 and x < get_viewport_rect().size.x / 2 and GS.flag[493] >= 12 and GS.flag[7] == 0) {
	    instance_create(x, y + 30, 2/* obj_solidsmall */)
	    instance_create(x + 20, y + 30, 2/* obj_solidsmall */)
	    // obj_door_s_musfade
	    with(789) instance_destroy()
	    myvine= scr_marker(x, y, 1851)
	    myvine.z_index= z_index
	    instance_create(90, 120, 1344/* obj_readable_room1 */)
	    if(GS.entrance == 24 and instance_exists(1570/* obj_mainchara */)) {
	        obj_mainchara.x= 90
	        obj_mainchara.y= 130
	    }
	    instance_destroy()
	    exit
	} else  {
	    s1= instance_create(x, y + 30, 2/* obj_solidsmall */)
	    s2= instance_create(x + 20, y + 30, 2/* obj_solidsmall */)
	    myinteract= 0
	    con= 0
	    side= 0
	    if(GS.entrance == 19) $Alarm0.start((1) / 30.0)
	    if(room == 189) {
	        GS.flag[200]= 205
	        con= 40
	        ok= 0
	        if(GS.flag[414] == 1) ok= 1
	        if(GS.flag[367] > 0) ok= 1
	        if(ok == 1) con= 43
	        if(GS.flag[418] == 1 or GS.flag[419] == 1 or GS.flag[420] == 1)
	            con= 0
	    }
	    if(room == 210) GS.flag[200]= 205
	    if(room == 217) {
	        con= 50
	        ok= 0
	        if(GS.flag[450] >= 17) ok= 1
	        if(ok == 1) con= 0
	    }
	    if(room == 183) {
	        con= 50
	        ok= 0
	    }
	    if(room == 168 and scr_murderlv() >= 12) {
	        ff= instance_create(200, 140, 1183/* obj_kitchenforcefield */)
	        ff.scale.y= 3
	    }
	    if(room == 187 and scr_murderlv() >= 12) {
	        ff= instance_create(80, 100, 1183/* obj_kitchenforcefield */)
	        with(ff) scale.y= 3
	    }
	    if(room == 157 and scr_murderlv() >= 12) {
	        ff= instance_create(80, 100, 1183/* obj_kitchenforcefield */)
	        with(ff) scale.y= 3
	    }
	    if(room == 212) {
	        GS.border= 0
	        SCR_BORDERSETUP()
	    }
	    buffer= 0
	    exit
	}

func _on_destroy():
	side= 20
	con= 2
	with(s1) instance_destroy()
	with(s2) instance_destroy()
	event_user(0)

func _process(delta: float):
	buffer--
	if(myinteract == 1 and buffer > 0) myinteract= 0
	if(myinteract == 1 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
	    snd_play(121/* snd_elecdoor_open */)
	    event_user(0)
	}
	if(con == 1) {
	    side+= 2
	    if(side >= 20) {
	        con= 2
	        GS.interact= 0
	        with(s1) instance_destroy()
	        with(s2) instance_destroy()
	        if(instance_exists(1170/* obj_alphys_npc */) and room == 212) {
	            obj_alphysfollow_event.con= 50
	            GS.interact= 1
	            m= instance_create(0, 0, 92/* obj_musfadeout */)
	        }
	    }
	}
	if(myinteract == 1 and GS.interact == 0 and con == 40) {
	    GS.interact= 1
	    con= 41
	}
	if(con == 41) {
	    GS.interact= 1
	    GS.msc= 0
	    GS.msg[0]= "* (The elevator isn\'t working.)/"
	    GS.msg[1]= "* Ring.../"
	    GS.msg[2]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[3]= "* What^1?&* The elevator should&  be working.../"
	    GS.msg[4]= "* .../"
	    GS.msg[5]= "\\E6* W-well then^1!&* Go to the right&  and keep heading up!/%%"
	    GS.msg[6]= "\\TS \\F0 \\T0 %"
	    GS.msg[7]= "* Click.../%%"
	    if(GS.flag[415] == 1) {
	        GS.msg[5]= "\\E6* W-well then^1!&* Let\'s go to the&  left!/%%"
	        GS.msg[6]= "\\TS \\F0 \\T0 %"
	        GS.msg[7]= "* Click.../%%"
	    }
	    GS.flag[414]= 1
	    if(scr_murderlv() >= 12)
	        GS.msg[0]= "* (The elevator isn\'t working.)/%%"
	    scr_regulartext()
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    buffer= 4
	    con= 43
	    myinteract= 0
	    GS.interact= 0
	}
	if(con == 43 and myinteract == 1 and GS.interact == 0) {
	    GS.interact= 1
	    GS.msg[0]= "* (The elevator isn\'t working.)/%%"
	    scr_regulartext()
	    con= 42
	}
	if(con == 50 and myinteract == 1 and GS.interact == 0) {
	    GS.interact= 1
	    GS.msg[0]= "* (The elevator is in use.)/%%"
	    scr_regulartext()
	    con= 42
	}

func _gm_event_7_10():
	if(room == 214) GS.flag[398]= 0
	if(room == 156) GS.flag[398]= 1
	if(room == 157) GS.flag[398]= 2
	if(room == 168) GS.flag[398]= 3
	if(room == 169) GS.flag[398]= 4
	if(room == 187) GS.flag[398]= 5

func _on_outside_room():
	draw_sprite(sprite_index, 1, x, y)
	draw_sprite_part(1849, 0, side, 0, 20 - side, 50, x, y)
	draw_sprite_part(1849, 0, 0, 0, 20 - side, 50, x + 20 + side, y)
	draw_sprite(sprite_index, 0, x, y)

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
