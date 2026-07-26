# Auto-converted from GameMaker: obj_undyne_lettercall
extends Node2D

func _ready():
	con= 0
	d= 0
	ini_open("undertale.ini")
	won= ini_read_real("General", "Won", 0)
	ini_close()
	if(won < 1) d= 1
	if(GS.flag[389] < 3) d= 1
	if(GS.kills > 0) d= 1
	if(GS.plot <= 198) d= 1
	if(GS.flag[493] >= 8) d= 1
	if(d == 1) {
	    con= -1
	    instance_destroy()
	    exit
	} else  {
	    scale.y= 12
	    if(room == 188) {
	        scale.y= 1
	        scale.x= 30
	    }
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    caster_pause(GS.currentsong)
	    snd_play(104/* snd_phone */)
	    $Alarm4.start((40) / 30.0)
	    con= 2
	}
	if(con == 3) {
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msg[0]= "* Ring.../"
	    scr_undface(1, 0)
	    GS.msg[2]= "\\E0* Hey...^1!&* Uh^1, this is&  Undyne.../"
	    GS.msg[3]= "\\E2* (Shut up^1, Papyrus^1!)&* (This was YOUR idea!)/"
	    GS.msg[4]= "\\E1* HUMAN^1!&* You have to deliver&  something for me!/"
	    GS.msg[5]= "\\E9* Uh^1, please?/"
	    GS.msg[6]= "\\E0* I\'m at Snowdin&  in front of&  Papyrus\'s./"
	    GS.msg[7]= "\\E6* See ya^1, punk!/"
	    GS.msg[8]= "\\TS \\F0 \\T0 %"
	    GS.msg[9]= "* Click.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[8]= 1
	    caster_resume(GS.currentsong)
	    if(GS.flag[493] < 8) GS.flag[493]= 8
	    GS.interact= 0
	    con= 7
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
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
