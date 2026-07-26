# Auto-converted from GameMaker: obj_undyneencounter4
extends Node2D

func _ready():
	con= 0
	view_yview[0]= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and obj_mainchara.x > x and con == 0) {
	    con= 2
	    musfade= instance_create(0, 0, 92/* obj_musfadeout */)
	    musfade.fadespeed= 0.01
	    if(instance_exists(1046/* obj_speartilegen */)) {
	        // obj_speartilegen
	        with(1046) instance_destroy()
	    }
	    undyne= instance_create(view_xview[0] - 420, 100, 1117/* obj_undynea_actor */)
	    undyne.rsprite= 1456
	    undyne.direction= 0
	    undyne.sprite_index= undyne.rsprite
	}
	if(instance_exists(1570/* obj_mainchara */) and con == 2 and obj_mainchara.x < x - 320 and GS.interact == 0) {
	    con= 1.5
	    $Alarm4.start((30) / 30.0)
	    GS.interact= 1
	    curview= view_xview[0]
	    obj_mainchara.cutscene= 1
	}
	if(con == 2.5) con= 3
	if(con == 3) {
	    view_xview[0]--
	    if(view_xview[0] < curview - 50) {
	        con= 3.1
	        $Alarm4.start((140) / 30.0)
	    }
	}
	if(con == 3.1) {
	    undyne.fun= 3
	    undyne.velocity.x= 1
	    undyne.image_speed= 0.1
	}
	if(con == 4.1) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    con= 5
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 6) {
	    con= 7
	    snd_play(13/* snd_spearappear */)
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 8) {
	    snd_play(20/* snd_arrow */)
	    rr= 1
	    repeat(3)  {
	        ar= instance_create(170 + rr * 6 + random(3), -223 + rr * 3 + random(6), 1363/* obj_npc_marker */)
	        ar.visible= 1
	        ar.sprite_index= 1449/* spr_undynespear */
	        ar.rotation_degrees= -90
	        ar.velocity.y= 24
	        ar.friction= -0.3
	        rr++
	    }
	    con= 9
	}
	if(con == 9 and ar.y > obj_mainchara.y) {
	    snd_play(14/* snd_spearrise */)
	    instance_create(0, 0, 118/* obj_flasher */)
	    scr_shake(2, 2, 2)
	    con= 10
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 11) {
	    GS.phasing= 1
	    con= 12
	    $Alarm4.start((70) / 30.0)
	    dir= 0
	    int= 1
	    tspeed= 1
	    tgrav= 0.2
	}
	if(con == 12) {
	    if(dir == 0) {
	        memx= random(int) - int / 2
	        memy= random(int) - int / 2
	        int+= 0.08
	        dir= 1
	    } else  {
	        memx= -memx
	        memy= -memy
	        dir= 0
	    }
	    obj_mainchara.x+= memx
	    obj_mainchara.y+= memy
	    tile_layer_shift(1000010, memx, memy)
	}
	if(con == 13) {
	    con= 14
	    $Alarm4.start((110) / 30.0)
	}
	if(con == 14 or con == 15) {
	    tspeed+= tgrav
	    GS.border= 0
	    GS.flag[15]= 0
	    GS.flag[16]= 0
	    SCR_BORDERSETUP()
	    tile_layer_shift(1000010, 1, tspeed)
	    obj_mainchara.x++
	    obj_mainchara.y+= tspeed - 0.8
	    obj_mainchara.rotation_degrees-= 0.5
	    view_yview[0]+= 2
	    f= instance_create(0, 0, 150/* obj_whitefader */)
	    f.tspeed= 0.001
	}
	if(con == 15) {
	    snd_play(22/* snd_splash */)
	    // obj_whitefader
	    with(150) instance_destroy()
	    $Alarm4.start((3) / 30.0)
	    con= 16
	}
	if(con == 17) {
	    g= instance_create(0, 0, 1363/* obj_npc_marker */)
	    g.visible= 1
	    obj_mainchara.x= 20
	    obj_mainchara.y= 20
	    obj_mainchara.cutscene= 0
	    g.z_index= 10
	    g.sprite_index= 996/* spr_pixblk */
	    g.scale.x= 100
	    g.scale.y= 100
	    tempmusic= caster_load("music/musicbox.ogg")
	    con= 18
	    tempvol= 0
	    temppitch= 0.7
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 19) {
	    caster_loop(tempmusic, tempvol, 0.7)
	    GS.typer= 35
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "It sounds like it&came from over&here.../"
	    GS.msg[1]= "Oh^1! You\'ve fallen&down^1, haven\'t you.../"
	    GS.msg[2]= "Are you okay?/"
	    GS.msg[3]= "Here^1, get up.../"
	    GS.msg[4]= ".../"
	    GS.msg[5]= GS.charname + "^1, huh?/"
	    GS.msg[6]= "That\'s a nice name./%%"
	    instance_create(50, 80, 782/* OBJ_WRITER */)
	    con= 20
	}
	if(con == 19 or con == 20) {
	    if(tempvol < 1) tempvol+= 0.02
	    caster_set_volume(tempmusic, tempvol)
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 36
	    GS.msg[0]= " My name is     %%"
	    instance_create(50, 80, 782/* OBJ_WRITER */)
	    q= instance_create(0, 0, 150/* obj_whitefader */)
	    q.tspeed= 0.01
	    con= 21
	}
	if(con == 21) {
	    if(tempvol > 0) tempvol-= 0.008
	    temppitch+= 0.004
	    caster_set_volume(tempmusic, tempvol)
	    caster_set_pitch(tempmusic, temppitch)
	    if(tempvol <= 0.009) {
	        caster_free(tempmusic)
	        con= 22
	    }
	}
	if(con == 22) room_goto_next()

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
