# Auto-converted from GameMaker: obj_killervisage
extends Node2D

func _ready():
	chime= caster_load("music/chime.ogg")
	modulate.a= 0
	active= 0
	sparklefactor= 0

func _process(delta: float):
	if(active == 1) {
	    modulate.a+= 0.02
	    sparklefactor++
	    j= instance_create(x + random(sprite_width), y - 20 + random(sprite_height / 2), 1197/* obj_chimesparkle */)
	    j.maxalpha= modulate.a
	    if(modulate.a > 1) modulate.a= 1
	    if(sparklefactor > 110) active= 2
	}
	if(active == 2) {
	    modulate.a-= 0.02
	    if(modulate.a < 0.04) instance_destroy()
	}

func _gm_event_7_10():
	if(active == 0) {
	    caster_play(chime, 1, 1)
	    active= 1
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
