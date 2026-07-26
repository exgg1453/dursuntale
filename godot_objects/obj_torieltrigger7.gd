# Auto-converted from GameMaker: obj_torieltrigger7
extends Node2D

func _ready():
	scale.x= 50
	conversation= 0
	if(GS.plot > 18) instance_destroy()
	else  {
	    // obj_mainchara
	    with(1570) {
	        x= 38
	        y= 144
	    }
	    GS.typer= 4
	    GS.interact= 99
	    GS.facechoice= 1
	    GS.faceemotion= 0
	    GS.msc= 0
	    $Alarm0.start((1) / 30.0)
	    $Alarm3.start((3) / 30.0)
	    GS.msg[0]= "* This is it.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1
	}
	volume= 1
	fademusicout= 0
	tiddywinkle= 0
	ruff= 2

func _gm_event_2_5():
	with(ruff) instance_destroy()
	// obj_toroverworld3
	with(861) visible= 1
	conversation= 5
	GS.faceemotion= 1
	obj_mainchara.visible= 1
	GS.msg[0]= "* Is something burning...?&* Um^1, make yourself&  at home!/%%"
	obj_toroverworld3.phone= 0
	obj_toroverworld3.usprite= 1112
	instance_create(0, 0, 779/* obj_dialoguer */)

func _gm_event_2_3():
	// obj_mainchara
	with(1570) {
	    x= 38
	    y= 144
	}

func _gm_event_2_2():
	obj_toroverworld3.x+= 19
	obj_mainchara.y--
	obj_mainchara.x+= 8
	obj_mainchara.visible= 1

func _gm_event_2_1():
	if(is_instance_valid(ruff)) {
	    $Alarm6.start((20) / 30.0)
	    obj_toroverworld3.myinteract= 17
	} else  obj_toroverworld3.myinteract= 0

func _on_destroy():
	toriel= instance_create(54, 120, 861/* obj_toroverworld3 */)
	toriel.facing= 3
	toriel.sprite_index= 1108/* spr_toriel_l */
	toriel= direction == 180
	// obj_mainchara
	with(1570) {
	    x= 38
	    y= 144
	}

func _process(delta: float):
	if(conversation == 1 and not instance_exists(779/* obj_dialoguer */)) {
	    conversation= 2
	    // obj_toroverworld3
	    with(861) x-= 10
	    obj_toroverworld3.rsprite= 1114
	    obj_toroverworld3.usprite= 1117
	    obj_toroverworld3.sprite_index= 1114/* spr_toriel_handhold_r */
	    obj_mainchara.visible= 0
	    // obj_toroverworld3
	    with(861) path_start(21/* path_torielwalk20_2 */, 2, 0, 0/* path_action_stop */)
	    // obj_mainchara
	    with(1570) path_start(21/* path_torielwalk20_2 */, 2, 0, 0/* path_action_stop */)
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 2 and obj_toroverworld3.path_position == 1) {
	    obj_toroverworld3.usprite= 1112
	    obj_toroverworld3.rsprite= 1107
	    obj_mainchara.x+= 33
	    $Alarm2.start((1) / 30.0)
	    obj_toroverworld3.y--
	    obj_toroverworld3.facing= 2
	    obj_toroverworld3.direction= 90
	    GS.facing= 2
	    obj_mainchara.y-= 3
	    GS.msg[0]= "* A room of your own.&* I hope you like it!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 3
	}
	if(conversation == 3 and not instance_exists(779/* obj_dialoguer */)) {
	    $Alarm5.start((90) / 30.0)
	    // obj_toroverworld3
	    with(861) visible= 0
	    ruff= scr_marker(obj_toroverworld3.x, obj_toroverworld3.y, 1101)
	    ruff.image_speed= 0.1
	    obj_mainchara.visible= 0
	    $Alarm1.start((10) / 30.0)
	    conversation= 4
	}
	if(conversation == 5 and not instance_exists(779/* obj_dialoguer */)) {
	    obj_toroverworld3.usprite= 1112
	    GS.interact= 0
	    conversation= 2
	    // obj_toroverworld3
	    with(861) path_start(20/* path_torielwalk20 */, 6, 0, 0/* path_action_stop */)
	    GS.plot= 19
	    instance_destroy()
	}

func _on_outside_room():
	draw_set_color(255)
	draw_set_font(2)
	if(instance_exists(1570/* obj_mainchara */)) {
	    draw_text(20, 60, obj_mainchara.x)
	    draw_text(20, 80, obj_mainchara.y)
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
