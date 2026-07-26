# Auto-converted from GameMaker: obj_fakedoor
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0
	open= 0
	auto= 0
	con= 0
	if(scr_murderlv() >= 8 and GS.flag[27] == 0 and GS.plot < 108)
	    GS.plot= 108
	if(GS.plot > 107 and room == 90) auto= 1
	if(room == 102 and GS.flag[356] == 1) auto= 1
	if(auto == 1) {
	    open= 1
	    visible= 1
	    with(instance_position(x + 10, y + 20, 4)) instance_destroy()
	}

func _gm_event_2_5():
	GS.interact= 0
	obj_mainchara.cutscene= 0

func _gm_event_2_3():
	event_user(1)

func _process(delta: float):
	if(myinteract == 1 and GS.plot < 108 and room == 90) {
	    event_user(1)
	    GS.plot= 108
	}
	if(room == 102 and con == 1 and GS.flag[356] == 0) {
	    GS.flag[356]= 1
	    GS.interact= 1
	    con= 2
	    $Alarm3.start((30) / 30.0)
	}

func _gm_event_7_11():
	snd_play(23/* snd_bluh */)
	GS.interact= 1
	open= 1
	visible= 1
	obj_mainchara.cutscene= 1
	with(instance_position(x + 10, y + 20, 4)) instance_destroy()
	scr_shake(2, 2, 2)
	GS.interact= 1
	$Alarm5.start((30) / 30.0)
	myinteract= 0

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
