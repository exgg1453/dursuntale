# Auto-converted from GameMaker: obj_torieltrigger4
extends Node2D

func _ready():
	scale.x= 1
	scale.y= 50
	conversation= 0

func _process(delta: float):
	if(conversation == 3 and instance_exists(862/* obj_toroverworld4 */) and obj_toroverworld4.path_position == 1) {
	    GS.currentsong= caster_load("music/toriel.ogg")
	    caster_loop(GS.currentsong, 0.7, 0.86)
	    with(tor) path_end()
	    with(tor) direction= 180
	    with(tor) facing= 3
	    with(tor) sprite_index= 1110/* spr_toriel_lt */
	    GS.msc= 220
	    GS.typer= 4
	    GS.facechoice= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 4
	    GS.phone[0]= 201
	    GS.phone[1]= 203
	    GS.phone[2]= 204
	    GS.phone[3]= 205
	    GS.menuchoice[2]= 1
	    instance_create(160, 100, 1339/* obj_stalkerflowey */)
	}
	if(conversation == 4 and not instance_exists(779/* obj_dialoguer */)) {
	    instance_create(0, 0, 884/* obj_tordogcall */)
	    with(tor) path_start(41/* path_walkright */, 3, 0, 0/* path_action_stop */)
	    script_execute(59/* scr_tempsave */)
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	other.x= other.xprevious
	other.y= other.yprevious
	if(conversation == 0) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    GS.plot= 9
	    GS.interact= 1
	    tor= instance_create(obj_torinteractable6.x, obj_torinteractable6.y, 862/* obj_toroverworld4 */)
	    // obj_torinteractable6
	    with(874) instance_destroy()
	    // obj_toroverworld4
	    with(862) path_start(15/* path_torielwalk6 */, 3, 0, 0/* path_action_stop */)
	    conversation= 3
	}

func _gm_event_7_4():
	if(GS.plot > 8.5) instance_destroy()

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
