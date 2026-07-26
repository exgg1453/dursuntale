# Auto-converted from GameMaker: obj_papcheckpoint
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	scr_depth(0, 0, 0, 0, 0)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* There\'s some narration on this&  cardboard box./"
	GS.msg[1]= "\\TP %"
	GS.msg[2]= "YOU OBSERVE THE&WELL-CRAFTED&SENTRY STATION./"
	GS.msg[3]= "WHO COULD HAVE&BUILT THIS^1, YOU&PONDER.../"
	GS.msg[4]= "I BET IT WAS&THAT VERY FAMOUS&ROYAL GUARDSMAN!/"
	GS.msg[5]= "(NOTE: NOT YET A&VERY FAMOUS&ROYAL GUARDSMAN^1.)/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[5]= "(NOTE: NOT YET A&VERY FAMOUS&ROYAL GUARDSMAN^1.)/"
	    GS.msg[6]= "(UPDATE: AM I A&ROYAL GUARDSMAN&YET???)/%%"
	}
	if(room == 60)
	    GS.msg[0]= "* These instructions&  are written in&  chicken scratch./%%"
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
