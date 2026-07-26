# Auto-converted from GameMaker: obj_chipdoor_r
extends Node2D

func _ready():
	myinteract= 0
	x+= sprite_width
	mychip= instance_create(x - 6, y, 1363/* obj_npc_marker */)
	mychip.frame= 1
	mychip.z_index= z_index + 1
	mychip.sprite_index= 1671/* spr_chipdoor_chippart */
	mychip.image_speed= 0
	mychip.visible= 1
	scale.x= -1
	image_speed= 0.2
	if(GS.flag[375] == 1 and room == 148) sprite_index= 1673/* spr_chipdoor_green */
	if(GS.flag[400] == 1 and room == 171) sprite_index= 1673/* spr_chipdoor_green */
	did= 0
	if(GS.plot > 132 and room == 148) did= 1
	if(GS.plot > 163 and room == 171) did= 1
	if(did == 1) x+= 20

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (The door is locked.)/%%"
	if(sprite_index == 1673)
	    GS.msg[0]= "* (This half of the door is&  unlocked.)/%%"
	if(GS.plot > 132 and room == 148)
	    GS.msg[0]= "* (The door is open.)/%%"
	if(GS.plot > 163 and room == 171)
	    GS.msg[0]= "* (The door is open.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_end(delta: float):
	mychip.x= x + sprite_width - 6

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
