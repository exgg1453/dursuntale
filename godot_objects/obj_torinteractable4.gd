# Auto-converted from GameMaker: obj_torinteractable4
# GM parent: obj_torinteractable1
extends CharacterBody2D

func _on_destroy():
	myinteract= 3
	GS.msc= 214
	if(talkedto > 0) GS.msc= 215
	GS.typer= 4
	GS.facechoice= 1
	GS.faceemotion= 2
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _gm_event_7_4():
	if(GS.plot < 5.4 or GS.plot > 6.5) instance_destroy()
	direction= 270

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
