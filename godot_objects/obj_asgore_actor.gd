# Auto-converted from GameMaker: obj_asgore_actor
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0
	dsprite= 1904
	usprite= 1907
	lsprite= 1900
	rsprite= 1901
	dtsprite= 1909
	utsprite= 1908
	ltsprite= 1902
	rtsprite= 1903
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0

func _process(delta: float):
	if(d == 0) scr_depth()
	if(fun == 0 and instance_exists(771/* obj_face_asgore */))
	    frame= obj_face_asgore.frame

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
