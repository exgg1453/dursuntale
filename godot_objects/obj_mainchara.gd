# Auto-converted from GameMaker: obj_mainchara
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	if(GS.flag[7] == 1 and GS.flag[287] <= GS.flag[286])
	    GS.flag[287]= GS.flag[286] + 1
	if(GS.flag[6] == 1 and string_lower(GS.charname) != "frisk")
	    GS.flag[6]= 0
	GS.flag[462]= 0
	if(x % 3 == 2) x++
	if(x % 3 == 1) x--
	if(y % 3 == 2) y++
	if(y % 3 == 1) y--
	lastfacing= 0
	nnn= 0
	cutscene= 0
	oldx= x
	oldy= y
	image_speed= 0
	GS.phasing= 0
	facing= GS.facing
	moving= 0
	movement= 1
	GS.currentroom= room
	if(GS.interact == 3 and GS.entrance > 0) {
	    GS.interact= 0
	    if(GS.entrance == 1) {
	        x= obj_markerA.x
	        y= obj_markerA.y
	    }
	    if(GS.entrance == 2) {
	        x= obj_markerB.x
	        y= obj_markerB.y
	    }
	    if(GS.entrance == 4) {
	        x= obj_markerC.x
	        y= obj_markerC.y
	    }
	    if(GS.entrance == 5) {
	        x= obj_markerD.x
	        y= obj_markerD.y
	    }
	    if(GS.entrance == 18) {
	        x= obj_markerr.x
	        y= obj_markerr.y
	    }
	    if(GS.entrance == 19) {
	        x= obj_markers.x
	        y= obj_markers.y
	    }
	    if(GS.entrance == 20) {
	        x= obj_markert.x
	        y= obj_markert.y
	    }
	    if(GS.entrance == 21) {
	        x= obj_markeru.x
	        y= obj_markeru.y
	    }
	    if(GS.entrance == 22) {
	        x= obj_markerv.x
	        y= obj_markerv.y
	    }
	    if(GS.entrance == 23) {
	        x= obj_markerw.x
	        y= obj_markerw.y
	    }
	    if(GS.entrance == 24) {
	        x= obj_markerX.x
	        y= obj_markerX.y
	    }
	}
	dsprite= 1043
	rsprite= 1045
	usprite= 1044
	lsprite= 1046
	if(GS.flag[85] == 1) {
	    dsprite= 1016
	    rsprite= 1018
	    usprite= 1017
	    lsprite= 1019
	}
	if(GS.facing == 0) sprite_index= dsprite
	if(GS.facing == 1) sprite_index= rsprite
	if(GS.facing == 2) sprite_index= usprite
	if(GS.facing == 3) sprite_index= lsprite
	if(GS.flag[480] == 1)
	    image_blend= merge_color(8421504, 16777215, 0.3)
	inwater= 0
	h_skip= 0
	uncan= 0
	m_override= 0

func _process_end(delta: float):
	if(Input.is_action_pressed("move_left") == 0 and Input.is_action_pressed("move_right") == 0 and Input.is_action_pressed("move_down") == 0 and Input.is_action_pressed("move_up") == 0)
	    moving= 0
	if(GS.interact > 0) {
	    moving= 0
	    movement= 0
	} else  movement= 1
	if(xprevious != x or yprevious != y) moving= 1
	if(moving == 0) {
	    image_speed= 0
	    frame= 0
	}
	if(GS.interact == 0 and moving == 1)
	    GS.encounter++
	if(cutscene == 0 and not instance_exists(184/* obj_shaker */)) {
	    view_xview[0]= round(x - view_wview[0] / 2 + 10)
	    view_yview[0]= round(y - view_hview[0] / 2 + 10)
	}
	// stack
	with(0) event_user(0)

func _process(delta: float):
	if(GS.facing == 0) sprite_index= dsprite
	if(GS.facing == 1) sprite_index= rsprite
	if(GS.facing == 2) sprite_index= usprite
	if(GS.facing == 3) sprite_index= lsprite
	if(collision_point(bbox_left - 3, bbox_top - 3, 820, 0, 1) == -4)
	    crumpet= 1
	else  crumpet= 2
	strumpet= bbox_top
	trumpet= bbox_left
	if(GS.inbattle == 1) {
	    if(GS.flag[15] == 0) {
	        instance_create(0, 0, 152/* obj_musfadein */)
	        caster_resume(GS.currentsong)
	    }
	    room_persistent= 0
	    GS.inbattle= 0
	    if(GS.specialbattle == 0) GS.interact= 0
	    z_index= 100
	    if(GS.flag[200] != 0 and GS.flag[201] != GS.kills)
	        GS.flag[GS.flag[200]]+= GS.kills - GS.flag[201]
	}
	if(obj_time.left == 1 and movement == 1) {
	    turned= 1
	    if(xprevious == x + 3) x-= 2
	    else  x-= 3
	    if(moving != 1) frame= 1
	    moving= 1
	    if(GS.debug == 1 and Input.is_key_pressed(8))
	        x-= 5
	    image_speed= 0.2
	    if(obj_time.up == 1 and GS.facing == 2) turned= 0
	    if(obj_time.down == 1 and GS.facing == 0) turned= 0
	    if(turned == 1) GS.facing= 3
	}
	if(obj_time.up == 1 and movement == 1) {
	    turned= 1
	    y-= 3
	    if(GS.debug == 1 and Input.is_key_pressed(8))
	        y-= 5
	    if(moving != 1) frame= 1
	    moving= 1
	    image_speed= 0.2
	    if(obj_time.right == 1 and GS.facing == 1) turned= 0
	    if(obj_time.left == 1 and GS.facing == 3) turned= 0
	    if(turned == 1) GS.facing= 2
	}
	if(obj_time.right == 1 and movement == 1 and Input.is_action_pressed("move_left") == 0) {
	    turned= 1
	    if(xprevious == x - 3) x+= 2
	    else  x+= 3
	    if(GS.debug == 1 and Input.is_key_pressed(8))
	        x+= 5
	    moving= 1
	    image_speed= 0.2
	    if(moving != 1) frame= 1
	    if(obj_time.up == 1 and GS.facing == 2) turned= 0
	    if(obj_time.down == 1 and GS.facing == 0) turned= 0
	    if(turned == 1) GS.facing= 1
	}
	if(obj_time.down == 1 and movement == 1 and Input.is_action_pressed("move_up") == 0) {
	    turned= 1
	    y+= 3
	    if(GS.debug == 1 and Input.is_key_pressed(8))
	        y+= 5
	    if(moving != 1) frame= 1
	    moving= 1
	    image_speed= 0.2
	    if(obj_time.right == 1 and GS.facing == 1) turned= 0
	    if(obj_time.left == 1 and GS.facing == 3) turned= 0
	    if(turned == 1) GS.facing= 0
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */)) event_user(0)
	if(keyboard_multicheck_pressed(2/* UNKNOWN(2) */)) event_user(2)
	with(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 793, 0, 0))
	    event_user(9)
	if(not instance_exists(142/* obj_battler */)) {
	    scr_depth()
	    if(GS.flag[85] == 1 and dsprite == 1016)
	        z_index= 50000 - y * 10 + 300
	}

func _on_alarm_0_timeout():
	if(GS.phasing == 0 and GS.interact == 0) {
	    if(GS.facing == 3) {
	        if(collision_point(bbox_left - 2, bbox_top - 2, 820, 0, 1) == -4) {
	            x= xprevious - 3
	            y= yprevious - 3
	        } else  x= xprevious
	    }
	    if(GS.facing == 0) {
	        if(collision_point(bbox_right + 3, bbox_bottom + 3, 820, 0, 1) == -4) {
	            x= xprevious + 3
	            y= yprevious + 3
	        } else  y= yprevious
	    }
	    if(GS.facing == 2) {
	        x= xprevious
	        y= yprevious - 3
	    }
	    if(GS.facing == 1) {
	        y= yprevious
	        x= xprevious + 3
	    }
	    if(obj_time.down == 1 and obj_time.left == 1) {
	        x= xprevious
	        y= yprevious
	    }
	    moving= 0
	    if(x % 3 != 0) x++
	    if(y % 3 != 0) y--
	}
	if(GS.interact == 5 or GS.interact == 1 or GS.interact == 3 and GS.phasing == 0) {
	    x= xprevious
	    y= yprevious
	}

func _gm_event_5_83():
	if(GS.debug == 1) {
	    GS.interact= 5
	    GS.menuno= 4
	}

func _gm_event_5_76():
	if(GS.debug == 1) script_execute(61/* scr_load */)

func _gm_event_7_12():
	if(GS.interact == 0 and GS.flag[17] == 0) {
	    snd_play(114/* snd_squeak */)
	    GS.interact= 5
	    GS.menuno= 0
	    keyboard_clear(17/* CTRL */)
	}

func _gm_event_7_10():
	if(GS.interact == 0 and uncan == 0 and not instance_exists(1526/* obj_itemswapper */)) {
	    if(GS.facing == 1 and collision_rectangle(x + sprite_width / 2, y + 19, x + sprite_width + 15, y + sprite_height, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + sprite_width / 2, y + sprite_height / 2, x + sprite_width + 15, y + sprite_height, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 3
	            with(interactedobject) script_execute(111/* scr_interact */)
	        }
	    }
	    if(GS.facing == 3 and collision_rectangle(x + sprite_width / 2, y + 19, x - 15, y + sprite_height, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + sprite_width / 2, y + 3 + sprite_height / 2, x - 15, y + sprite_height + 3, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 1
	            with(interactedobject) script_execute(111/* scr_interact */)
	        }
	    }
	    if(GS.facing == 0 and collision_rectangle(x + 4, y + 20, x + sprite_width - 4, y + sprite_height + 15, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + 4, y + 20, x + sprite_width - 4, y + sprite_height + 15, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 2
	            with(interactedobject) script_execute(111/* scr_interact */)
	        }
	    }
	    if(GS.facing == 2 and collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 5, 1368, 0, 1)) {
	        interactedobject= collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 8, 1368, 0, 1)
	        if(interactedobject != -4) {
	            with(interactedobject) facing= 0
	            with(interactedobject) script_execute(111/* scr_interact */)
	        }
	    }
	}

func _on_outside_room():
	if(inwater == 0)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, image_blend, modulate.a)
	if(inwater == 1) {
	    draw_sprite_part_ext(sprite_index, frame, 0, 0, sprite_width, sprite_height - 5, x, y + 5, 1, 1, 16777215, modulate.a)
	    if(obj_mainchara.frame == 1 or obj_mainchara.frame == 3) {
	        snd_play(22/* snd_splash */)
	        mp= 0
	    }
	    draw_sprite(1048/* spr_waterripple */, 0, x, y)
	}
	if(room == 108)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 0, modulate.a)

func _gm_event_9_123():
	if(GS.debug == 1) {
	    GS.flag[7]= 1
	    room_restart()
	}

func _gm_event_9_122():
	if(GS.debug == 1) get_tree().change_scene_to_file("res://godot_rooms/82.tscn")

func _gm_event_9_121():
	if(GS.debug == 1) {
	    GS.interact= 0
	    if(GS.phasing == 0) GS.phasing= 1
	    else  GS.phasing= 0
	}

func _gm_event_9_120():
	if(GS.debug == 1) caster_free(-3)

func _gm_event_9_118():
	if(GS.debug == 1) GS.gold+= 500

func _gm_event_9_85():
	if(GS.debug == 1) {
	    if(GS.flag[465] == 0) {
	        GS.flag[465]= 1
	        image_blend= 16711680
	    } else  {
	        GS.flag[465]= 0
	        image_blend= 65535
	    }
	}

func _gm_event_9_80():
	if(GS.debug == 1) {
	    if(room_speed < 40) room_speed= 200
	    else  room_speed= 30
	}

func _gm_event_9_79():
	if(GS.debug == 1) {
	    GS.interact= 5
	    GS.menuno= 7
	}

func _gm_event_9_77():
	if(GS.debug == 1) {
	    m_override++
	    if(m_override >= 5) GS.flag[26]= 50
	}

func _gm_event_9_73():
	if(GS.debug == 1) {
	    GS.interact= 5
	    GS.menuno= 6
	}

func _gm_event_9_71():
	if(GS.debug == 1) instance_create(0, 0, 1526/* obj_itemswapper */)

func _gm_event_9_54():
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(70)) get_tree().change_scene_to_file("res://godot_rooms/138.tscn")
	    if(Input.is_key_pressed(84)) get_tree().change_scene_to_file("res://godot_rooms/44.tscn")
	    if(Input.is_key_pressed(87)) get_tree().change_scene_to_file("res://godot_rooms/82.tscn")
	    if(Input.is_key_pressed(69)) get_tree().change_scene_to_file("res://godot_rooms/219.tscn")
	    if(Input.is_key_pressed(82)) get_tree().change_scene_to_file("res://godot_rooms/7.tscn")
	    if(Input.is_key_pressed(89)) get_tree().change_scene_to_file("res://godot_rooms/244.tscn")
	}

func _gm_event_9_53():
	nnn+= 5

func _gm_event_9_52():
	if(GS.debug == 1) GS.filechoice= 4

func _gm_event_9_51():
	if(GS.debug == 1) GS.filechoice= 3

func _gm_event_9_50():
	if(GS.debug == 1) GS.filechoice= 2

func _gm_event_9_49():
	if(GS.debug == 1) GS.filechoice= 1

func _gm_event_9_48():
	if(GS.debug == 1) GS.filechoice= 0

func _gm_event_9_46():
	if(GS.debug == 1) room_goto_previous()

func _gm_event_9_45():
	if(GS.debug == 1) room_goto_next()

func _gm_event_9_36():
	if(GS.debug == 1) {
	    GS.battlegroup= 80 + nnn
	    GS.border= 0
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    if(GS.plot == 998) {
	        GS.flag[10]= 0
	        GS.flag[11]= 0
	        GS.flag[12]= 0
	        GS.flag[13]= 0
	        GS.entrance= 0
	        GS.battlegroup= 82
	        obj_mainchara.z_index= -600
	        if(not instance_exists(142/* obj_battler */)) instance_create(0, 0, 142/* obj_battler */)
	    }
	}

func _gm_event_9_35():
	if(GS.debug == 1) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 145/* obj_battlerstory */)
	}

func _gm_event_9_34():
	if(GS.debug == 1) GS.at= 999

func _gm_event_9_33():
	if(GS.debug == 1 and instance_exists(1387/* obj_encountererparent */)) {
	    // obj_encountererparent
	    with(1387) steps+= 100
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
