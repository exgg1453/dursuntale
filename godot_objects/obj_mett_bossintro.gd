# Auto-converted from GameMaker: obj_mett_bossintro
extends Node2D

func _ready():
	instance_create(240, 116, 408/* obj_mettb_body */)
	obj_mettb_body.myblend= 0
	obj_mettb_body.myalpha= 0
	obj_mettb_body.sineron= 0
	obj_mettb_body.z_index= -1000
	con= 0
	cloud= 0
	cltimer= 0
	otr= 0
	flasher= 0
	flashamt= 0
	blacker= 1
	GS.batmusic= caster_load("music/mettaton_ex.ogg")
	presong= caster_load("music/mettaton_pretransform.ogg")
	flashsound= caster_load("music/create.ogg")
	x= 200

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    con= 0.1
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 1.1) {
	    obj_mettb_body.myblend= 0
	    obj_mettb_body.myalpha= 0
	    obj_mettb_body.sineron= 0
	    n= instance_create(10, -100, 1363/* obj_npc_marker */)
	    n.visible= 1
	    n.sprite_index= 555/* spr_stagelight_bad */
	    n.scale.x= 2
	    n.scale.y= 2
	    n.image_speed= 0
	    n.velocity.y= 2
	    n2= instance_create(630, -100, 1363/* obj_npc_marker */)
	    n2.visible= 1
	    n2.sprite_index= 555/* spr_stagelight_bad */
	    n2.scale.x= -2
	    n2.scale.y= 2
	    n2.image_speed= 0
	    n2.velocity.y= 2
	    n.z_index= 11
	    n2.z_index= 11
	    con= 1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2) {
	    snd_play(106/* snd_noise */)
	    n.velocity.y= 0
	    n2.velocity.y= 0
	    con= 3
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 4) {
	    snd_play(106/* snd_noise */)
	    n.frame= 1
	    n2.frame= 1
	    cloud= 1
	    con= 5
	    $Alarm4.start((60) / 30.0)
	    alpha= 0
	}
	if(cloud == 1) {
	    cltimer--
	    if(cltimer < 1) {
	        ccc= instance_create(160, 0, 404/* obj_stagecloud */)
	        if(otr == 0) {
	            otr= 1
	            ccc.velocity.x= -ccc.velocity.x
	        } else  otr= 0
	        cltimer= 9
	    }
	}
	if(con == 6) {
	    if(obj_mettb_body.myalpha == 0) caster_loop(presong, 0.7, 0.85)
	    obj_mettb_body.myalpha+= 0.015
	    if(obj_mettb_body.myalpha >= 1) con= 7
	}
	if(con == 7) {
	    GS.msc= 0
	    GS.typer= 51
	    GS.msg[0]= "Ohhhh my./"
	    GS.msg[1]= "If you flipped my&switch, that can&only mean one&thing./"
	    GS.msg[2]= "You\'re desperate&for the premiere&of my new body./"
	    GS.msg[3]= "How rude.../"
	    GS.msg[4]= "Lucky for you,&I\'ve been aching&to show this off&for a long time./"
	    GS.msg[5]= "So..^1. as thanks^1,&I\'ll give you a&handsome reward./"
	    GS.msg[6]= "I\'ll make your&last living&moments.../%%"
	    scr_blcon(220, 250, 4)
	    blcon.z_index= -6000
	    writer.z_index= -6001
	    blcon.y+= 20
	    con= 7.1
	    vol= 0.7
	}
	if(con == 7.1 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno > 6) {
	    if(vol > 0) vol-= 0.01
	    caster_set_volume(presong, vol)
	}
	if(con == 7.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    flasher= 1
	    flashamt= 0
	    con= 8
	}
	if(con == 9) {
	    con= 10
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 11) {
	    GS.msg[0]= "ABSOLUTELY beautiful!/%%"
	    scr_blcon(obj_mettb_body.x - 260, 60, 1)
	    con= 12
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.monster[0]= 0
	    GS.monster[1]= 0
	    GS.monsterinstance[0]= 0
	    // obj_mettatonb_third
	    with(299) instance_destroy()
	    GS.monstertype[0]= 51
	    GS.msc= 0
	    obj_mettb_body.z_index= 10
	    GS.monsterinstance[0]= instance_create(210, 60, 403/* obj_mettatonex */)
	    GS.msg[0]= "* Mettaton EX makes his premiere!"
	    caster_loop(GS.batmusic, 1, 0.95)
	    GS.mnfight= 3
	    GS.myfight= -1
	    GS.bmenuno= 0
	    con= 13
	    instance_destroy()
	}

func _on_outside_room():
	if(blacker == 1) {
	    draw_set_color(0)
	    draw_rectangle(0, 240, 640, 480, 0)
	}
	if(con == 8 and (flasher == 1 or flasher == 2)) {
	    if(flasher == 1) flashamt+= 0.2
	    if(flashamt > 2) {
	        caster_stop(presong)
	        caster_play(flashsound, 1, 1)
	        flasher= 2
	        with(n) instance_destroy()
	        with(n2) instance_destroy()
	        cloud= 0
	        // obj_stagecloud
	        with(404) instance_destroy()
	        mb= 408
	        mb.sineron= 1
	        mb.myblend= 16777215
	        mb.myalpha= 1
	        blacker= 0
	    }
	    if(flasher == 2) flashamt-= 0.4
	    if(flashamt < 0) {
	        flasher= 0
	        con= 9
	    }
	    draw_set_color(16777215)
	    draw_set_alpha(flashamt)
	    draw_rectangle(-1, -1, 700, 700, 0)
	    draw_set_alpha(1)
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
