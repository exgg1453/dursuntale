# Auto-converted from GameMaker: obj_core_lightstrip_m
# GM parent: obj_coreobj_parent
extends Node2D

func _ready():
	siner= 0
	if(instance_exists(1271/* obj_elevatordoor */))
	    z_index= obj_elevatordoor.z_index + 1
	powered= 1

func _on_outside_room():
	if(instance_exists(1183/* obj_kitchenforcefield */))
	    z_index= obj_kitchenforcefield.z_index + 1
	if(powered == 1) siner++
	else  siner= 0
	if(scale.x >= 0) {
	    i= 0
	    while(i < scale.x) {
	        draw_sprite(927/* spr_core_wallstrip_m */, siner / 6, x + i * 20, y)
	        i++
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
