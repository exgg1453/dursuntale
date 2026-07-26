# Auto-converted from GameMaker: obj_vsflowey_heartdefeated
extends Node2D

func _ready():
	remx= obj_vsflowey_heart.x
	remy= obj_vsflowey_heart.y
	bb= sprite_create_from_screen_x(0, 0, 640, 480, 0, 0, 0, 0)
	caster_free(-3)
	// all
	with(-3) {
	    x= -500
	    y= -500
	}
	// obj_flowey_writer
	with(1598) instance_destroy()
	instance_deactivate_all(1)
	x= remx
	y= remy
	drawbb= 1
	$Alarm0.start((20) / 30.0)
	image_speed= 0
	gmusic= caster_load("music/gameover.ogg")
	dingus= 0
	currentvol= 1
	con= 0

func _gm_event_2_8():
	$Alarm5.start((1) / 30.0)
	gm1= caster_loop(gmusic, 0.45, 1)
	caster_set_panning(gm1, 0.25)
	gm2= caster_loop(gmusic, 0.45, 1)
	caster_set_panning(gm2, 0.5)
	gm3= caster_loop(gmusic, 0.45, 1)
	caster_set_panning(gm3, 0.75)
	con= 6
	str= "HAHAHAHAHAHAHAHAHAHAHAHAHA#HAHAHAHAHAHAHAHAHAHAHAHAHA"
	$Alarm6.start((190) / 30.0)
	snd_play(52/* snd_floweylaugh */)

func _gm_event_2_7():
	caster_stop(-3)
	GS.typer= 74
	GS.msg[0]= "  And you\'re NEVER&  waking up!^3 %%"
	GS.msg[1]= "%%"
	$Alarm8.start((150) / 30.0)
	con= 4
	dingus= 1
	script_execute(150/* SCR_TEXTTYPE */, GS.typer)
	GS.msc= 0
	instance_create(100, 300, 1598/* obj_flowey_writer */)

func _gm_event_2_6():
	game_end()

func _gm_event_2_5():
	caster_set_pitch(gm1, 2.81)
	caster_set_pitch(gm2, 3)
	caster_set_pitch(gm3, 2.64)

func _gm_event_2_3():
	GS.typer= 71
	GS.msg[0]= "  This is all just&  a bad dream...^4 %%"
	GS.msg[1]= "%%%"
	con= 2
	dingus= 1
	script_execute(150/* SCR_TEXTTYPE */, GS.typer)
	GS.msc= 0
	instance_create(100, 300, 1598/* obj_flowey_writer */)
	$Alarm7.start((160) / 30.0)

func _gm_event_2_2():
	instance_create(0, 0, 180/* obj_gameoverbg */)
	$Alarm3.start((80) / 30.0)
	ll= GS.floss + 1
	ini_open("undertale.ini")
	ini_write_real("FFFFF", "D", ll)
	ini_close()
	if(ll > 2) game_end()
	else  {
	    gm1= caster_loop(gmusic, 0.45, 1)
	    caster_set_panning(gm1, 0.25)
	    gm2= caster_loop(gmusic, 0.45, 1)
	    caster_set_panning(gm2, 0.5)
	    gm3= caster_loop(gmusic, 0.45, 1)
	    caster_set_panning(gm3, 0.75)
	}

func _gm_event_2_1():
	snd_play(154/* snd_break2_c */)
	modulate.a= 0
	instance_create(x - 2, y, 746/* obj_heartshard */)
	instance_create(x, y + 3, 746/* obj_heartshard */)
	instance_create(x + 2, y + 6, 746/* obj_heartshard */)
	instance_create(x + 8, y, 746/* obj_heartshard */)
	instance_create(x + 10, y + 3, 746/* obj_heartshard */)
	instance_create(x + 12, y + 6, 746/* obj_heartshard */)
	$Alarm2.start((50) / 30.0)

func _on_destroy():
	$Alarm1.start((40) / 30.0)
	snd_play(153/* snd_break1_c */)
	drawbb= 0
	sprite_index= 44/* spr_heartbreak */
	x-= 2

func _on_outside_room():
	if(drawbb == 1) draw_sprite(bb, 0, 0, 0)
	else 
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	if(con == 6) {
	    // obj_gameoverbg
	    with(180) modulate.a-= 0.05
	    draw_set_color(16777215)
	    draw_set_font(10)
	    draw_text_transformed(60, y + 480, str, 3, 3, 0)
	    velocity.y= -28
	    str+= "#HAHAHAHAHAHAHAHAHAHAHAHAHA"
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
