# Auto-converted from GameMaker: OBJ_NOMSCWRITER
# GM parent: OBJ_WRITER
extends Node2D

func _ready():
	SCR_TEXTTYPE(GS.typer)
	stringno= 0
	stringpos= 1
	lineno= 0
	halt= 0
	myx= writingx
	myy= writingy
	n= 0
	while(GS.msg[n] != "%%%") {
	    mystring[n]= GS.msg[n]
	    n++
	}
	originalstring= mystring[0]
	dfy= 0
	$Alarm0.start(textspeed / 30.0)

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
