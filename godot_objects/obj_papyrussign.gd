# Auto-converted from GameMaker: obj_papyrussign
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1

func _on_destroy():
	myinteract= 3
	GS.typer= 17
	GS.facechoice= 3
	GS.msc= 0
	GS.msg[0]= "\\E0* hey there.&* this is just a little test./"
	GS.msg[1]= "\\TS \\F0 \\F4 \\TP %"
	GS.msg[2]= "I WILL BATHE IN&A SHOWER OF KISSES&EVERY MORNING !/"
	GS.msg[3]= "\\TS \\F0 \\F3 \\Ts %"
	GS.msg[4]= "* no^1. not today./%%"
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)

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
