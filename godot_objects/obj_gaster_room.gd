# Auto-converted from GameMaker: obj_gaster_room
extends Node2D

func _ready():
	audio_stop_all()
	_play_sound("412")
	ch= choose(0, 1, 2, 3)
	GS.msc= 0
	GS.typer= 666
	GS.msg[0]= "ENTRY NUMBER&SEVENTEEN/"
	GS.msg[1]= "DARK&DARKER&YET DARKER/"
	GS.msg[2]= "THE DARKNES^2S&KEEPS GROWING/"
	GS.msg[3]= "THE SHADOW^2S&CUTTING DEEPER/"
	GS.msg[4]= "PHOTON&READING^2S&NEGATIVE/"
	GS.msg[5]= "THIS NEX^2T&EXPERIMENT/"
	GS.msg[6]= "SEEMS/"
	GS.msg[7]= "VERY/"
	GS.msg[8]= "VERY/"
	GS.msg[9]= "INTERESTING/"
	GS.msg[10]= ".../"
	GS.msg[11]= "WHAT DO YOU&TWO THINK/%%"
	instance_create(20, 20, 782/* OBJ_WRITER */)

func _gm_event_7_0():
	if(not instance_exists(782/* OBJ_WRITER */)) game_end()

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
