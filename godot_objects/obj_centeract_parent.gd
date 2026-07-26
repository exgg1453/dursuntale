# Auto-converted from GameMaker: obj_centeract_parent
# GM parent: obj_6parent
extends Node2D

func _ready():
	frame= 0
	image_speed= 0

func _process_begin(delta: float):
	if(frame == 1 and keyboard_multicheck_pressed(0/* NOKEY */))
	    event_user(4)
	frame= 0

func _on_alarm_0_timeout():
	frame= 1

func _gm_event_7_14():
	// obj_flowey_bulletmaster
	with(1584) soulmax= 1000
	if(obj_flowey_master.dcon == 30) {
	    obj_flowey_master.dcon= 31
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
