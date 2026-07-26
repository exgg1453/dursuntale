# Auto-converted from GameMaker: obj_torieltrigger2
extends CharacterBody2D

func _ready():
	scale.x= 1
	scale.y= 50
	conversation= 0
	if(GS.plot > 4.5) instance_destroy()
	if(GS.plot == 4) conversation= 2.5
	if(GS.plot == 4.5) conversation= 4

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

func _process(delta: float):
	if(conversation == 0 and (obj_mainchara.x > 140 or obj_mainchara.y < 170)) {
	    GS.msc= 204
	    GS.typer= 4
	    GS.interact= 1
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1
	}
	if(conversation == 1 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 0
	    conversation= 2
	    // obj_toroverworld4
	    with(862) path_start(8/* path_torielwalk3 */, 3.25, 0, 1/* path_action_restart */)
	}
	if(instance_exists(862/* obj_toroverworld4 */) and conversation == 2 and obj_toroverworld4.path_position == 1) {
	    conversation= 2.5
	    // obj_toroverworld4
	    with(862) path_end()
	    if(GS.plot < 4) {
	        GS.plot= 4
	        instance_create(obj_toroverworld4.x, obj_toroverworld4.y, 867/* obj_torinteractable1 */)
	        // obj_toroverworld4
	        with(862) instance_destroy()
	    }
	}
	if(conversation == 2.5 and GS.plot == 4.5) {
	    conversation= 3
	    if(instance_exists(867/* obj_torinteractable1 */)) {
	        instance_create(obj_torinteractable1.x, obj_torinteractable1.y, 862/* obj_toroverworld4 */)
	        // obj_torinteractable1
	        with(867) instance_destroy()
	    }
	    // obj_toroverworld4
	    with(862) path_start(9/* path_torielwalk3_2 */, 3, 0, 1/* path_action_restart */)
	}
	if(instance_exists(862/* obj_toroverworld4 */) and conversation == 3 and obj_toroverworld4.path_position == 1) {
	    conversation= 4
	    // obj_toroverworld4
	    with(862) path_end()
	    instance_create(obj_toroverworld4.x, obj_toroverworld4.y, 870/* obj_torinteractable2 */)
	    // obj_toroverworld4
	    with(862) instance_destroy()
	}
	if(conversation == 4 and GS.plot == 5 and not instance_exists(184/* obj_shaker */)) {
	    if(instance_exists(870/* obj_torinteractable2 */)) {
	        instance_create(obj_torinteractable2.x, obj_torinteractable2.y, 862/* obj_toroverworld4 */)
	        // obj_torinteractable2
	        with(870) instance_destroy()
	        // obj_toroverworld4
	        with(862) facing= 3
	        // obj_toroverworld4
	        with(862) sprite_index= lsprite
	    }
	    GS.msc= 210
	    GS.typer= 4
	    GS.interact= 1
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 5
	}
	if(conversation == 5 and not instance_exists(779/* obj_dialoguer */)) {
	    conversation= 6
	    GS.interact= 0
	    // obj_toroverworld4
	    with(862) path_start(41/* path_walkright */, 3, 0, 0/* path_action_stop */)
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
