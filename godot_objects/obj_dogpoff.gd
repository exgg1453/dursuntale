# Auto-converted from GameMaker: obj_dogpoff
extends Node2D

func _ready():
	image_speed= 0
	if(GS.plot >= 64) instance_destroy()
	poffed= 0

func _process(delta: float):
	if(frame == 47 or frame == 51) snd_play(41/* snd_pombark */)

func _gm_event_7_7():
	if(poffed == 0) {
	    frame--
	    image_speed= 0
	    obj_pofftrigger.t= 5
	    obj_pofftrigger.$Alarm4.start((60) / 30.0)
	    poffed= 1
	}
	if(sprite_index == 1273) {
	    image_speed= 0
	    sprite_index= 1275/* spr_dogbuttwalk */
	    obj_pofftrigger.$Alarm4.start((40) / 30.0)
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
