# Auto-converted from GameMaker: obj_core_laserswitch
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	con= 0
	pcon= 0
	if(GS.plot > 180 or GS.flag[7] == 1) {
	    meswitch= scr_marker(x, y, 1854)
	    with(meswitch) z_index= 700000
	    with(meswitch) image_speed= 0.2
	    instance_destroy()
	    exit
	} else  {
	    if(GS.plot > 180) {
	        sprite_index= 1854/* spr_onoffswitch_on */
	        con= 99
	    } else  {
	        ff= instance_create(280, 80, 1183/* obj_kitchenforcefield */)
	        ff.scale.y= 5
	        ff.basic= 0
	        pcon= 40
	    }
	    image_speed= 0.25
	    fader= 0
	    remhp= GS.hp
	    if(room == 192) z_index= 700000
	    exit
	}

func _process(delta: float):
	if(myinteract == 1 and con == 0) {
	    snd_play(106/* snd_noise */)
	    obj_bluelaser_o.velocity.x= -6
	    obj_bluelaser_o.active= 1
	    obj_bluelaser_o.remembervelocity.x= 6
	    con= 1
	    sprite_index= 1854/* spr_onoffswitch_on */
	    fader= 1
	    // obj_kitchenforcefield
	    with(1183) canttalk= 1
	    ff2= instance_create(160, 80, 1183/* obj_kitchenforcefield */)
	    ff2.scale.y= 5
	    GS.plot= 180
	}
	if(fader == 1 and is_instance_valid(ff)) {
	    with(ff) {
	        canttalk= 1
	        if(is_instance_valid(solid1)) {
	            with(solid1) instance_destroy()
	        }
	        modulate.a-= 0.1
	    }
	    if(ff.modulate.a < 0.1) {
	        with(ff) instance_destroy()
	    }
	}
	if(pcon == 40 and obj_mainchara.x > 540 and GS.interact == 0 and pcon == 40) {
	    GS.interact= 1
	    pcon= 41
	    snd_play(104/* snd_phone */)
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Oh my god^1, are&  you okay?/"
	    GS.msg[3]= "\\E8* I..^1. I\'m sorry^1, I&  gave you the&  wrong order./"
	    GS.msg[4]= "\\E8* .../"
	    GS.msg[5]= "\\E6* E-everything\'s fine^1,&  okay?/"
	    GS.msg[6]= "* L-let\'s just keep&  heading to the&  right./"
	    GS.msg[7]= "\\TS \\F0 \\T0 %"
	    GS.msg[8]= "* Click.../%%"
	    if(remhp > GS.hp) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Oh my god..^1.&* Are you hurt?/"
	        GS.msg[3]= "\\E8* I..^1. I\'m so sorry^1,&  I... I gave you&  the wrong order./"
	        GS.msg[4]= "\\E8* .../"
	        GS.msg[5]= "\\E6* Everything\'s going&  to be fine^1, okay?/"
	        GS.msg[6]= "* L-let\'s just keep&  heading to the&  right./"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	    }
	    scr_regulartext()
	}
	if(pcon == 41 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.plot= 181
	    pcon= 42
	    GS.interact= 0
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
