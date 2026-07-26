# Auto-converted from GameMaker: obj_f_frasier
extends Node2D

func _ready():
	GS.msc= 0
	con= 0
	GS.msg[0]= " %"
	GS.msg[1]= " %"
	GS.msg[2]= " %"
	GS.msg[3]= " %"
	GS.msg[4]= "%%%"
	GS.typer= 76
	if(GS.floss == 0)
	    GS.msg[0]= "* Hee hee hee^1.&* Did you really think&  you could run away?/%%"
	if(GS.floss == 1) {
	    GS.msg[0]= "* Hee hee hee./"
	    GS.msg[1]= "* Did you really think&  I was gonna be&  satisfied.../"
	    GS.msg[2]= "* ... killing you only&  ONE time?/%%"
	}
	if(GS.floss == 2)
	    GS.msg[0]= "* Pathetic..^1.&* Now you\'re REALLY&  gonna die!/%%"
	if(GS.floss == 3) {
	    GS.msg[0]= "* Hee hee hee./"
	    GS.msg[1]= "* Do you even realize&  what will happen if&  you defeat me...?/%%"
	}
	if(GS.floss == 4) {
	    GS.msg[0]= "* Don\'t you get it?/"
	    GS.msg[1]= "* There\'s no such thing&  as happy endings./"
	    GS.msg[2]= "* This is all that\'s&  left...!/%%"
	}
	if(GS.floss == 5)
	    GS.msg[0]= "* Are you REALLY that&  desperate...^1?&* Hee hee hee.../%%"
	if(GS.floss == 6)
	    GS.msg[0]= "* Are you letting me&  kill you..^1.&* ... on PURPOSE^2?&* SICKO^1. Ha ha ha./%%"
	if(GS.floss == 7) {
	    GS.msg[0]= "* Honestly^1, fighting&  you IS pretty fun.../"
	    GS.msg[1]= "* ... So even if you&  ARE a sicko^1, I\'ll&  take it!/%%"
	}
	if(GS.floss == 8) {
	    GS.msg[0]= "* Maybe you\'re wondering&  if I ever get tired&  of winning.../"
	    GS.msg[1]= "* Wanna see my answer?/%%"
	}
	if(GS.floss >= 9)
	    GS.msg[0]= "* Don\'t you have anything&  better to do?/%%"
	instance_create(x, y, 1598/* obj_flowey_writer */)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(not instance_exists(1598/* obj_flowey_writer */) and con == 0) {
	    con= 1
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 2) get_tree().change_scene_to_file("res://godot_rooms/294.tscn")

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
