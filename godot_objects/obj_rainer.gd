# Auto-converted from GameMaker: obj_rainer
extends Node2D

func _ready():
	$Alarm1.start((1) / 30.0)
	instance_create(0, 0, 1155/* obj_umbrellamask */)

func _gm_event_2_1():
	$Alarm1.start((1) / 30.0)
	repeat(2)  {
	    if(room == 106)
	        instance_create(view_xview[0] - 40 + random(360), view_yview[0] - random(50) - 70, 1153/* obj_normaldrop */)
	    if(room == 107)
	        instance_create(120 + random(60), view_yview[0] - random(240), 1153/* obj_normaldrop */)
	}
	if(room == 109) {
	    d= instance_create(random(340), view_yview[0] - random(50) - 90, 1153/* obj_normaldrop */)
	    d.dont= 1
	    d= instance_create(random(180) + 340, view_yview[0] - random(50) - 130, 1153/* obj_normaldrop */)
	    d.dont= 1
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
