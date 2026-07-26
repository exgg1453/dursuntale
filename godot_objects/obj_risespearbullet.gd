# Auto-converted from GameMaker: obj_risespearbullet
extends Node2D

func _ready():
	visible= 0
	$Alarm1.start((1) / 30.0)
	deactivate= 0
	part= 0
	$Alarm0.start((20) / 30.0)
	type= choose(0, 1)
	dmg= 7
	if(instance_exists(282/* obj_undyne_ex */)) dmg= 11

func _gm_event_2_1():
	visible= 1
	if(type == 0) {
	    scale.y= 1
	    velocity.y= -1
	}
	if(type == 1) {
	    scale.y= -1
	    y-= 150
	    velocity.y= 1
	}
	snd_play(13/* snd_spearappear */)

func _on_destroy():
	if(part == 3) part= 4
	if(part == 2) {
	    velocity.y= 0
	    part= 3
	    $Alarm0.start((2) / 30.0)
	}
	if(part == 1) {
	    if(type == 0) velocity.y= -10
	    if(type == 1) velocity.y= 10
	    snd_play(14/* snd_spearrise */)
	    part= 2
	    $Alarm0.start((6) / 30.0)
	}
	if(part == 0) {
	    part= 1
	    velocity.y= 0
	    $Alarm0.start((12) / 30.0)
	}

func _process(delta: float):
	if(part == 4 or deactivate == 1) {
	    modulate.a-= 0.1
	    if(modulate.a <= 0) instance_destroy()
	}

func _on_alarm_0_timeout():
	if(part > 0 and part < 4 and deactivate == 0)
	    scr_damagestandard_x()

func _on_outside_room():
	draw_self_border_ext(1, 1, 16777215, modulate.a)

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
