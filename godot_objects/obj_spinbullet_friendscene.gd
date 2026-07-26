# Auto-converted from GameMaker: obj_spinbullet_friendscene
extends Node2D

func _ready():
	image_speed= 0.5
	fade= 0
	f_timer= 0

func _process(delta: float):
	if(fade == 1) {
	    f_timer++
	    if(f_timer > 8) modulate.a-= 0.1
	    if(modulate.a < 0.1) instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.invc <= 1 and f_timer == 0) {
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= 15
	    GS.hp-= 7
	    if(GS.hp <= 1) GS.hp= 1
	}

func _gm_event_7_0():
	instance_destroy()

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
