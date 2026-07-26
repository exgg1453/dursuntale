# Auto-converted from GameMaker: obj_mettdestroyed_event
extends Node2D

func _ready():
	con= 1
	if(GS.plot > 193) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.plot >= 192) {
	        sl= instance_create(140, 840, 8/* obj_solidwide */)
	        sl2= instance_create(145, 710, 8/* obj_solidwide */)
	        brokemett= scr_marker(140, 700, 1658)
	        with(brokemett) scr_depth()
	        if(GS.flag[425] == 0) {
	            brokemett.sprite_index= 1668/* spr_mett_o_upperbody_light */
	            brokemett.x+= 6
	            brokemett.y-= 3
	        }
	        ii= instance_create(140, 700, 1344/* obj_readable_room1 */)
	        ii= instance_create(160, 700, 1344/* obj_readable_room1 */)
	        al2= instance_create(150, 710, 1170/* obj_alphys_npc */)
	        al2.sprite_index= al2.utsprite
	        al2.fun= 1
	        con= 587458478547
	    } else  {
	        sl= instance_create(140, 840, 8/* obj_solidwide */)
	        brokemett= scr_marker(140, 700, 1658)
	        with(brokemett) scr_depth()
	        if(GS.flag[425] == 0) {
	            brokemett.sprite_index= 1668/* spr_mett_o_upperbody_light */
	            brokemett.x+= 6
	            brokemett.y-= 3
	        }
	        ii= instance_create(140, 700, 1344/* obj_readable_room1 */)
	        ii= instance_create(160, 700, 1344/* obj_readable_room1 */)
	        sl2= instance_create(145, 710, 8/* obj_solidwide */)
	        obj_mainchara.x= 150
	        obj_mainchara.y= 750
	        GS.facing= 2
	        GS.interact= 1
	        obj_mainchara.cutscene= 1
	        view_object[0]= 1570
	    }
	    x_maroon= merge_color(0, 128, 0.35)
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    // obj_npc_marker
	    with(1363) visible= 0
	    with(brokemett) visible= 1
	    view_yview[0]+= 20
	    con= 2
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2) GS.interact= 1
	if(con == 3) {
	    snd_play(13/* snd_spearappear */)
	    con= 3.1
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 4.1) con= 4
	if(con == 4) {
	    GS.facechoice= 6
	    GS.typer= 47
	    GS.msc= 0
	    GS.faceemotion= 6
	    GS.msg[0]= "* I..^1. I managed to open&  the lock^1!&* Are you two.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    al= instance_create(obj_mainchara.x + 40, obj_mainchara.y + 75, 1170/* obj_alphys_npc */)
	    al.sprite_index= al.usprite
	    al.velocity.y= -3
	    al.fun= 1
	    al.image_speed= 0.25
	    con= 6
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 7) {
	    al.speed= 0
	    al.image_speed= 0
	    con= 8
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 9) {
	    GS.flag[430]= 1
	    GS.faceemotion= 0
	    GS.msg[0]= "* Oh my god./%%"
	    con= 10
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.y= -3.5
	    al.velocity.x= -4
	    al.image_speed= 0.334
	    con= 11
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 12) {
	    al.speed= 0
	    al.image_speed= 0
	    con= 13
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 14) {
	    GS.faceemotion= 0
	    GS.msg[0]= "* Mettaton!/"
	    GS.msg[1]= "\\E1* Mettaton^1, are you.../%%"
	    con= 15
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 15 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 16
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 17) {
	    con= 18
	    al.sprite_index= al.rsprite
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 19) {
	    GS.faceemotion= 6
	    GS.msg[0]= "* H..^1. hey.../"
	    GS.msg[1]= "* D..^1. don\'t worry&  about it.../"
	    GS.msg[2]= "* I can always.../"
	    GS.msg[3]= "\\E5* I can always build&  a different robot!/"
	    GS.msg[4]= "\\E6* .../"
	    GS.msg[5]= "\\E5* Why don\'t you go&  on ahead?/%%"
	    if(GS.flag[425] == 0) {
	        GS.faceemotion= 4
	        GS.msg[0]= "* ... thank GOD^1, it\'s just&  the batteries./"
	        GS.msg[1]= "\\E9* Mettaton^1, if you were&  gone^1, I would have..^1.&* I would have.../"
	        GS.msg[2]= "\\E8* .../"
	        GS.msg[3]= "\\E6* I m-mean^1, h-hey^1, it\'s&  n-^1no problem^1, you&  know?/"
	        GS.msg[4]= "\\E5* He\'s just a robot^1, if&  you messed it up^1, I&  c-could always.../"
	        GS.msg[5]= "\\E6* J-just build another./"
	        GS.msg[6]= "\\E4* .../"
	        GS.msg[7]= "* Why don\'t you go&  on ahead?/%%"
	    }
	    con= 20
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.sprite_index= al.utsprite
	    view_object[0]= 1570
	    obj_mainchara.cutscene= 1
	    con= 21
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 21) view_yview[0]+= 2
	if(con == 22) {
	    obj_mainchara.cutscene= 0
	    GS.plot= 193
	    al2= instance_create(al.x, al.y, 1170/* obj_alphys_npc */)
	    al2.sprite_index= al.utsprite
	    al2.fun= 1
	    with(al) instance_destroy()
	    con= 27
	    GS.interact= 0
	}

func _on_outside_room():
	draw_set_color(x_maroon)
	draw_rectangle(140, 840, 180, 980, 0)

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
