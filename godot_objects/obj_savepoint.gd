# Auto-converted from GameMaker: obj_savepoint
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0.2
	if(GS.flag[493] >= 12 and GS.flag[7] == 0) {
	    if(room == 219) instance_destroy()
	    if(room == 232) instance_destroy()
	    if(room == 231) instance_destroy()
	    if(room == 216) instance_destroy()
	    if(room == 235) instance_destroy()
	}
	if(room == 131 and (scr_murderlv() < 11 or GS.flag[27] == 1 or GS.plot > 119))
	    instance_destroy()

func _on_destroy():
	myinteract= 4
	GS.msc= 15
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.hp < GS.maxhp) GS.hp= GS.maxhp
	GS.en= GS.maxen
	snd_play(109/* snd_power */)
	offroom= 0
	if(room == 219) offroom= 1
	if(room == 235) offroom= 1
	if(room == 232) offroom= 1
	if(room == 236) offroom= 1
	if(room == 231) offroom= 1
	if(room == 216) offroom= 1
	if(room == 246) offroom= 1
	if(room == 251) offroom= 1
	if(scr_murderlv() >= 2 and GS.flag[27] == 0 and (room == 46 or room == 56 or room == 61 or room == 68) and GS.flag[27] == 0) {
	    GS.msc= 0
	    pop= 16 - GS.flag[203]
	    if(pop < 0) pop= 0
	    if(scr_murderlv() >= 2)
	        GS.msg[0]= "\\R* " + string(pop) + " left./%%"
	    if(scr_murderlv() == 5) GS.msg[0]= "\\R* That comedian.../%%"
	    if(GS.flag[57] == 2 and pop <= 0)
	        GS.msg[0]= "* Determination./%%"
	    if(pop <= 0 and GS.flag[57] != 2)
	        GS.msg[0]= "* The comedian got away^1.&* Failure./%%"
	}
	if(scr_murderlv() >= 8 and GS.flag[27] == 0 and (room == 83 or room == 86 or room == 94 or room == 110 or room == 114 or room == 116 or room == 134 or room == 131 or room == 128) and GS.flag[27] == 0) {
	    GS.msc= 0
	    pop= 18 - GS.flag[204]
	    if(pop < 0) pop= 0
	    if(scr_murderlv() >= 8)
	        GS.msg[0]= "\\R* " + string(pop) + " left./%%"
	    if(pop <= 0) GS.msg[0]= "* Determination./%%"
	}
	if(scr_murderlv() >= 12 and GS.flag[27] == 0 and (room == 139 or room == 145 or room == 155 or room == 164 or room == 176 or room == 183 or room == 196 or room == 210) and GS.flag[27] == 0) {
	    GS.msc= 0
	    pop= 40 - GS.flag[205]
	    if(pop < 0) pop= 0
	    if(scr_murderlv() >= 12)
	        GS.msg[0]= "\\R* " + string(pop) + " left./%%"
	    if(pop <= 0) GS.msg[0]= "* Determination./%%"
	}
	if(scr_murderlv() >= 16) {
	    GS.msc= 0
	    GS.msg[0]= "* Determination./%%"
	}
	if(offroom == 0) mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(not instance_exists(782/* OBJ_WRITER */) and myinteract == 4) {
	    if(GS.plot < 2) GS.plot= 2
	    GS.interact= 5
	    GS.menuno= 4
	    myinteract= 5
	}

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
