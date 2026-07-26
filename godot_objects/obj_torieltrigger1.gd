# Auto-converted from GameMaker: obj_torieltrigger1
extends Node2D

func _ready():
	scale.x= 50
	conversation= 0
	if(GS.plot > 2) instance_destroy()

func _gm_event_2_5():
	path_end()
	obj_toroverworld3.direction= 270
	GS.msc= 203
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 3

func _gm_event_2_4():
	// obj_toroverworld3
	with(861) path_start(7/* path_torielwalk2_2 */, 3, 0, 1/* path_action_restart */)
	$Alarm5.start((40) / 30.0)

func _gm_event_2_3():
	GS.interact= 0

func _gm_event_2_2():
	GS.msc= 202
	GS.typer= 4
	GS.interact= 1
	GS.facechoice= 1
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 3

func _process(delta: float):
	if(conversation == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    conversation= 2
	    // obj_toroverworld3
	    with(861) path_start(6/* path_torielwalk2 */, 3, 0, 1/* path_action_restart */)
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 2 and obj_toroverworld3.path_position == 1) {
	    conversation= 2.5
	    // obj_wallswitchcut1
	    with(925) on= 1
	    // obj_toroverworld3
	    with(861) path_end()
	    obj_toroverworld3.direction= 90
	    $Alarm4.start((20) / 30.0)
	}
	if(conversation == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 4
	    GS.interact= 0
	    GS.plot= 3
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 4 and obj_toroverworld3.path_position == 1 and abs(obj_mainchara.y - obj_toroverworld3.y) < 50) {
	    conversation= 5
	    // obj_toroverworld3
	    with(861) path_start(39/* path_walkup */, 3, 0, 0/* path_action_stop */)
	}

func _on_alarm_0_timeout():
	if(conversation == 0) {
	    GS.msc= 202
	    GS.typer= 4
	    GS.interact= 1
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1
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
