# Auto-converted from GameMaker: obj_milkofhell_shot
extends Node2D

func _ready():
	scale.x= 0.2
	scale.y= 0.4
	gravity= 0.4
	rotation_degrees+= random(20) * choose(1, -1)
	gravity_direction+= rotation_degrees
	anim= 0

func _process(delta: float):
	scale.x+= 0.1
	scale.y+= 0.05

func _on_alarm_0_timeout():
	event_user(0)
	// other
	with(-2) {
	    if(eligible == 1) event_user(0)
	}
	snd_play(106/* snd_noise */)

func _gm_event_7_10():
	splat= instance_create(x, y, 1176/* obj_milkofhell_splatter */)
	splat.rotation_degrees= rotation_degrees
	splat.scale.x= scale.x
	splat.scale.y= scale.y
	splat.speed= speed
	splat.direction= direction
	splat.friction= 2
	repeat(8)  instance_create(x, y, 1177/* obj_milkofhell_drop */)
	instance_destroy()

func _on_outside_room():
	draw_set_color(16777215)
	xprev2= x - (x - xprevious) * 2
	yprev2= y - (y - yprevious) * 2
	draw_sprite_ext(sprite_index, frame, xprev2, yprev2, scale.x - 0.6, scale.y - 0.6, rotation_degrees, 16777215, 0.3)
	draw_sprite_ext(sprite_index, frame, xprevious, yprevious, scale.x - 0.3, scale.y - 0.3, rotation_degrees, 16777215, 0.6)
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, 16777215, 1)

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
