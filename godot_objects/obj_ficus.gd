# Auto-converted from GameMaker: obj_ficus
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
	if(room == 183) sprite_index= 1968/* spr_ficus_lobby */

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (It\'s a potted plant.)/%%"
	if(scr_murderlv() >= 12)
	    GS.msg[0]= "* (The potted plant is judging&  you for your sins.)/%%"
	if(room == 184 and x > 160 and x < 260)
	    GS.msg[0]= "* (It\'s a platoon of ficuses.)/%%"
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
