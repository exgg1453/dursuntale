# Auto-converted from GameMaker: obj_toroverworld7
# GM parent: obj_toroverworld1
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	t= 0
	image_speed= 0
	dsprite= 1103
	usprite= 1112
	lsprite= 1108
	rsprite= 1107
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 0
	conversation= 0
	direction= 180
	if(GS.plot > 8) instance_destroy()
	else  {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.msc= 221
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    GS.interact= 1
	    conversation= 1
	}

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(not instance_exists(779/* obj_dialoguer */) and conversation == 1) {
	    GS.interact= 0
	    conversation= 2
	    myinteract= 0
	    path_start(41/* path_walkright */, 4, 2, 0/* path_action_stop */)
	    instance_create(7, 0, 898/* obj_plotwall3 */)
	    image_speed= 0.3
	    GS.plot= 8.5
	    GS.currentsong= caster_load("music/tension.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	}
	scr_npcdir(0)

func _gm_event_7_0():
	queue_free()

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
