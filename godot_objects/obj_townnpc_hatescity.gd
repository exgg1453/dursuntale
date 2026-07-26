# Auto-converted from GameMaker: obj_townnpc_hatescity
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
	GS.msg[0]= "* The capital\'s getting pretty&  crowded^1, so I\'ve heard they\'re&  going to start moving here./"
	GS.msg[1]= "* Hmmm..^1.&* I don\'t want to see the&  erasure of our local culture./"
	GS.msg[2]= "* But I definitely want to see&  some city slickers slip onto&  their butts!/%%"
	if(talkedto > 0) GS.msg[0]= "* Yeah^1, bring \'em on!/%%"
	if(GS.plot > 121) {
	    GS.msg[0]= "* What will happen to&  Grillby\'s if everyone&  moves in...?/"
	    GS.msg[1]= "* We\'re gonna have to have&  chairs to the ceiling./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Hey^1! People won\'t have to&  move in from the city&  anymore!/"
	    GS.msg[1]= "* Seems like we won\'t have&  to lose our local culture./"
	    GS.msg[2]= "* ... except we\'re all moving&  out of here^1, huh./"
	    GS.msg[3]= "* Oh well^1. Guess it can\'t be&  all punk-peaches and punk-&  cream./%%"
	}
	if(scr_deaddog() == 1 or GS.flag[67] == 1) {
	    GS.msg[0]= "* The capital\'s getting pretty&  crowded^1, so I\'ve heard they\'re&  going to start moving here./"
	    GS.msg[1]= "* ... who knows^1.&* Maybe we\'ll have room./%%"
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
