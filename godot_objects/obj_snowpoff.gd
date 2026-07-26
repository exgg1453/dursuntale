# Auto-converted from GameMaker: obj_snowpoff
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	myinteract= 0
	scale.x= 1
	scale.y= 1
	tt= 0
	gg= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(tt == 0) GS.msg[0]= "* It\'s a snow poff./%%"
	if(tt == 1) GS.msg[0]= "* And this..^1.&* Is a snow poff./%%"
	if(tt == 2)
	    GS.msg[0]= "* This^1, however^1, is a snow poff./%%"
	if(tt == 3)
	    GS.msg[0]= "* Surprisingly^1, it\'s a snow poff./%%"
	if(tt == 4) GS.msg[0]= "* Snow poff.../%%"
	if(tt == 5) GS.msg[0]= "* Is it really a snow poff?/%%"
	if(tt == 6) GS.msg[0]= "* Behold^1!&* A snow poff./%%"
	if(tt >= 7 and GS.flag[65] == 1) {
	    GS.msg[0]= "* What\'s this called?/%%"
	    tt= 0
	}
	if(tt >= 7 and GS.flag[65] == 0) {
	    GS.msg[0]= "* Eh^1?&* There\'s 30 G inside&  this..^1. what is this?/%%"
	    GS.gold+= 30
	    tt= 0
	    GS.flag[65]= 1
	}
	gg= tt
	obj_snowpoff.tt= tt + 1
	tt= gg
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
