# Auto-converted from GameMaker: obj_amalgam_dogevent
extends Node2D

func _ready():
	no= 0
	dp= 0
	nod= 0
	if(GS.flag[490] > 0) {
	    instance_destroy()
	    exit
	} else  {
	    repeat(30)  {
	        dp[no]= instance_create(0, 0, 1556/* obj_amalgam_dogpiece */)
	        no++
	    }
	    image_speed= 0
	    con= 0
	    size= 0
	    drawball= 0
	    dx= x
	    dy= y
	    banim= 0
	    exit
	}

func _gm_event_2_8():
	velocity.x= 0
	banim= 5
	$Alarm7.start((26) / 30.0)

func _gm_event_2_7():
	banim= 4
	velocity.x= 1
	$Alarm8.start((10) / 30.0)
	caster_play(yl, 0.9, 0.2 + random(0.3))

func _gm_event_2_6():
	if(size < 1) {
	    size+= 1 / no
	    $Alarm6.start((2) / 30.0)
	}

func _gm_event_2_5():
	if(nod < no) {
	    with(dp[nod]) con= 1
	    $Alarm5.start((2) / 30.0)
	    nod++
	} else  con= 3

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(con == 50) {
	    obj_labfan.sprite_index= 2131/* spr_wallfan_on */
	    snd_play(106/* snd_noise */)
	    GS.interact= 1
	    // obj_labfog
	    with(1555) caster_loop(fansfx, 0.5, 3)
	    con= 51
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 51) {
	    GS.interact= 1
	    // obj_labfog
	    with(1555) modulate.a-= 0.01
	}
	if(con == 52) con= 1
	if(con == 1) {
	    tr= caster_load("music/sfx_generate.ogg")
	    caster_play(tr, 0.8, 0.8)
	    GS.interact= 1
	    GS.facing= 3
	    drawball= 1
	    $Alarm5.start((2) / 30.0)
	    $Alarm6.start((10) / 30.0)
	    con= 2
	}
	if(con == 3) {
	    con= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5) {
	    y+= 2
	    if(y >= 149) {
	        y= 150
	        con= 5.9
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 6.9) {
	    caster_play(tr, 0.8, 0.8)
	    con= 7
	}
	if(con == 7) {
	    banim+= 0.334
	    if(banim >= 5) {
	        banim= 5
	        con= 8
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 9) {
	    yl= caster_load("music/sfx_yowl.ogg")
	    GS.interact= 0
	    GS.flag[17]= 1
	    $Alarm7.start((20) / 30.0)
	    con= 10
	}
	if(con == 10 and x > obj_mainchara.x - 25) con= 11
	if(con == 11) {
	    caster_free(tr)
	    caster_free(yl)
	    GS.battlegroup= 86
	    GS.mercy= 1
	    GS.border= 0
	    GS.flag[16]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 12
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 13) {
	    GS.flag[17]= 0
	    GS.interact= 0
	    // obj_mainchara
	    with(1570) uncan= 0
	    GS.mercy= 0
	    myinteract= 0
	    GS.flag[490]= 1
	    scr_tempsave()
	    instance_destroy()
	}
	if(drawball == 1)
	    draw_sprite_ext(sprite_index, floor(banim), x, y, size, size, 0, 16777215, 1)

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
