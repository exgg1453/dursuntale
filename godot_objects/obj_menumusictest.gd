# Auto-converted from GameMaker: obj_menumusictest
extends Node2D

func _ready():
	dingusvol= 0.5
	dongusvol= 0
	dingus= caster_load("music/menu1.ogg")
	dangus= caster_load("music/menu2.ogg")
	dongus= caster_load("music/menu3.ogg")
	dungus= caster_load("music/menu4.ogg")
	caster_loop(dingus, 1, 1)
	caster_loop(dangus, 0, 1)
	caster_loop(dongus, 0, 1)
	caster_loop(dungus, 0, 1)

func _process(delta: float):
	if(Input.is_action_pressed("move_left")) {
	    dongusvol-= 0.02
	    caster_set_volume(dangus, dongusvol)
	    caster_set_volume(dongus, dongusvol - 1)
	    caster_set_volume(dungus, dongusvol - 2)
	}
	if(Input.is_action_pressed("move_right")) {
	    dongusvol+= 0.02
	    caster_set_volume(dangus, dongusvol)
	    caster_set_volume(dongus, dongusvol - 1)
	    caster_set_volume(dungus, dongusvol - 2)
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
