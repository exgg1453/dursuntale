# Auto-converted from GameMaker: obj_xoxo
extends Node2D

func _ready():
	image_speed= 0
	touched= 0

func _on_destroy():
	touched= 0

func _process(delta: float):
	if(collision_rectangle(x + 10, bbox_top - 2, x + 10, bbox_bottom - 2, 1570, 0, 1) and touched == 0) {
	    touched= 1
	    if(frame == 1) {
	        snd_play(141/* snd_instanoise */)
	        frame= 2
	        obj_xoxocontroller1.fvic= 0
	    }
	    if(frame == 0) {
	        frame= 1
	        snd_play(141/* snd_instanoise */)
	    }
	}
	if(collision_rectangle(x + 10, bbox_top - 2, x + 10, bbox_bottom - 2, 1570, 0, 1) < 0 and touched == 1)
	    touched= 0
	if(instance_exists(976/* obj_xoxocontroller1 */) and frame == 1)
	    obj_xoxocontroller1.vic++

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
