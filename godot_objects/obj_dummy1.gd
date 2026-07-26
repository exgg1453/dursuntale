# Auto-converted from GameMaker: obj_dummy1
# GM parent: obj_solidnpcparent
extends Node2D

func _ready():
	myinteract= 0

func _gm_event_1_0():
	GS.flag[14]= 1

func _process(delta: float):
	if(myinteract == 1 and GS.plot < 6) {
	    GS.flag[10]= 0
	    GS.flag[11]= 0
	    GS.flag[12]= 0
	    GS.flag[13]= 0
	    GS.entrance= 0
	    GS.battlegroup= 2
	    obj_mainchara.z_index= -600
	    if(not instance_exists(142/* obj_battler */)) instance_create(0, 0, 142/* obj_battler */)
	    GS.plot= 6
	    myinteract= 0
	}
	script_execute(113/* scr_depth */)

func _gm_event_7_4():
	if(GS.flag[14] == 1) instance_destroy()

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
