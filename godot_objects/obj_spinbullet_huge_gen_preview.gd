# Auto-converted from GameMaker: obj_spinbullet_huge_gen_preview
extends Node2D

func _ready():
	modulate.a= 0
	offon= 0
	x= obj_vsflowey_heart.x + 8
	y= obj_vsflowey_heart.y + 8
	if(y + 60 > get_viewport_rect().size.y)
	    y-= y + 60 - get_viewport_rect().size.y
	bonus= 0
	if(instance_number(object_index) == 1) bonus= 3
	$Alarm2.start((2) / 30.0)
	snd_stop(163)
	snd_play(163/* mus_sfx_a_target */)

func _gm_event_2_2():
	snd_stop(163)
	snd_play(163/* mus_sfx_a_target */)
	$Alarm2.start((2) / 30.0)

func _on_outside_room():
	draw_set_circle_precision(24)
	offon++
	if(offon > 2) offon= 0
	if(offon == 0) draw_set_color(255)
	if(offon == 1) draw_set_color(4235519)
	if(offon == 2) draw_set_color(65535)
	modulate.a+= 0.334
	if(modulate.a > 6) draw_set_color(16777215)
	draw_set_alpha(modulate.a)
	draw_circle(x, y, 60, 1)
	draw_set_alpha(1)
	if(modulate.a > 8 + bonus) {
	    instance_create(x, y, 1646/* obj_spinbullet_huge_gen */)
	    instance_destroy()
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
