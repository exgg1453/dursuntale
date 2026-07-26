# Auto-converted from GameMaker: obj_napstablookdate
extends Node2D

func _ready():
	if(GS.flag[7] == 0 and scr_murderlv() < 10) {
	    nap= instance_create(210, 70, 1132/* obj_napstablook_actor */)
	    scale.x= 4
	    if(GS.flag[93] > 0) y= 20
	    con= 0
	    wavein= 0
	    exit
	} else  {
	    instance_destroy()
	    exit
	}

func _gm_event_2_6():
	// obj_napstablookdate_music
	with(1134) fadeout= 1
	GS.flag[94]= 0

func _gm_event_2_5():
	event_user(1)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    con= 2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 3) {
	    nap.direction= 270
	    bl= instance_create(nap.x + 2, nap.y - 10, 1337/* obj_cosmeticblcon */)
	    con= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5) {
	    with(bl) instance_destroy()
	    con= 6
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 7) {
	    GS.msg[0]= "* oh..^1. hey..^1. you..^1./"
	    GS.msg[1]= "* followed me..^1.&* into my house.../"
	    GS.msg[2]= "* ..^1.&* m-make yourself at home???/%%"
	    if(GS.flag[36] > 0) {
	        GS.msg[0]= "* oh..^1.&* you really came.../"
	        GS.msg[1]= "* sorry^1, i...&* wasn\'t expecting that./"
	        GS.msg[2]= "* it\'s not much^1, but make&  yourself at home./%%"
	    }
	    GS.flag[93]= 1
	    scr_regulartext()
	    con= 8
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 9
	    if(GS.flag[36] <= 0) nap.direction= 90
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    nap.direction= 180
	    con= 12
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 12) GS.interact= 1
	if(con == 13) {
	    GS.msg[0]= "* oh..^1. are you hungry.../"
	    GS.msg[1]= "* i can get you something&  to eat.../%%"
	    scr_regulartext()
	    con= 14
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    nap.velocity.x= -2
	    con= 15
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 16) {
	    obj_mainchara.velocity.y= 3
	    obj_mainchara.image_speed= 0.25
	    con= 17
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 18) {
	    obj_mainchara.image_speed= 0
	    obj_mainchara.frame= 0
	    obj_mainchara.velocity.y= 0
	    con= 19
	    $Alarm4.start((26) / 30.0)
	}
	if(con == 20) {
	    nap.velocity.x= 0
	    nap.direction= 90
	    nap.velocity.y= -2
	    con= 21
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 22) {
	    nap.velocity.y= 0
	    nap.direction= 90
	    nap.speed= 0.01
	    con= 23
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 24) {
	    nap.direction= 270
	    nap.speed= 0
	    $Alarm4.start((30) / 30.0)
	    con= 25
	}
	if(con == 26) {
	    GS.msc= 615
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 27
	}
	if(con == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 28
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 29) {
	    GS.msc= 617
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 30
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(nap) {
	        move_towards_point(220, 100, 4)
	        sprite_index= rsprite
	    }
	    // obj_mainchara
	    with(1570) {
	        move_towards_point(120, 100, 2)
	        sprite_index= rsprite
	        image_speed= 0.25
	    }
	    con= 31
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 32) {
	    nap.speed= 0
	    obj_mainchara.x= round(obj_mainchara.x)
	    obj_mainchara.y= round(obj_mainchara.y)
	    obj_mainchara.speed= 0
	    obj_mainchara.image_speed= 0
	    obj_mainchara.frame= 0
	    con= 33
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 34) {
	    nap.direction= 180
	    con= 35
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 36) {
	    nap.sprite_index= 1136/* spr_napstablook_grsm_headphones */
	    nap.y+= 20
	    nap.fun= 1
	    obj_mainchara.visible= 0
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1050)
	    con= 37
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 38) {
	    GS.msg[0]= "* here we go..^1.&* you\'ll lie down as long&  as you don\'t move./"
	    GS.msg[1]= "* so..^1. only move around when&  you want to get up^1, i&  guess./%%"
	    scr_regulartext()
	    con= 39
	    buffer= 10
	}
	if(con == 39 and not instance_exists(782/* OBJ_WRITER */)) {
	    get_mcx= obj_mainchara.x
	    get_mcy= obj_mainchara.y
	    $Alarm6.start((230) / 30.0)
	    $Alarm5.start((300) / 30.0)
	    con= 40
	}
	if(con == 40) {
	    buffer--
	    GS.interact= 1
	    if(buffer < 1) GS.interact= 0
	    GS.flag[17]= 1
	    if(obj_mainchara.x != get_mcx or obj_mainchara.y != get_mcy and buffer < 1) {
	        if(alarm[6] >= 1) $Alarm6.start((-1) / 30.0)
	        GS.flag[458]= 1
	        GS.flag[17]= 0
	        GS.interact= 1
	        obj_mainchara.x= mc.x
	        obj_mainchara.y= mc.y
	        obj_mainchara.visible= 1
	        with(mc) instance_destroy()
	        con= 40
	        if(wavein == 0) {
	            $Alarm5.start((-1) / 30.0)
	            con= 41
	            $Alarm4.start((30) / 30.0)
	        }
	        if(wavein > 0) {
	            event_user(1)
	            con= 41
	            $Alarm4.start((90) / 30.0)
	        }
	    }
	}
	if(con == 42) {
	    nap.fun= 0
	    nap.sprite_index= nap.lsprite
	    nap.y-= 20
	    GS.msg[0]= "* well^1, that was nice..^1.&* thank you.../%%"
	    scr_regulartext()
	    con= 44
	}
	if(con == 44 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 45
	    // obj_napstablook_cd
	    with(1135) buffer= 240
	    GS.interact= 0
	    GS.flag[93]= 3
	}
	if(con == 80) {
	    nap.velocity.y= 2
	    nap.direction= 270
	    con= 81
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 82) {
	    nap.velocity.y= 0
	    nap.velocity.x= 2
	    con= 85
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 86 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(nap) instance_destroy()
	    con= 87
	    GS.interact= 0
	}
	if(wavein == 1 or wavein == 2) {
	    wavein= 2
	    waver.modulate.a+= 0.005
	    if(waver.modulate.a >= 1) wavein= 2.1
	}
	if(wavein == 3) {
	    waver.modulate.a-= 0.005
	    if(waver.modulate.a <= 0) waver.modulate.a= 0
	    if(waver.modulate.a <= 0 and obj_napstablookdate_music.songplaying == 0) {
	        wavein= 0
	        with(waver) instance_destroy()
	        // obj_napstablookdate_music
	        with(1134) event_user(7)
	    }
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
	}

func _gm_event_7_11():
	if(wavein == 0) {
	    // obj_napstablookdate_music
	    with(1134) {
	        event_user(3)
	        caster_stop(GS.currentsong)
	    }
	    GS.interact= 1
	    waver= instance_create(0, 0, 112/* obj_fx_waver */)
	    waver.z_index= 100000
	    waver.modulate.a= 0
	    wavein= 1
	}
	if(wavein >= 2) {
	    wavein= 3
	    // obj_napstablookdate_music
	    with(1134) event_user(3)
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
