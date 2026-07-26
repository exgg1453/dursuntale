# Auto-converted from GameMaker: obj_napstablook_cd
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	myinteract= 0
	scale.x= 1
	scale.y= 1
	con= 0
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 10) instance_destroy()
	buffer= 0

func _on_destroy():
	myinteract= 3
	no= 0
	if(id == instance_find(object_index, 1)) no= 1
	if(id == instance_find(object_index, 2)) no= 2
	GS.msc= 606
	if(no == 1) GS.msc= 608
	if(no == 2) GS.msc= 610
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "*"
	if(buffer > 0) {
	    GS.msc= 0
	    GS.msg[0]= "* (You still need to recover&  after all that lying down.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	buffer--

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
