# Auto-converted from GameMaker: obj_townnpc_weirdfish
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
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 7) instance_destroy()
	sansmode= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* I " + chr(ord('"')) + "put out a line" + chr(ord('"')) + " for some&  girls today./"
	GS.msg[1]= "* Someone told me that there&  are plenty of fish in the&  sea.../"
	GS.msg[2]= "* Well^1, I\'m taking that&  seriously./"
	GS.msg[3]= "* I\'m literally going to make&  out with a fish./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* I guess I could ask out Undyne^1.&* But I think she likes someone&  already./%%"
	if(GS.plot >= 122)
	    GS.msg[0]= "* Did I catch anyone yet^1?&* I can\'t bear to look.../%%"
	if(sansmode == 1) {
	    GS.msg[0]= "* Sans is the most regular&  regular of all./"
	    GS.msg[1]= "* He hasn\'t been showing up&  as much recently though./%%"
	}
	if(GS.flag[67] == 1) {
	    GS.msg[0]= "* Where the heck is Sans?/"
	    GS.msg[1]= "* He told me he had some&  bait I could use./"
	    GS.msg[2]= "* Though it was probably&  some kind of prank./"
	    GS.msg[3]= "* But I wanted to know what&  the prank was!/%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* In the end^1, I never caught&  any girls on my fishing&  line./"
	    GS.msg[1]= "* So kid^1, take it from me.../"
	    GS.msg[2]= "* Don\'t try to catch hot&  people with a fishing rod./"
	    GS.msg[3]= "* (Somewhere^1, you hear a whinny&  of dismay.)/%%"
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
