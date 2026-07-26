# Auto-converted from GameMaker: obj_pyropenpc
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
	GS.msg[0]= "* Haha^1, ha ha ha^1.&* Secret^1, secret^1.&* I\'ve done up a trouble./"
	GS.msg[1]= "* I set the lava on fire./"
	GS.msg[2]= "* No one will EVER know^1.&* It\'s the perfect crime.../%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Haha^1, ha ha ha^1.&* If we leave^1, no one will&  REALLY ever know!!/%%"
	    GS.msg[2]= "* This crime just gets perfecter&  and perfecter./%%"
	}
	if(talkedto > 0) GS.msg[0]= "* The lava\'s so spicey now./%%"
	if(room == 165) {
	    GS.msg[0]= "* Haha^1, ha ha ha^1.&* Ya wanna " + chr(ord('"')) + "hang" + chr(ord('"')) + " out?/"
	    GS.msg[1]= "* Haha^1, ha ha ha^1.&* Sorry^1, I\'m all TIED UP!!!/"
	    GS.msg[2]= "* Psyche^1! Owned^1!&* No one wants to be MY&  friend!!!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Haha^1, ha ha ha^1.&* Wonder if any humans would&  wanna be my friend./"
	        GS.msg[1]= "* PSYYYYCHE^1!&* That\'d NEVER happen!/%%"
	    }
	    if(talkedto > 0)
	        GS.msg[0]= "* I\'m too spicey to have&  any friends./%%"
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
