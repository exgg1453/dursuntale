# Auto-converted from GameMaker: obj_lazyencounterer_core
extends Node2D

func _ready():
	instance_destroy()
	cl= 0
	if(GS.flag[423] > 1 and room != 209) instance_destroy()
	if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()

func _on_alarm_0_timeout():
	GS.flag[15]= 1
	if(cl == 0) {
	    battleno= choose(64, 65)
	    if(GS.flag[423] == 0) battleno= 64
	    if(GS.flag[423] == 1) battleno= 65
	    if(GS.flag[423] == 2) battleno= 68
	    if(GS.flag[419] == 1 and battleno == 68) battleno= 61
	    GS.battlegroup= battleno
	    GS.border= 0
	    other.x= other.xprevious
	    other.y= other.yprevious
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    cl= 1
	    GS.flag[423]++
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
