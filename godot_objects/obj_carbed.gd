# Auto-converted from GameMaker: obj_carbed
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(instance_exists(1025/* obj_papyrusparent */)) {
	    scr_papface(0, 0)
	    GS.msg[1]= "THAT\'S MY BED!/"
	    GS.msg[2]= "IF I EVER GET&TO THE SURFACE.../"
	    GS.msg[3]= "I\'D LIKE TO&DRIVE DOWN A&LONG HIGHWAY./"
	    GS.msg[4]= "WIND IN MY&HAIR.../"
	    GS.msg[5]= "SUN ON MY&SKIN.../"
	    GS.msg[6]= "\\E3OF COURSE^1, THAT\'S&JUST A DREAM./"
	    GS.msg[7]= "\\E0SO INSTEAD I&CRUISE WHILE I&SNOOZE./%%"
	    if(read > 0) {
	        GS.msg[1]= "WHY ARE YOU SO&INTERESTED IN MY&BED?/"
	        GS.msg[2]= "\\E3ARE YOU TIRED?/%%"
	    }
	} else  GS.msg[0]= "* (It\'s a racecar bed^1, neatly&  made.)/%%"
	read++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
