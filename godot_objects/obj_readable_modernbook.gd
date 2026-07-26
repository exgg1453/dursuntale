# Auto-converted from GameMaker: obj_readable_modernbook
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	GS.msg[0]= "* (Here I am..^1.&* Writing this book.)/"
	GS.msg[1]= "* (A person comes in and picks&  up the book...)/"
	GS.msg[2]= "* (They start reading it...!)/"
	GS.msg[3]= "* Oh^1, sorry^1.&* I\'m still writing that one./%%"
	read++
	if(scr_murderlv() >= 7) GS.msg[0]= "* (Some unfinished book.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	if(instance_exists(1478/* obj_librarynpc_lizard2 */)) {
	    if(instance_exists(782/* OBJ_WRITER */) and myinteract == 3) {
	        if(OBJ_WRITER.stringno == 3) obj_librarynpc_lizard2.image_speed= 0.2
	    } else  {
	        if(obj_librarynpc_lizard2.myinteract != 3) {
	            obj_librarynpc_lizard2.image_speed= 0
	            obj_librarynpc_lizard2.frame= 0
	        }
	    }
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
