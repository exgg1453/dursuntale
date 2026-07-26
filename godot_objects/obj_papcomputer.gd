# Auto-converted from GameMaker: obj_papcomputer
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
	    GS.msg[1]= "THE INTERNET^1!&I\'M QUITE&POPULAR THERE./"
	    GS.msg[2]= "I\'M JUST A&DOZEN AWAY.../"
	    GS.msg[3]= "FROM A DOUBLE&DIGIT FOLLOWER&COUNT!/"
	    GS.msg[4]= "\\E3OF COURSE^1, FAME&HAS A STEEP&PRICE./"
	    GS.msg[5]= "\\E1A JEALOUS TROLL&HAS BESIEGED MY&ONLINE PERSONA./"
	    GS.msg[6]= "ALWAYS SENDING&ME BAD PUNS IN&A GOOFY FONT.../%%/"
	    if(read > 0)
	        GS.msg[0]= "* (The computer\'s internet&  browser is opened to&  a social media site.)/%%"
	} else 
	    GS.msg[0]= "* (The computer\'s internet&  browser is opened to&  a social media site.)/%%"
	if(room == 120)
	    GS.msg[0]= "* (The computer\'s internet&  browser is opened to&  a music-sharing forum.)/%%"
	if(room == 266) {
	    GS.msg[0]= "* (Looks like this dog makes&  a lot of bad posts&  on-line.)/"
	    GS.msg[1]= "* (Text to speech is on.)/"
	    GS.msg[2]= "* (Seems like the dog barks^1,&  and it translates to these&  bad posts.)/"
	    GS.msg[3]= "* (It doesn\'t really know what&  it\'s saying.)/"
	    GS.msg[4]= "* (Seems like most bad posts&  on-line^1, are actually this&  dog.)/"
	    GS.msg[5]= "* (Thinking about this...^1)&* (Brings you relief.)/%%"
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
