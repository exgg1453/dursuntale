# Auto-converted from GameMaker: obj_torieltrigger3
extends CharacterBody2D

func _ready():
	scale.x= 50
	scale.y= 1
	conversation= 0
	if(GS.plot > 6) instance_destroy()
	if(GS.plot == 5.5) conversation= 3
	if(GS.plot == 6) conversation= 4

func _gm_event_2_7():
	tor3= instance_create(obj_torinteractable4.x, obj_torinteractable4.y, 862/* obj_toroverworld4 */)
	// obj_torinteractable4
	with(872) instance_destroy()
	with(tor3) direction= 270
	GS.msc= 212
	GS.typer= 4
	GS.facechoice= 1
	GS.interact= 1
	instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 6

func _process(delta: float):
	if(conversation == 1 and instance_exists(862/* obj_toroverworld4 */)) {
	    tor.facing= 0
	    GS.msc= 211
	    GS.typer= 4
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1.5
	}
	if(conversation == 1.5 and not instance_exists(779/* obj_dialoguer */)) {
	    with(tor) path_start(11/* path_torielwalk4 */, 4, 0, 0/* path_action_stop */)
	    GS.interact= 0
	    conversation= 2
	}
	if(conversation == 2 and instance_exists(862/* obj_toroverworld4 */) and obj_toroverworld4.path_position == 1) {
	    tor2= instance_create(tor.x, tor.y, 872/* obj_torinteractable4 */)
	    with(tor2) direction= 270
	    // obj_toroverworld4
	    with(862) instance_destroy()
	    GS.plot= 5.5
	    conversation= 3
	}
	if(GS.plot == 6 and conversation == 3 and (GS.flag[10] == 1 or GS.flag[11] == 1 or GS.flag[12] == 1 or GS.flag[13] == 1)) {
	    GS.interact= 1
	    $Alarm7.start((15) / 30.0)
	    conversation= 4
	}
	if(conversation == 4) GS.interact= 1
	if(conversation == 6 and not instance_exists(779/* obj_dialoguer */)) {
	    with(tor3) path_start(12/* path_torielwalk4_2 */, 3, 0, 0/* path_action_stop */)
	    GS.plot= 7
	    conversation= 8
	    GS.interact= 0
	    instance_destroy()
	}

func _gm_event_7_4():
	if(GS.plot == 5 and conversation == 0) {
	    tor= instance_create(60, 100, 862/* obj_toroverworld4 */)
	    conversation= 1
	    GS.interact= 1
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
