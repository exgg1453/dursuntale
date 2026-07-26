# Auto-converted from GameMaker: obj_grillbynpc_hotandbothered
# GM parent: obj_readablesolid
extends CharacterBody2D

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
	direction= 0
	talkedto= 0
	image_speed= 0
	fun= 0
	if(scr_murderlv() >= 7) instance_destroy()
	sansmode= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* No matter where I go^1,&  it\'s the same menu^1, the&  same people.../"
	GS.msg[1]= "* Help^1!&* I want new drinks an\'&  ^1h-^1h-^1h-hot guys!!!!/%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I guess the bartender\'s kind&  of ^1h-^1h-^1h-hot.../%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* C\'mon everybody!!^1!&* ^1L-^1l-^1l-let\'s party!!!/"
	    GS.msg[1]= "* ... anyone?/%%"
	}
	if(sansmode == 1) {
	    GS.msg[0]= "* Sansyyyy..^1.&* Come back and sit with me.../"
	    GS.msg[1]= "* Everything\'s so fun when&  you\'re around!!!/%%"
	}
	if(scr_deaddog()) {
	    GS.msg[0]= "* It\'s s-s-so quiet in here./"
	    GS.msg[1]= "* L-lighten up everybody^1!&* This is why I hate&  th-this place./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* I w-wonder if the&  o-overworld h-has h-hot&  guys.../"
	    GS.msg[1]= "*  A-and neat d-drinks.../"
	    GS.msg[2]= "* Ooooooo^1, I\'m ready!/%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* H-hey^1, isn\'t Sansy s\'posed&  to come swinging in right&  about now???/"
	    GS.msg[1]= "* C\'mon Sansy^1!&* You\'re the life of the&  party.../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	if(fun == 0) scr_npc_anim()

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
