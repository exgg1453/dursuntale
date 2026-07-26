# Auto-converted from GameMaker: obj_townnpc_icewolf
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1302
	usprite= 1302
	lsprite= 1302
	rsprite= 1302
	dtsprite= 1302
	utsprite= 1302
	ltsprite= 1302
	rtsprite= 1302
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 7) instance_destroy()
	if(GS.flag[7] == 0) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Ice Wolf no longer has to&  throw Ice./"
	GS.msg[1]= "* Ice Wolf can take a break to&  buy some pants now./%%"
	if(talkedto > 0)
	    GS.msg[0]= "* Ice Wolf thinking of changing&  their name to Jimmy Hotpants./%%"
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
