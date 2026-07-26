# Auto-converted from GameMaker: obj_glowshroompuzzle
extends Node2D

func _ready():
	obj_glowshroom.glow= 1
	obj_glowshroom.frame= 1
	solvent= 0
	if(GS.flag[270] == 1) solvent= 1
	if(GS.plot > 117) solvent= 1
	if(solvent == 1) {
	    obj_glowshroom.glow= 0
	    obj_glowshroom.frame= 0
	}
	glowtotal= 0

func _process(delta: float):
	i= 0
	glowtotal= 0
	while(instance_exists(instance_find(1101, i))) {
	    if(instance_exists(instance_find(1101, i))) {
	        q= instance_find(1101, i)
	        if(q.glow == 0) glowtotal++
	    }
	    i++
	}
	i= 1
	repeat(5)  {
	    if(glowtotal >= i) tile_layer_show(1000000 + i)
	    else  tile_layer_hide(1000000 + i)
	    i++
	}
	if(glowtotal >= 4 and GS.flag[270] == 0) GS.flag[270]= 1

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
