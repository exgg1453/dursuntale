# Auto-converted from GameMaker: obj_monsterkidtrigger6
extends Node2D

func _ready():
	con= 99999
	unbuffer= 0
	ganer= 0
	if(GS.plot < 112 and GS.entrance == 1) {
	    mkid= instance_create(obj_mainchara.x - 8, obj_mainchara.y, 1115/* obj_mkid_actor */)
	    mkid.sprite_index= mkid.dsprite
	    mkid.follow= 2.1
	    con= 0
	}
	if(GS.plot == 112) {
	    con= 8
	    mkid= instance_create(320, 100, 1481/* obj_townnpc_monsterkid1 */)
	    mkid.prostrate= 1
	    mkid.fun= 1
	    mkid.sprite_index= 1398/* spr_mkid_prostrate */
	}
	ledgewall= instance_create(340, 60, 5/* obj_solidextall_2 */)
	if(GS.entrance == 1) side= 0
	if(GS.entrance == 2) {
	    side= 1
	    ledgewall.x= 320
	}

func _gm_event_2_7():
	// obj_mainchara
	with(1570) uncan= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0 and instance_exists(1570/* obj_mainchara */) and obj_mainchara.x > 120) {
	    with(mkid) {
	        follow= 99
	        move_towards_point(320, 100, 4)
	        sprite_index= rsprite
	        image_speed= 0.25
	    }
	    con= 1
	}
	if(con == 1) {
	    with(mkid) sprite_index= rsprite
	    ganer+= 0.334
	    if(is_instance_valid(mkid)) mkid.frame= ganer
	    if(mkid.x >= 316) {
	        mkid2= mkid
	        mkid= instance_create(mkid2.x, mkid2.y, 1481/* obj_townnpc_monsterkid1 */)
	        mkid.direction= 0
	        with(mkid) sprite_index= 1399/* spr_mkid_rt */
	        with(mkid2) instance_destroy()
	        con= 2
	    }
	}
	if(con == 4) {
	    con= 5
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */) and GS.interact == 0) {
	    unbuffer++
	    // obj_mainchara
	    with(1570) uncan= 1
	} else  {
	    if(con == 6) {
	        unbuffer= 0
	        // obj_mainchara
	        with(1570) uncan= 0
	    }
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */) and GS.interact == 0 and unbuffer >= 4) {
	    // obj_mainchara
	    with(1570) uncan= 1
	    // obj_dialoguer
	    with(779) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_choicer
	    with(783) instance_destroy()
	    GS.interact= 1
	    with(mkid) {
	        fun= 1
	        scr_npc_watch(0)
	        image_speed= 0.25
	    }
	    GS.msg[0]= "* Yo^1, you wanna see&  Undyne^1, right...?/"
	    GS.msg[1]= "* Climb on my shoulders./%%"
	    if(GS.flag[85] == 1)
	        GS.msg[1]= "* Put up your umbrella and&  climb on my shoulders./%%"
	    scr_regulartext()
	    con= 7
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm7.start((5) / 30.0)
	    GS.plot= 112
	    mkid.fun= 1
	    mkid.sprite_index= 1398/* spr_mkid_prostrate */
	    con= 8
	    GS.interact= 0
	}
	if(con == 10) {
	    GS.phasing= 1
	    GS.interact= 1
	    mkid.solid= 0
	    obj_mainchara.facing= 1
	    GS.facing= 1
	    obj_mainchara.image_speed= 0.25
	    difx= mkid.x - obj_mainchara.x
	    dify= mkid.y - 18 - obj_mainchara.y
	    con= 11
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 11) {
	    obj_mainchara.x+= difx / 10
	    obj_mainchara.y+= dify / 10
	}
	if(con == 12) {
	    con= 13
	    $Alarm4.start((20) / 30.0)
	    difx= 345 - obj_mainchara.x
	    dify= 70 - obj_mainchara.y
	}
	if(con == 14) {
	    con= 15
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 15) {
	    obj_mainchara.x+= difx / 10
	    obj_mainchara.y+= dify / 10
	}
	if(con == 16) {
	    con= 17
	    $Alarm4.start((30) / 30.0)
	    obj_mainchara.image_speed= 0
	}
	if(con == 18) {
	    mkid.image_speed= 0
	    mkid.sprite_index= mkid.rtsprite
	    con= 19
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 20) {
	    side= 1
	    ledgewall.x-= 20
	    mkid.image_speed= 0.25
	    GS.msg[0]= "* Yo^1, you go on ahead./"
	    GS.msg[1]= "* Don\'t worry about me^1.&* I always find a way to&  get through!/%%"
	    if(scr_murderlv() >= 9 and GS.flag[27] == 0) {
	        GS.msg[0]= "* Owww..^1.&* Yo^1, try being a little&  less rough^1, haha./"
	        GS.msg[1]= "* Anyway^1, I\'ll look for&  another way through^1.&* Later!/%%"
	    }
	    scr_regulartext()
	    con= 21
	    GS.phasing= 0
	}
	if(con == 21 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.direction= 180
	    mkid.fun= 0
	    mkid.velocity.x= -5
	    con= 25
	    $Alarm4.start((12) / 30.0)
	}
	if(con == 26) {
	    mkid.velocity.x= 0
	    mkid.fun= 1
	    mkid.frame= 0
	    mkid.image_speed= 0.334
	    mkid.sprite_index= 1390/* spr_mkid_trip_l */
	    con= 49.2
	}
	if(con == 49.2 and mkid.frame >= 19) {
	    mkid.frame= 0
	    mkid.x-= 13
	    mkid.sprite_index= mkid.lsprite
	    con= 22
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 23) {
	    mkid.velocity.x= -3
	    GS.plot= 113
	    GS.flag[91]= 10
	    GS.interact= 0
	    con= 24
	}

func _on_outside_room():
	if(GS.debug == 1) {
	    draw_set_color(65535)
	    draw_set_font(2)
	    draw_text(obj_mainchara.x, obj_mainchara.y - 30, alarm[4])
	    draw_text(obj_mainchara.x, obj_mainchara.y - 10, unbuffer)
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
