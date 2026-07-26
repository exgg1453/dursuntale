# Auto-converted from GameMaker: obj_undynefall
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	waterthing= 0
	con= 0
	shakify= 0
	shaked= 0
	w_active= 0
	w_timer= 0
	pour_index= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 629
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (Someone has meticulously&  cleaned all the slime off of&  this snail.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    con= 10.1
	    w_active= 1
	    thisx= obj_mainchara.x
	    xx= thisx
	}
	if(con == 10.1) GS.interact= 1
	if(con == 11) {
	    GS.interact= 1
	    con= 12
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 12) GS.interact= 1
	if(con == 13) {
	    GS.interact= 1
	    shakify= 2
	    con= 14
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 14) GS.interact= 1
	if(con == 15) {
	    shakify= 0
	    con= 16
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 17) {
	    shakify= 3
	    con= 18
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 19) {
	    shakify= 0
	    visible= 0
	    undyne= instance_create(x - 10, y, 1117/* obj_undynea_actor */)
	    undyne.rsprite= 1425
	    undyne.dsprite= 1427
	    undyne.lsprite= 1426
	    undyne.usprite= 1432
	    undyne.sprite_index= undyne.rsprite
	    con= 20
	    snd_play(106/* snd_noise */)
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 20) GS.interact= 1
	if(con == 21) {
	    undyne.sprite_index= undyne.dsprite
	    con= 22
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 23) {
	    undyne.sprite_index= undyne.usprite
	    con= 24
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 25) {
	    undyne.sprite_index= undyne.rsprite
	    con= 26
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 27) {
	    undyne.sprite_index= undyne.lsprite
	    undyne.velocity.x= -1
	    undyne.image_speed= 0.1
	    con= 28
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 29) {
	    GS.flag[350]= 0
	    GS.plot= 122
	    with(undyne) instance_destroy()
	    GS.interact= 0
	    instance_destroy()
	}
	if(shakify > 0) {
	    if(shaked == 0) {
	        shakememx= x
	        shakememy= y
	        shaked= 1
	    }
	    x= shakememx + random(shakify) - shakify / 2
	    y= shakememy + random(shakify) - shakify / 2
	}

func _gm_event_7_11():
	if(waterthing == 0) {
	    // obj_watercooler
	    with(1298) havewater= 0
	    con= 10
	    waterthing= 1
	    GS.interact= 1
	    // OBJ_WRITER
	    with(782) instance_destroy()
	}

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(w_active == 1) {
	    obj_mainchara.visible= 0
	    w_timer++
	    if(w_timer < 30) {
	        if(xx > thisx - 10) xx--
	        draw_sprite(1034/* spr_maincharal_water */, floor(w_timer / 3), xx, obj_mainchara.y)
	    }
	    if(w_timer >= 30 and w_timer < 120) {
	        pour_index+= 0.2
	        draw_sprite(1038/* spr_mainchara_pourwater */, floor(pour_index), xx, obj_mainchara.y)
	        if(pour_index >= 5.8) pour_index= 4.2
	    }
	    if(w_timer >= 120) {
	        pour_index+= 0.2
	        if(pour_index <= 7.8)
	            draw_sprite(1038/* spr_mainchara_pourwater */, floor(pour_index), xx, obj_mainchara.y)
	        else  {
	            if(xx < thisx) {
	                xx++
	                draw_sprite(1034/* spr_maincharal_water */, floor(w_timer / 3), xx, obj_mainchara.y)
	            } else  {
	                GS.flag[366]= 0
	                // obj_watercooler
	                with(1298) havewater= 0
	                obj_mainchara.visible= 1
	                // obj_mainchara
	                with(1570) {
	                    lsprite= 1046
	                    usprite= 1044
	                    dsprite= 1043
	                    rsprite= 1045
	                }
	                w_active= 0
	                con= 11
	            }
	        }
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
