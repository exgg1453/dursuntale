# Auto-converted from GameMaker: obj_birbnoise
extends Node2D

func _ready():
	birb= caster_load("music/birdnoise.ogg")
	birbvol= 0
	birbcon= 0
	caster_loop(birb, birbvol, 1)

func _process(delta: float):
	if(obj_mainchara.y < get_viewport_rect().size.y - 80 and obj_mainchara.y > 130) {
	    if(birbvol < 0.8) birbvol+= 0.02
	} else  {
	    if(birbvol > 0.05) birbvol-= 0.05
	}
	caster_set_volume(birb, birbvol)

func _gm_event_7_5():
	caster_free(birb)

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
