# Auto-converted from GameMaker: obj_shaker
extends Node2D

func _ready():
	hshake= GS.hshake
	vshake= GS.vshake
	$Alarm0.start((1) / 30.0)
	shakespeed= GS.shakespeed
	myview= view_current
	myx= view_xview[myview]
	myy= view_yview[myview]

func _gm_event_1_0():
	view_xview[myview]= myx
	view_yview[myview]= myy

func _on_destroy():
	if(hshake != 0) {
	    if(hshake < 0) {
	        view_xview[myview]+= hshake
	        hshake++
	    }
	    if(hshake > 0)
	        view_xview[myview]+= hshake
	    hshake= -hshake
	}
	if(vshake != 0) {
	    if(vshake > 0)
	        view_yview[myview]+= vshake
	    if(vshake < 0) {
	        view_yview[myview]+= vshake
	        vshake++
	    }
	    vshake= -vshake
	}
	alarm[myview]= shakespeed
	if(hshake == 0 and vshake == 0) instance_destroy()

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
