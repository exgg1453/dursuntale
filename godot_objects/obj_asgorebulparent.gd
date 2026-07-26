# Auto-converted from GameMaker: obj_asgorebulparent
extends Node2D

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

func _gm_event_7_10():
	dmg= 0
	if(instance_exists(478/* obj_asgoreb */)) dmg= obj_asgoreb.curatk
	set= 0
	if(GS.hp > 1) set= 1
	if(set == 1) {
	    scr_damagestandard_x()
	    if(GS.hp <= 0) GS.hp= 1
	}
	if(set == 0) {
	    scr_damagestandard_x()
	    if(GS.hp <= 0) GS.hp= 0
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
