# Auto-converted from GameMaker: obj_torchpuzzle
extends Node2D

func _ready():
	h= 0
	solved= 0
	if(room == 91 and GS.plot > 108) {
	    solved= 1
	    // obj_solidtall
	    with(14) instance_destroy()
	    i= 0
	    while(i < 12) {
	        g= instance_create(440 + i * 20, 100, 1096/* obj_proxglower */)
	        g= instance_create(440 + i * 20, 180, 1096/* obj_proxglower */)
	        i++
	    }
	    obj_proxglower.image_speed= 0.25
	    obj_proxglower.sprite_index= 1601/* spr_smallstar */
	}

func _process_end(delta: float):
	if(h >= 3 and solved == 0) {
	    if(room == 91) {
	        // obj_solidtall
	        with(14) instance_destroy()
	    }
	    solved= 1
	    if(GS.plot < 109) GS.plot= 109
	    i= 0
	    while(i < 12) {
	        g= instance_create(440 + i * 20, 100, 1096/* obj_proxglower */)
	        g= instance_create(440 + i * 20, 180, 1096/* obj_proxglower */)
	        i++
	    }
	    obj_proxglower.image_speed= 0.25
	    obj_proxglower.sprite_index= 1601/* spr_smallstar */
	}
	h= 0

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
