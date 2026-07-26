# Auto-converted from GameMaker: obj_torinteractable1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1103
	usprite= 1112
	lsprite= 1108
	rsprite= 1107
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 1
	direction= 180
	talkedto= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 205
	if(talkedto > 0) GS.msc= 206
	GS.typer= 4
	GS.facechoice= 1
	GS.faceemotion= 2
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(instance_exists(765/* obj_face_torieltalk */))
	    frame= obj_face_torieltalk.frame
	else  frame= 0
	script_execute(106/* scr_npcdir */, 2)

func _gm_event_7_4():
	if(GS.plot != 4) instance_destroy()

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
