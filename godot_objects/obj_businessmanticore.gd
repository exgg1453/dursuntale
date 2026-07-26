# Auto-converted from GameMaker: obj_businessmanticore
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1219
	usprite= 1219
	lsprite= 1219
	rsprite= 1219
	dtsprite= 1219
	utsprite= 1219
	ltsprite= 1219
	rtsprite= 1219
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* This elevator goes straight&  to the capital^1.&* But it stopped working./"
	GS.msg[1]= "* The hotel\'s doing its best to&  accomodate everybody&  stuck here./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* Me^1?&* I just like explaining things&  to passersby./%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Good news^1!&* The elevator started working&  again./"
	    GS.msg[1]= "* But now it\'s been so busy^1,&  we still haven\'t gotten the&  chance to ride it./%%"
	}
	if(GS.flag[425] == 1) {
	    GS.msg[0]= "* Mettaton hasn\'t made a&  performance for more&  than five minutes.../"
	    GS.msg[1]= "* What\'s happening...^1?&* Can you explain it?/%%"
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
