# Auto-converted from GameMaker: obj_vsflowey_shaker
extends Node2D

func _ready():
	shakex= 4
	shakey= 4
	decay= 1
	turn1= 0

func _process(delta: float):
	view_xview[0]= random(shakex) - random(shakex)
	view_yview[0]= random(shakey) - random(shakey)
	if(turn1 == 0) {
	    view_xview[0]= shakex * choose(1, -1)
	    view_yview[0]= shakey * choose(1, -1)
	    turn1= 1
	}
	if(decay == 1) {
	    shakex--
	    shakey--
	}
	if(shakex <= 0 and shakey <= 0) {
	    view_xview[0]= 0
	    view_yview[0]= 0
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
