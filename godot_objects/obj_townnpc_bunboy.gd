# Auto-converted from GameMaker: obj_townnpc_bunboy
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
	direction= 270
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* That lady over there.../"
	GS.msg[1]= "* Something about her disturbs&  me./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I think I\'ve figured it out^1.&* ... no^1, nevermind./%%"
	if(GS.plot >= 122) {
	    GS.msg[0]= "* That lady over there\'s&  been going for a walk&  for a while now./"
	    GS.msg[1]= "* ... but she hasn\'t moved&  an inch from where she\'s&  standing./"
	    GS.msg[2]= "* W-well^1, I haven\'t either^1,&  but I don\'t want her to&  notice me over here.../%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Uhhh.../"
	    GS.msg[1]= "* Is anyone else weirded out&  by those giant shambling&  amalgamates^1, or...?/%%"
	    if(talkedto > 0) GS.msg[0]= "* ....../%%"
	}
	if(scr_deaddog() or GS.flag[67] == 1) {
	    GS.msg[0]= "* That lady over there&  seems happy today./"
	    GS.msg[1]= "* Don\'t know why^1, but it\'s&  sending shivers down my&  spine.../%%"
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
