# Auto-converted from GameMaker: obj_sans_interactable1
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

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 17
	GS.facechoice= 3
	GS.faceemotion= 0
	GS.msg[0]= "* you oughta get going^1.&* he might come back^1.&* and if he does.../"
	GS.msg[1]= "\\E2* ... you\'ll have to&  sit through more of&  my hilarious jokes./%%"
	if(talkedto > 0) {
	    if(talkedto == 1) {
	        GS.msg[0]= "* what\'s the holdup^1?&* look^1, there\'s nothin&  to be afraid of./"
	        GS.msg[1]= "\\E2* it\'s just a dark cavern&  filled with skeletons&  and horrible monsters./%%"
	    }
	    if(talkedto == 2) GS.msg[0]= "* well?/%%"
	}
	if(scr_murderlv() >= 2)
	    GS.msg[0]= "* ... are you just gonna&  stare at me^1, or...?/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	script_execute(106/* scr_npcdir */, 2)

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
