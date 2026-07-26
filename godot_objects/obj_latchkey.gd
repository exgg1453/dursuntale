# Auto-converted from GameMaker: obj_latchkey
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	if(room == 225 and GS.flag[452] == 1) instance_destroy()
	if(room == 222 and GS.flag[453] == 1) instance_destroy()
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (You took the key and&  put it on your phone\'s&  key-chain.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	if(room == 225) GS.flag[452]= 1
	if(room == 222) GS.flag[453]= 1

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(room == 225 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[452] == 1) {
	    GS.interact= 0
	    instance_destroy()
	}
	if(room == 222 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[453] == 1) {
	    GS.interact= 0
	    instance_destroy()
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
