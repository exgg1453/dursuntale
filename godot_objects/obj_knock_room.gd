# Auto-converted from GameMaker: obj_knock_room
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1
	if(room < 40 and GS.plot == 0) instance_destroy()
	knock= 0

func _gm_event_2_5():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 117) {
	    GS.msg[0]= "* (Doesn\'t seem like&  anyone\'s home.)/%%"
	    if(GS.flag[350] == 0 and instance_exists(1026/* obj_papyrus_room */))
	        GS.msg[0]= "* (If someone\'s there^1,&  they aren\'t answering&  the door.)/%%"
	    if(GS.flag[350] == 1)
	        GS.msg[0]= "* (No one is home.^1)&* (And you get the feeling&  no one ever will be.)/%%"
	    if(GS.flag[350] == 2)
	        GS.msg[0]= "* (You hear irritated groans&  from the inside.)/%%"
	    if(GS.flag[389] >= 2)
	        GS.msg[0]= "* (Sounds like only fire&  lives here now.)/%%"
	}
	if(room == 69 and x > 200) {
	    GS.msg[0]= "* Who\'s there^1?&* I\'m in the middle of&  my favorite TV program./"
	    GS.msg[1]= "* I know^1, I know..^1.&* Staring at a screen...&* Sounds like a boring hobby./"
	    GS.msg[2]= "* But TV offers an escape&  to another world^1.&* We really need that./%%"
	    if(read > 0)
	        GS.msg[0]= "* You wanna watch too^1?&* Sorry^1, this is a one-player&  TV show./%%"
	}
	if(room == 69 and x < 200) {
	    GS.msg[0]= "* Ahh^1, what a beautiful knock..^1.!&* Maybe if I don\'t answer^1,&  I\'ll hear it again./%%"
	    if(read == 1) GS.msg[0]= "* Ahh^1, my patience rewards me./%%"
	    if(read > 1) GS.msg[0]= "* Ahh.../%%"
	    if(scr_murderlv() >= 7) GS.msg[0]= "* (No answer.)/%%"
	}
	if(room == 185) {
	    if(x < 166) GS.msc= 860
	    if(x > 240) GS.msc= 862
	    if(x > 300) GS.msc= 864
	    if(scr_murderlv() >= 12) {
	        GS.msc= 0
	        GS.msg[0]= "* (No answer.)/%%"
	    }
	}
	read++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _on_destroy():
	if(knock == 0) {
	    knock= 1
	    if(knock == 1) $Alarm5.start((30) / 30.0)
	}

func _process_begin(delta: float):
	if(knock > 0) {
	    if(knock == 1) snd_play(17/* snd_knock */)
	    knock= 0
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
