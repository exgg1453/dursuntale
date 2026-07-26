# Auto-converted from GameMaker: obj_torhandhold1
# GM parent: obj_toroverworld3
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	GS.plot= 7.5
	image_speed= 0
	dsprite= 1113
	usprite= 1117
	lsprite= 1108
	rsprite= 1114
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 0
	direction= 0
	obj_mainchara.visible= 0
	obj_mainchara.y= y + 28
	path_start(14/* path_torielwalk5_2 */, 1, 0, 0/* path_action_stop */)
	GS.phasing= 1
	obj_spiketile2.solid= 0
	// obj_mainchara
	with(1570) path_start(14/* path_torielwalk5_2 */, 1, 0, 0/* path_action_stop */)
	GS.interact= 6
	conversation= 0
	phone= 0

func _on_destroy():
	GS.msc= 218
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 3

func _process_end(delta: float):
	if(path_position == 1 and conversation == 0) {
	    // obj_mainchara
	    with(1570) path_end()
	    path_end()
	    GS.phasing= 0
	    obj_spiketile2.solid= 1
	    obj_mainchara.visible= 1
	    tor= instance_create(x + 12, y, 862/* obj_toroverworld4 */)
	    $Alarm0.start((2) / 30.0)
	    with(tor) direction= 180
	    with(tor) facing= 3
	    visible= 0
	    conversation= 2
	}
	if(conversation == 3 and not instance_exists(779/* obj_dialoguer */)) {
	    with(tor) path_start(41/* path_walkright */, 3, 0, 0/* path_action_stop */)
	    GS.interact= 0
	    instance_destroy()
	    GS.plot= 8
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
