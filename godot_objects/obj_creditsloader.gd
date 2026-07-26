# Auto-converted from GameMaker: obj_creditsloader
extends Node2D

func _ready():
	credno= 0
	credamt= 0
	credfile= file_text_open_read(working_directory + "credits.txt")
	thiscred= " "
	while(thiscred != "%%%") {
	    creditname[credamt]= file_text_read_string(credfile)
	    thiscred= creditname[credamt]
	    file_text_readln(credfile)
	    credamt++
	}
	file_text_close(credfile)
	cy= 10
	rounded= 0
	memory= 0
	st_t= 0
	st_y= 500
	st_f= 0
	memswitch= 0
	mytimer= 0
	hitno= 0
	hitname[0]= ""
	songed= 0
	active= 0
	drawbar= 0
	GS.inbattle= 1
	ting= 0
	ini_open("undertale.ini")
	curf= ini_read_real("EndF", "EndF", 0)
	ini_close()
	if(curf == 0) {
	    horror= caster_load("music/yourbestfriend_3.ogg")
	    caster_loop(horror, 0.7, 1)
	    asriel= instance_create(272, 16, 569/* obj_asriel_body */)
	    a_con= 1
	    $Alarm4.start((30) / 30.0)
	} else  {
	    a_con= 7
	    a2= id
	}

func _gm_event_2_5():
	if(memory == 0) {
	    if(rounded == 0) {
	        cb= instance_create(100, choose(40), 1700/* obj_creditboss */)
	        cb.type= choose(1)
	    }
	    if(rounded == 1) {
	        cb= instance_create(100, choose(260), 1700/* obj_creditboss */)
	        cb.type= choose(1)
	    }
	    if(rounded == 2) {
	        cb= instance_create(100, choose(40), 1700/* obj_creditboss */)
	        cb.type= choose(0)
	    }
	    if(rounded == 3) {
	        cb= instance_create(100, choose(260), 1700/* obj_creditboss */)
	        cb.type= choose(0)
	    }
	    $Alarm5.start((35) / 30.0)
	    rounded++
	    if(rounded == 4) rounded= 0
	}
	if(memory == 1) {
	    i= 0
	    xx= 10 + floor(random(6)) * 20
	    repeat(4)  {
	        event_user(0)
	        cb.x= xx
	        xx+= 90
	        cb.y= -40
	        cb.velocity.y= 0.5
	        cb.gravity= 0.1
	        i++
	    }
	    $Alarm5.start((15) / 30.0)
	}
	if(memory == 2) {
	    i= 0
	    while(i < 12) {
	        event_user(0)
	        cb.x= -200
	        cb.y= 10 + i * 40
	        cb.velocity.x= 9
	        i++
	    }
	    i= 0
	    while(i < 12) {
	        event_user(0)
	        cb.x= get_viewport_rect().size.x + 200
	        cb.y= 30 + i * 40
	        cb.velocity.x= -9
	        i++
	    }
	    $Alarm5.start((50) / 30.0)
	}
	if(memory == 4) {
	    if(memswitch == 0) {
	        i= 0
	        while(i < 12) {
	            event_user(0)
	            cb.x= 10 + i * 60
	            with(cb) width= string_width(text)
	            cb.y= -300 + cb.width
	            cb.rotation_degrees= 90
	            cb.velocity.x= 2
	            cb.action= 3
	            cb.velocity.y= 6
	            i++
	        }
	        i= 0
	        while(i < 12) {
	            event_user(0)
	            with(cb) width= string_width(text)
	            cb.rotation_degrees= 90
	            cb.x= 40 + i * 60
	            cb.y= -300 - cb.width
	            cb.velocity.x= -2
	            cb.action= 3
	            cb.velocity.y= 6
	            i++
	        }
	    }
	    if(memswitch == 1) {
	        i= 0
	        while(i < 12) {
	            event_user(0)
	            cb.x= 10 + i * 60
	            with(cb) width= string_width(text)
	            cb.y= -300 + cb.width
	            cb.rotation_degrees= -90
	            cb.velocity.x= -2
	            cb.action= 3
	            cb.velocity.y= 6
	            i++
	        }
	        i= 0
	        while(i < 12) {
	            event_user(0)
	            with(cb) width= string_width(text)
	            cb.rotation_degrees= -90
	            cb.x= 40 + i * 60
	            cb.y= -300 - cb.width
	            cb.velocity.x= 2
	            cb.action= 3
	            cb.velocity.y= 6
	            i++
	        }
	    }
	    memory= 4
	    if(memswitch == 1) memswitch= 0
	    else  memswitch= 1
	    $Alarm5.start((78) / 30.0)
	}
	if(memory == 6) {
	    if(rounded == 0) {
	        cb= instance_create(100, choose(40), 1700/* obj_creditboss */)
	        cb.type= choose(1)
	    }
	    if(rounded == 1) {
	        cb= instance_create(100, choose(260), 1700/* obj_creditboss */)
	        cb.type= choose(1)
	    }
	    if(rounded == 2) {
	        cb= instance_create(100, choose(40), 1700/* obj_creditboss */)
	        cb.type= choose(0)
	    }
	    if(rounded == 3) {
	        cb= instance_create(100, choose(260), 1700/* obj_creditboss */)
	        cb.type= choose(0)
	    }
	    $Alarm5.start((25) / 30.0)
	    rounded++
	    if(rounded == 4) rounded= 0
	}
	if(memory == 7) {
	    cb= instance_create(-300, 360, 1700/* obj_creditboss */)
	    cb.velocity.x= 4
	    cb.type= 3
	    cb= instance_create(950, 120, 1700/* obj_creditboss */)
	    cb.velocity.x= -4
	    cb.type= 3
	    $Alarm5.start((75) / 30.0)
	}

func _gm_event_2_4():
	a_con++

func _gm_event_7_10():
	if(credno < credamt - 1) {
	    cb= instance_create(x, y, 1701/* obj_creditbullet */)
	    cb.text= creditname[credno]
	    credno++
	}

func _on_outside_room():
	if(a_con == 4) {
	    with(asriel) instance_destroy()
	    a2= scr_marker(286, 140, 2296)
	    a2.z_index= 100000
	    a2.scale.x= 2
	    a2.scale.y= 2
	    a2.frame= 0
	    a_con= 5
	    $Alarm4.start((60) / 30.0)
	}
	if(a_con == 6) {
	    GS.typer= 85
	    GS.msc= 0
	    GS.msg[0]= "\\XI mean^1, we haven\'t&even done the\\R &Special Thanks\\X yet.../"
	    GS.msg[1]= "Ready^1?&Let\'s end all of&this for good!/%%"
	    scr_blcon_x(a2.x + 80, a2.y)
	    a_con= 7
	}
	if(a_con == 7 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    a2.frame= 1
	if(a_con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    a_con= 8
	    $Alarm4.start((50) / 30.0)
	    ch= instance_create(300, 300, 1699/* obj_creditsheart */)
	    snd_play(21/* snd_impact */)
	    specialfade= 15
	    drawbar= 1
	}
	if(a_con == 8) a2.modulate.a-= 0.06
	if(a_con == 9) {
	    $Alarm5.start((10) / 30.0)
	    active= 1
	    a_con= 10
	}
	if(a_con == 2) {
	    a_con= 3
	    GS.typer= 86
	    GS.msc= 0
	    GS.msg[0]= "Ha ha ha ha.../"
	    GS.msg[1]= "\\M1Did you REALLY&think it was&OVER!?!?/%%"
	    scr_blcon_x(asriel.x + 80, asriel.y - 20)
	}
	if(a_con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(horror)
	    a_con= 4
	    instance_create(0, 0, 118/* obj_flasher */)
	    snd_play(30/* snd_break2 */)
	}
	if(active == 1) mytimer++
	if(mytimer == 10) {
	    lastsong= caster_load("music/end/express_myogg")
	    caster_play(lastsong, 1, 1)
	    memory= 0
	    $Alarm5.start((1) / 30.0)
	}
	if(credno >= 60 and memory == 0) {
	    $Alarm5.start((90) / 30.0)
	    memory= 2
	}
	if(memory == 2 and credno >= 252) {
	    $Alarm5.start((-1) / 30.0)
	    cb= instance_create(320, 240, 1700/* obj_creditboss */)
	    cb.$Alarm0.start((60) / 30.0)
	    cb.type= 2
	    memory= 3
	}
	if(memory == 3 and not instance_exists(1700/* obj_creditboss */)) {
	    $Alarm5.start((60) / 30.0)
	    memory= 4
	}
	if(memory == 4 and credno >= 596) {
	    memory= 7
	    $Alarm5.start((100) / 30.0)
	}
	if(memory == 7 and credno >= 716) {
	    memory= 6
	    $Alarm5.start((160) / 30.0)
	}
	if(memory == 6 and credno >= 881) {
	    memory= -2
	    st_y= 500
	    st_t= 0
	    st_f= 1
	    $Alarm5.start((-1) / 30.0)
	}
	if(drawbar == 1) {
	    draw_set_font(2)
	    draw_set_color(65280)
	    draw_set_halign(1)
	    draw_set_alpha(specialfade)
	    draw_text_transformed(320, 20, "SPECIAL THANKS", 2, 2, 0)
	    draw_set_halign(0)
	    specialfade-= 0.05
	    draw_set_alpha(1)
	    draw_sprite(15/* spr_hpname */, 0, 260, 450)
	    draw_sprite_ext(837/* spr_infinitysign */, 0, 296, 452, 2, 2, 0, 65535, 1)
	}
	if(memory == -2 and not instance_exists(1701/* obj_creditbullet */)) {
	    drawbar= 0
	    st_t++
	    if(st_t < 150 and st_y > 50) {
	        st_f+= 0.25
	        st_y-= st_f
	        st_f2= 1
	    }
	    if(st_t > 240 and st_y < 500) {
	        vol= 0.8
	        l_alpha= 0
	        st_y+= st_f2
	        st_f2+= 0.25
	        st_f3= 0
	        st_y2= 500
	    }
	    draw_set_halign(1)
	    draw_set_font(2)
	    draw_set_color(65535)
	    if(hitno > 0) {
	        draw_text_transformed(320, st_y, "TOUCHED CREDITS", 2, 2, 0)
	        i= 0
	        while(i < hitno) {
	            draw_text_transformed(320, st_y + 40 + i * 20, hitname[i], 1, 1, 0)
	            i++
	        }
	    }
	    if(hitno <= 0) {
	        ini_open("undertale.ini")
	        ini_write_real("reset", "s_key", 1)
	        ini_close()
	        draw_text_transformed(320, st_y, "Incredible work.#Somewhere, felt a#door opening...!", 4, 4, 0)
	    }
	    if(st_t >= 320) {
	        draw_set_color(16777215)
	        st_y2-= 2
	        draw_text_transformed(320, st_y2, "Thanks to friends and#family for supporting us.#And UNDERTALE TEAM thanks#you, the player, from#the bottom of our hearts.#Without you, all of this#would be impossible.# #Good night.", 2, 2, 0)
	        if(st_y2 <= -400) {
	            if(st_y2 >= -410) l_alpha= 0
	            z_index= -9000
	            draw_set_color(0)
	            draw_set_alpha(l_alpha)
	            l_alpha+= 0.00833333333333333
	            draw_rectangle(-10, -10, 999, 999, 0)
	            if(st_y2 <= -830) {
	                caster_free(lastsong)
	                if(GS.flag[512] == 0) get_tree().change_scene_to_file("res://godot_rooms/285.tscn")
	                else  get_tree().change_scene_to_file("res://godot_rooms/286.tscn")
	            }
	        }
	    }
	    draw_set_halign(0)
	}
	if(ting == 1) {
	    snd_stop(118)
	    snd_play(118/* snd_block2 */)
	    ting= 0
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
