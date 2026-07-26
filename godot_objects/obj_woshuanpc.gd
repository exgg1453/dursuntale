# Auto-converted from GameMaker: obj_woshuanpc
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
	if(scr_enemynpc2() != 1) instance_destroy()
	if(room == 113 and GS.flag[493] >= 9 and GS.flag[7] == 0)
	    instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Everything\'s so dirty..^1.&* If I could erase everything^1,&  I would./"
	GS.msg[1]= "* Ohhhh^1.&* Don\'t get the wrong idea^1.&* I don\'t want anyone to die./"
	GS.msg[2]= "* People turn to dust when&  they die^1, and that\'s hard&  to clean up.../%%"
	if(talkedto > 0) GS.msg[0]= "* Don\'t turn to dust./%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* The surface intimidates me./"
	    GS.msg[1]= "* The entire outer layer of the&  Earth is made of dirt./%%"
	}
	if(room == 113) {
	    GS.msg[0]= "* I clean off all of the&  trash and arrange it into&  symmetrical piles./"
	    GS.msg[1]= "* It\'s hard work^1, but somebody&  has to do it./%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* Don\'t drag your dirty feet&  in here^1.&* I just cleaned this trash!/%%"
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
