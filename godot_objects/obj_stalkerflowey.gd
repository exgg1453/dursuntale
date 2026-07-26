# Auto-converted from GameMaker: obj_stalkerflowey
extends Node2D

func _ready():
	image_speed= 0

func _on_destroy():
	image_speed= 0.5

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	script_execute(112/* scr_onscreen */, 37, 18)
	if(onscreen == 1 and $Alarm0.start((= -1) alarm[0]= 1) / 30.0)

func _gm_event_7_7():
	GS.flag[9]++
	instance_destroy()

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
