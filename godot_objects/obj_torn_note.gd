# Auto-converted from GameMaker: obj_torn_note
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	talkedto= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= " error/%%"
	if(room == 246) {
	    GS.msg[0]= "* (There\'s a note on the&  ground...^1)&* (You can\'t make it all out.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "elevator..^1. lost power..^1." + chr(ord('"')) + "&* " + chr(ord('"')) + "enter the center door..." + chr(ord('"')) + "/"
	    GS.msg[2]= "* (That\'s all you could read.)/%%"
	}
	if(room == 249) {
	    GS.msg[0]= "* (There\'s a note on the&  ground...^1)&* (You can\'t make it all out.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "drain..^1. dropped it..." + chr(ord('"')) + "/"
	    GS.msg[2]= "* (That\'s all you could read.)/%%"
	}
	if(room == 253) {
	    GS.msg[0]= "* (There\'s a note on the&  ground...^1)&* (You can\'t make it all out.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "cold..." + chr(ord('"')) + "/"
	    GS.msg[2]= "* (That\'s all you could read.)/%%"
	}
	if(room == 259) {
	    GS.msg[0]= "* (There\'s a note on the&  ground...^1)&* (You can\'t make it all out.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "curtain..." + chr(ord('"')) + "/"
	    GS.msg[2]= "* (That\'s all you could read.)/%%"
	}
	if(room == 257) {
	    GS.msg[0]= "* (There\'s a note on the&  ground...^1)&* (You can\'t make it all out.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "under..^1. sheets..." + chr(ord('"')) + "/"
	    GS.msg[2]= "* (That\'s all you could read.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

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
