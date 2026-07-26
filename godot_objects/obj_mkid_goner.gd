# Auto-converted from GameMaker: obj_mkid_goner
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1385
	usprite= 1386
	lsprite= 1388
	rsprite= 1387
	dtsprite= 1385
	utsprite= 1386
	ltsprite= 1388
	rtsprite= 1387
	myinteract= 0
	facing= 3
	direction= 180
	talkedto= 0
	image_speed= 0
	con= 0
	fun= 0
	if(room == 91 and GS.plot < 110) instance_destroy()
	type= 0
	gox= 0
	if(GS.flag[5] >= 90 and file_exists("undertale.ini")) {
	    ini_open("undertale.ini")
	    fsx= ini_read_real("General", "fun", 0)
	    if(fsx >= 90 and GS.flag[5] >= 90) {
	        gox= 1
	        type= 1
	    }
	    ini_close()
	}
	if(GS.debug == 1) gox= 1
	if(gox == 0) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Yo^1!&* You\'re a ??? too^1, right?/%%"
	if(type == 1) {
	    GS.msg[0]= "* Have you ever thought about&  a world where everything is&  exactly the same.../"
	    GS.msg[1]= "* Except you don\'t exist?/"
	    GS.msg[2]= "* Everything functions&  perfectly without you.../"
	    GS.msg[3]= "* Ha^1, ha..^1.&* The thought terrifies me./%%"
	    if(talkedto >= 1) GS.msg[0]= "* .../%%"
	    if(GS.flag[85] == 1) {
	        GS.msg[0]= "* An umbrella...^1?&* But it\'s not raining./"
	        GS.msg[1]= "* Ha^1, ha.../"
	        GS.msg[2]= "* You know^1, that does make&  me feel a little better&  about this./"
	        GS.msg[3]= "* Thank you./"
	        GS.msg[4]= "* Please forget about me./%%"
	        if(talkedto >= 1)
	            GS.msg[0]= "* Please don\'t think about&  this anymore./%%"
	        if(GS.flag[5] >= 90) GS.flag[5]= 0
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    script_execute(106/* scr_npcdir */, 2)
	    scr_npc_anim()
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
