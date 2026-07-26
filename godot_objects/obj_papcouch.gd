# Auto-converted from GameMaker: obj_papcouch
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
	if(GS.flag[83] == 0) {
	    GS.msg[0]= "* (You touch the couch.^1)&* (It makes a jangling sound.)/"
	    GS.msg[1]= "* (You find a bunch of loose&  coins inside the couch...)/"
	    GS.msg[2]= "* (You got 20G.)/%%"
	    GS.gold+= 20
	    GS.flag[83]= 1
	} else  GS.msg[0]= "* (It\'s a saggy old couch.)/%%"
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
