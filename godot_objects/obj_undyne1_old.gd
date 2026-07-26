# Auto-converted from GameMaker: obj_undyne1_old
extends Node2D

func _ready():
	if(GS.plot > 105) instance_destroy()
	else  {
	    con= 0
	    scale.y= 999
	    mkid= instance_create(260, 100, 1115/* obj_mkid_actor */)
	    undyne= instance_create(500, 100, 1117/* obj_undynea_actor */)
	    undyne.sprite_index= 1455/* spr_undynea_l */
	    mkid.sprite_index= 1397/* spr_mkid_r */
	}
	look= 0
	spinagain= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.interact= 1
	    fade= instance_create(0, 0, 92/* obj_musfadeout */)
	    fade.fadespeed= 0.02
	    GS.currentsong= caster_load("music/undynetheme.ogg")
	    walknoise= caster_load("music/snowwalk.ogg")
	    caster_set_panning(walknoise, 1)
	    caster_loop(walknoise, 1, 1)
	    undyne.velocity.x= -1
	    con= 2
	    obj_fearundynenpc1.w= 1
	    obj_fearundynenpc2.w= 1
	}
	if(con == 2 and undyne.x < 340) {
	    caster_loop(GS.currentsong, 0.5, 0.6)
	    caster_pause(walknoise)
	    undyne.velocity.x= 0
	    con= 2.5
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 3.5) {
	    remembery= undyne.y
	    if(undyne.y >= obj_mainchara.y - 20) {
	        undyne.velocity.y= -1
	        undyne.sprite_index= undyne.usprite
	    }
	    if(undyne.y < obj_mainchara.y - 20) {
	        undyne.velocity.y= 1
	        undyne.sprite_index= undyne.dsprite
	    }
	    con= 4
	}
	if(con == 4 and abs(undyne.y - obj_mainchara.y - 20) < 5) {
	    undyne.velocity.y= 0
	    undyne.sprite_index= undyne.lsprite
	    undyne.direction= 180
	    $Alarm4.start((90) / 30.0)
	    con= 4.1
	}
	if(con == 5.1) {
	    undyne.velocity.x= -0.5
	    con= 4.2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 5.2) {
	    undyne.velocity.x= 0
	    con= 4.3
	    undyne.x= floor(undyne.x)
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 5.3) {
	    undyne.velocity.x= -0.5
	    $Alarm4.start((50) / 30.0)
	    con= 4.4
	}
	if(con == 5.4) {
	    undyne.velocity.x= 0
	    $Alarm4.start((120) / 30.0)
	    con= 5
	}
	if(con == 6) {
	    if(undyne.y > remembery) {
	        undyne.velocity.y= -2
	        undyne.sprite_index= undyne.usprite
	    }
	    if(undyne.y < remembery) {
	        undyne.velocity.y= 2
	        undyne.sprite_index= undyne.dsprite
	    }
	    con= 7
	}
	if(con == 7 and abs(remembery - undyne.y) < 5) {
	    undyne.velocity.y= 0
	    con= 6.1
	    undyne.velocity.x= 1
	    undyne.sprite_index= undyne.rsprite
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 7.1) {
	    undyne.velocity.x= 0
	    con= 6.2
	    $Alarm4.start((50) / 30.0)
	    undyne.frame= 0
	}
	if(con == 7.2) {
	    undyne.sprite_index= undyne.lsprite
	    con= 6.3
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 7.3) {
	    undyne.sprite_index= undyne.rsprite
	    con= 6.4
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 7.4) {
	    caster_resume(walknoise)
	    mus= instance_create(0, 0, 92/* obj_musfadeout */)
	    mus.fadespeed= 0.01
	    GS.currentsong= walknoise
	    tt= instance_create(0, 0, 92/* obj_musfadeout */)
	    tt.fadespeed= 0.01
	    undyne.velocity.x= 1
	    con= 8
	}
	if(con == 8 and undyne.x > 500) {
	    con= 9
	    GS.interact= 0
	}
	if(con == 9 and (collision_rectangle(180, 100, 200, 200, 1570, 0, 1) or collision_rectangle(340, 100, 360, 200, 1570, 0, 1))) {
	    caster_free(-3)
	    GS.currentsong= caster_load("music/waterfall.ogg")
	    GS.interact= 1
	    con= 10
	}
	if(con == 10) {
	    if(obj_mainchara.y > 120) {
	        mkid.y= 90
	        up= 0
	    } else  {
	        mkid.y= 130
	        up= 1
	    }
	    if(obj_mainchara.x < 240) {
	        left= 1
	        mkid.velocity.x= -4
	    } else  {
	        left= 0
	        mkid.velocity.x= 4
	    }
	    con= 11
	}
	if(con == 11 and abs(mkid.x - obj_mainchara.x + 10) < 15) {
	    mkid.velocity.x= 0
	    con= 12
	    if(up == 1) mkid.sprite_index= mkid.usprite
	    if(up == 0) mkid.sprite_index= mkid.dsprite
	    mkid.frame= 0
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 13) {
	    con= 14
	    mkid.sprite_index= mkid.rsprite
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 15) {
	    if(up == 1) mkid.sprite_index= mkid.usprite
	    if(up == 0) mkid.sprite_index= mkid.dsprite
	    con= 16
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 17) {
	    if(up == 1) mkid.sprite_index= mkid.utsprite
	    if(up == 0) mkid.sprite_index= mkid.dtsprite
	    mkid.myinteract= 3
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "* Yo..^1. did you see the&  way she was staring at&  you...?/"
	    GS.msg[1]= "* That.../"
	    GS.msg[2]= "* ... was AWESOME!/"
	    GS.msg[3]= "* I\'m SOOOO jealous!/"
	    GS.msg[4]= "* What\'d you do to get her&  attention...^1?&* Ha ha./"
	    GS.msg[5]= "* C\'mon^1!&* Let\'s go watch her beat&  up some bad guys!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 18
	}
	if(con == 18 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.velocity.x= 4
	    mkid.myinteract= 0
	    mkid.image_speed= 0.3
	    mkid.sprite_index= mkid.rsprite
	    con= 19
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 20) {
	    GS.interact= 0
	    caster_loop(GS.currentsong, 0.8, 1)
	    con= 21
	    GS.plot= 106
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0) con= 1

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
