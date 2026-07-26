# Auto-converted from GameMaker: obj_alphys_npc
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	image_speed= 0
	dsprite= 1638
	usprite= 1651
	lsprite= 1650
	rsprite= 1643
	dtsprite= 1642
	utsprite= 1652
	ltsprite= 1649
	rtsprite= 1648
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	con= 0
	fun= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 47
	GS.facechoice= 6
	GS.faceemotion= 0
	GS.faceemotion= 8
	GS.msg[0]= "* Th-that last&  question.../"
	GS.msg[1]= "\\E4* He wasn\'t s-supposed&  to ask that one.../%%"
	if(GS.plot > 126 and room == 141) {
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msg[0]= "* (Yellow feet are tapping&  just behind the door.)/%%"
	}
	if(room == 211) {
	    GS.flag[430]= 1
	    GS.facechoice= 6
	    GS.faceemotion= 5
	    GS.msg[0]= "* I..^1. I just need&  a moment./%%"
	}
	if(room == 212) {
	    GS.flag[430]= 1
	    GS.facechoice= 6
	    GS.faceemotion= 5
	    GS.msg[0]= "* .../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	if(d == 0) scr_depth()
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
