# Auto-converted from GameMaker: obj_lazyencounterer
extends Node2D

func _ready():
	instance_destroy()
	cl= 0
	if(room == 144 and GS.flag[408] > 0) instance_destroy()
	if(room == 148 and GS.flag[408] > 1) instance_destroy()
	if(room == 159 and GS.flag[408] > 2) instance_destroy()
	if(room == 171 and GS.flag[408] > 3) instance_destroy()
	if(room == 174 and GS.flag[408] > 4) instance_destroy()
	if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()

func _on_alarm_0_timeout():
	if(cl == 0) {
	    GS.battlegroup= battleno
	    GS.border= 0
	    other.x= other.xprevious
	    other.y= other.yprevious
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    cl= 1
	    GS.flag[408]++
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
