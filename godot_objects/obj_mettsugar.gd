# Auto-converted from GameMaker: obj_mettsugar
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	if(GS.plot > 134) instance_destroy()
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (You found the sugar.)/%%"
	con= 1
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_end(delta: float):
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mettaton_npc.sugar= 1
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
