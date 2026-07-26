# Auto-converted from GameMaker: obj_townnpc_slimedaughter
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1218
	usprite= 1218
	lsprite= 1218
	rsprite= 1218
	dtsprite= 1218
	utsprite= 1218
	ltsprite= 1218
	rtsprite= 1218
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(GS.flag[67] == 1 or scr_deaddog() == 1) instance_destroy()
	if(GS.flag[67] == 1 or scr_deaddog() == 1) instance_destroy()
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* You aren\'t gonna make me&  be the human again^1, are you?/%%"
	if(GS.plot >= 122)
	    GS.msg[0]= "* Can we PLEASE play something&  else...?/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Hmmm..^1.&* When humans play Monsters&  and Humans.../"
	    GS.msg[1]= "* Do they just call it&  Humans and Humans?/%%"
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
