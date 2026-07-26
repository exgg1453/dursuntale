# Auto-converted from GameMaker: obj_napstablook2
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	if(GS.flag[36] != 1 or GS.flag[202] > 15 or GS.flag[7] == 1)
	    instance_destroy()
	myinteract= 0
	scale.x= 1
	scale.y= 1
	talkedto= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	talkedto= 1
	GS.msg[0]= "* i fell down a hole...&* now i cant get up.../"
	GS.msg[1]= "* go on without me.../"
	GS.msg[2]= "* wait^1, ghosts can fly^1,&  can\'t they.../"
	GS.msg[3]= "* oh well.../%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(talkedto == 1 and not instance_exists(779/* obj_dialoguer */)) {
	    myinteract= 4
	    modulate.a-= 0.05
	    if(modulate.a < 0.1) {
	        GS.flag[36]= 2
	        instance_destroy()
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
