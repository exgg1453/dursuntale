# Auto-converted from GameMaker: obj_triswitchevent
extends Node2D

func _ready():
	scale.y= 3
	switches= 0
	con= 0
	deltaco= 0
	if(GS.plot < 140) {
	    ff= instance_create(180, 80, 1183/* obj_kitchenforcefield */)
	    ff.basic= 0
	    ff.scale.y= 5
	} else  instance_destroy()
	donkeykongismyfavoritemarvelsuperhero= 0
	won= 0

func _gm_event_2_4():
	con++

func _process_end(delta: float):
	switches= 0

func _process(delta: float):
	if(con == 0 and switches == 2 and obj_mainchara.x < 390 and obj_mainchara.x > 380 and obj_mainchara.y < 90 and GS.interact == 0) {
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msc= 0
	    GS.interact= 1
	    snd_play(104/* snd_phone */)
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "\\E6* OK^1!&* Now press the third&  one!!!/%%"
	    GS.msg[3]= "\\TS \\F0 \\E0 \\T0 %"
	    GS.msg[4]= "* (Click...)/%%"
	    GS.plot= 140
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 0.1
	    $Alarm4.start((28) / 30.0)
	}
	if(con == 1.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 2
	    GS.interact= 0
	}
	if(con == 2 and obj_mainchara.x < 280 and GS.interact == 0 and switches < 3 and won == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    GS.facechoice= 6
	    GS.faceemotion= 3
	    GS.typer= 47
	    GS.msc= 0
	    GS.msg[0]= "\\E1* ............./"
	    GS.msg[1]= "\\E2* ............./"
	    GS.msg[2]= "\\E0* H-h-hey!/"
	    GS.msg[3]= "\\E5* Looks like you!!!^1 &* Only needed to press^1!&* Two of them!!!/%%"
	    GS.msg[4]= "\\TS \\F0 \\E0 \\T0 %"
	    GS.msg[5]= "* (Click...)/%%"
	    GS.plot= 140
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if((con == 3 or con == 1 or con == 0.1 or con == 1.1) and instance_exists(782/* OBJ_WRITER */)) {
	    if(donkeykongismyfavoritemarvelsuperhero == 0) {
	        wrx= OBJ_WRITER.writingx - view_xview[0]
	        dgx= obj_dialoguer.x - view_xview[0]
	        donkeykongismyfavoritemarvelsuperhero= 1
	    }
	    if(donkeykongismyfavoritemarvelsuperhero == 1) {
	        OBJ_WRITER.myx= view_xview[0] + wrx
	        OBJ_WRITER.writingx= view_xview[0] + wrx
	        if(instance_exists(774/* obj_face */)) {
	            obj_face.x= view_xview[0] + 24
	            OBJ_WRITER.myx= view_xview[0] + wrx + 58
	            OBJ_WRITER.writingx= view_xview[0] + wrx + 58
	        }
	        obj_dialoguer.xx= view_xview[0]
	        obj_dialoguer.x= view_xview[0] + dgx
	    }
	    if(con == 3 and OBJ_WRITER.stringno == 2 and deltaco == 0)
	        deltaco= 1
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 4
	    GS.interact= 0
	}
	if(switches == 3 and con < 4) {
	    won= 1
	    deltaco= 1
	}
	if(won == 1 and obj_mainchara.x < 280 and GS.interact == 0) {
	    GS.interact= 1
	    snd_play(104/* snd_phone */)
	    GS.facechoice= 6
	    GS.faceemotion= 6
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E4 \\F6 \\TA %"
	    GS.msg[2]= "\\E3* H-h-hey^1!&* You did it!/"
	    GS.msg[2]= "\\E4* I was worried I&  messed it up&  there.../"
	    GS.msg[3]= "\\E0* But I guess we&  make a pretty good&  team!/%%"
	    GS.msg[4]= "\\TS \\F0 \\E0 \\T0 %"
	    GS.msg[5]= "* (Click...)/%%"
	    GS.plot= 140
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	    GS.flag[404]= 1
	    GS.plot= 140
	}
	if(con == 8) {
	    GS.interact= 0
	    con= 9
	}
	if(deltaco == 1) {
	    with(ff) modulate.a-= 0.05
	    if(ff.modulate.a < 0.06) {
	        with(ff) instance_destroy()
	        deltaco= 2
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
