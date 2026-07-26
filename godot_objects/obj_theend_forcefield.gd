# Auto-converted from GameMaker: obj_theend_forcefield
extends Node2D

func _ready():
	con= 0
	ended= 0
	if(GS.flag[418] == 1) ended= 1
	if(GS.flag[419] == 1) ended= 1
	if(GS.flag[420] == 1) ended= 1
	if(ended == 0) {
	    ff= instance_create(x, y, 1183/* obj_kitchenforcefield */)
	    ff.scale.y= 4
	    ff.basic= 0
	}
	timer= 0

func _process(delta: float):
	if(ended == 0 and GS.flag[420] == 0) {
	    timer++
	    if(timer > 1800 and GS.interact == 0) {
	        with(ff) {
	            with(solid1) instance_destroy()
	        }
	        ended= 5
	        snd_play(21/* snd_impact */)
	        GS.flag[420]= 1
	    }
	}
	if(ended == 5) {
	    with(ff) modulate.a-= 0.1
	    if(ff.modulate.a < 0.1) {
	        with(ff) instance_destroy()
	        ended= 6
	    }
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
