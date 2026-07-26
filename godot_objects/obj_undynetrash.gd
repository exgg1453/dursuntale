# Auto-converted from GameMaker: obj_undynetrash
# GM parent: obj_readable
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
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (The trashcan is full&  of broken spears.)/%%"
	if(room == 119) {
	    GS.msg[0]= "* (The trashcan is empty.)/%%"
	    if(GS.flag[92] < 3) {
	        GS.flag[92]= 3
	        GS.msg[0]= "* (You found a trashcan.)/"
	        GS.msg[1]= "* (Inside the trashcan&  was a key^1, barely visible&  to the naked eye...)/"
	        GS.msg[2]= "* (You take it.)/%%"
	        if(instance_exists(1143/* obj_stable */) and obj_stable.open == 0)
	            obj_stable.open= 1
	    }
	}
	if(room == 141) {
	    GS.msg[0]= "* (A garbage can.^1)&* (But it\'s pretty cute.)/%%"
	    if(GS.plot < 126 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(GS.flag[493] >= 10) {
	        GS.msg[0]= "* (There\'s a message crumpled&  up in the trash can.)/"
	        GS.msg[1]= "* (It\'s in a strange kind&  of handwriting.)/"
	        GS.msg[2]= "* (It says...)/"
	        GS.msg[3]= "* (I KNOW WHAT YOU DID.)/%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	object_index.talkedto++

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
