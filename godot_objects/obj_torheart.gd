# Auto-converted from GameMaker: obj_torheart
extends Node2D

func _ready():
	GS.monster[0]= 1
	$Alarm6.start((1) / 30.0)
	shake= 3
	modulate.a= 0
	$Alarm0.start(120 / 30.0)

func _gm_event_2_3():
	caster_stop(GS.batmusic)
	caster_free(GS.batmusic)
	room_goto(GS.currentroom)

func _gm_event_2_2():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm3.start((20) / 30.0)

func _gm_event_2_1():
	snd_play(30/* snd_break2 */)
	visible= 0
	instance_create(x - 2, y, 747/* obj_theartshard */)
	instance_create(x, y + 3, 747/* obj_theartshard */)
	instance_create(x + 2, y + 6, 747/* obj_theartshard */)
	instance_create(x + 8, y, 747/* obj_theartshard */)
	instance_create(x + 10, y + 3, 747/* obj_theartshard */)
	instance_create(x + 12, y + 6, 747/* obj_theartshard */)
	$Alarm2.start((180) / 30.0)

func _on_destroy():
	room_speed= 30
	snd_play(31/* snd_break1 */)
	sprite_index= 45/* spr_torheartbreak */
	x-= 2
	$Alarm1.start((40) / 30.0)
	shake= 0

func _process(delta: float):
	x= xstart + random(shake) - random(shake)
	y= ystart + random(shake) - random(shake)
	modulate.a+= 0.01

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
