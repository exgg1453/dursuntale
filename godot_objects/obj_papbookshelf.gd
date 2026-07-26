# Auto-converted from GameMaker: obj_papbookshelf
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
	    GS.msg[1]= "THAT BOOK\'S ONE&OF MY&FAVORITES./"
	    GS.msg[2]= "" + chr(ord('"')) + "ADVANCED PUZZLE&CONSTRUCTION FOR&CRITICAL MINDS." + chr(ord('"')) + "/"
	    GS.msg[3]= "THAT NEXT BOOK\'S&ANOTHER ONE OF&MY FAVORITES./"
	    GS.msg[4]= "" + chr(ord('"')) + "PEEK-A-BOO WITH&FLUFFY BUNNY." + chr(ord('"')) + "/"
	    GS.msg[5]= "\\E3THE ENDING&ALWAYS GETS ME./%%"
	    if(read > 0)
	        GS.msg[0]= "* (Complex manuals and&  children\'s books.)/%%"
	} else  {
	    GS.msg[0]= "* (The bookshelf is filled&  with complex tomes&  about puzzle creation.)/"
	    GS.msg[1]= "* (And children\'s books.)/%%"
	}
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
