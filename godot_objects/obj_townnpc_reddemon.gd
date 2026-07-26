# Auto-converted from GameMaker: obj_townnpc_reddemon
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
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* We all know the underground&  has problems^1, but we&  smile anyway./"
	GS.msg[1]= "* Why?/"
	GS.msg[2]= "* We can\'t do anything^1, so&  why be morose about it?/%%"
	if(talkedto > 0) GS.msg[0]= "* Smile smile./%%"
	if(room == 44) {
	    GS.typer= 27
	    GS.msg[0]= "* PATHETIC HUMAN./"
	    GS.msg[1]= "\\W* I AM METTATON^2, BIG TIME&  \\RSEXY ROBOT\\W LOVER./%%"
	}
	if(GS.plot >= 122) {
	    GS.msg[0]= "* Maybe I\'ll try frowning&  for once./"
	    GS.msg[1]= "* ... no^1.&* I just can\'t do it./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Oh^1?&* We\'re free?/"
	    GS.msg[1]= "* Finally..^1.&* I\'ll be able to stop&  smiling./%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Just now^1, I felt my smile&  falter for a moment./"
	    GS.msg[1]= "* What\'s wrong?/%%"
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
