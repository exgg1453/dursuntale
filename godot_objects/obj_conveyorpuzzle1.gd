# Auto-converted from GameMaker: obj_conveyorpuzzle1
extends Node2D

func _ready():
	active= 0
	fallen= 0

func _gm_event_2_5():
	GS.entrance= 0
	instance_create(0, 0, 148/* obj_persistentfader */)
	room_goto_next()

func _gm_event_2_4():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm5.start((10) / 30.0)

func _gm_event_2_3():
	GS.facing++
	if(GS.facing > 3) GS.facing= 0
	$Alarm3.start((4) / 30.0)

func _process(delta: float):
	active++
	if(active > 4 and obj_mainchara.x > 316 and obj_mainchara.x < 1166 and fallen == 0) {
	    GS.interact= 1
	    fallen= 1
	    event_user(0)
	}

func _gm_event_7_10():
	$Alarm3.start((4) / 30.0)
	obj_mainchara.modulate.a= 0.5
	obj_mainchara.velocity.y= 4
	GS.interact= 3
	GS.phasing= 1
	$Alarm4.start((5) / 30.0)
	GS.flag[376]= obj_mainchara.x

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
