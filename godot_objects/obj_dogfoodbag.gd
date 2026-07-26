# Auto-converted from GameMaker: obj_dogfoodbag
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (It\'s a half-empty bag&  of dog food.)/%%"
	if(GS.kills == 0)
	    GS.msg[0]= "* (It\'s a bag of dog food.^1)&* (It\'s half-full.)/%%"
	if(GS.kills > 20 and GS.flag[52] == 1 and GS.flag[53] == 1 and GS.flag[54] == 1 and GS.flag[55] == 1) {
	    GS.msg[0]= "* (It\'s a half-empty bag&  of dog food.)/"
	    GS.msg[1]= "* (...)/"
	    GS.msg[1]= "* (You just remembered&  something funny.)/%%"
	}
	if(GS.plot < 126 and scr_murderlv() < 12)
	    GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
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
