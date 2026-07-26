# Auto-converted from GameMaker: obj_torieltrigger11
extends Node2D

func _ready():
	scale.y= 100
	conversation= 0
	if(GS.plot > 23) instance_destroy()
	dingus= 0

func _process(delta: float):
	dingus++
	if(GS.plot == 23 and dingus == 2) {
	    instance_create(140, 90, 861/* obj_toroverworld3 */)
	    obj_toroverworld3.facing= 2
	    obj_toroverworld3.direction= 90
	}
	if(conversation == 2 and not instance_exists(779/* obj_dialoguer */)) {
	    // obj_toroverworld3
	    with(861) path_start(39/* path_walkup */, 4, 0, 0/* path_action_stop */)
	    GS.plot= 24
	    GS.interact= 0
	    instance_destroy()
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 6
	    GS.msc= 0
	    GS.msg[0]= "* Do not try to stop me./"
	    GS.msg[1]= "* This is your final&  warning./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}

func _on_alarm_0_timeout():
	other.x= other.xprevious
	other.y= other.yprevious
	GS.interact= 1
	conversation= 1

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
