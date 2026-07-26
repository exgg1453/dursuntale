# Auto-converted from GameMaker: obj_darksausagenpc
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
	if(scr_enemynpc3() != 1) instance_destroy()
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Why do I look like a weird&  black sausage^1?&* Just the angle./%%"
	if(room == 190) {
	    GS.msg[0]= "* As a youth^1, I would sneak&  out to play by this creepy&  flaming pit./"
	    GS.msg[1]= "* Since the CORE is always&  re-arranging^1, it was like&  a game trying to find it./"
	    GS.msg[2]= "* Now it is my special place^1.&* It is nice for cooking s\'mores&  and things like that./%%"
	}
	if(room == 191) {
	    GS.msg[0]= "* We were hired by Mettaton&  to destroy you./"
	    GS.msg[1]= "* But since he never paid us^1,&  we all decided to quit./"
	    GS.msg[2]= "* No hard feelings./%%"
	}
	if(room == 194) {
	    GS.msg[0]= "* Zzzzzzz.../"
	    GS.msg[1]= "* (It\'s taking a nap.)/%%"
	}
	if(room == 208) {
	    GS.msg[0]= "* Why do I look like a black&  sausage and not a knight&  or a wizard?/"
	    GS.msg[1]= "* Well..^1.&* Everyone has an angle they&  look best from../%%"
	}
	if(room == 204) {
	    GS.msg[0]= "* The core is made up of&  interchangable rooms./"
	    GS.msg[1]= "* Before you came here^1, the&  layout was altered so you&  would get lost and perish./"
	    GS.msg[2]= "* Yes^1. Just for you^1.&* Do you feel special?/%%"
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
