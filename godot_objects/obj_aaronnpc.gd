# Auto-converted from GameMaker: obj_aaronnpc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(scr_enemynpc2() != 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Since you flexed at me^1,&  I\'ve been thinking of a&  lot of things ; )/"
	GS.msg[1]= "* Like..^1.&* Flexing ; )/%%"
	if(talkedto > 0) GS.msg[0]= "* And flexing ; )/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* You came all this way to&  see me flex ; )/"
	    GS.msg[1]= "* This really says something&  about you ; )/%%"
	}
	if(GS.flag[95] == 1) {
	    GS.msg[0]= "* I..^1. I\'m sc-scared... ; )/"
	    GS.msg[1]= "* Ghosts aren\'t real^1, right?&* ; )/"
	    GS.msg[2]= "* What^1? They are real^1?&* Oh nooooooo ; )/%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* First ghosts^1, are real^1, now&  anime\'s real ; )&* All my nightmares are true ; )/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

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
