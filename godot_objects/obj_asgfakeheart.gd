# Auto-converted from GameMaker: obj_asgfakeheart
extends Node2D

func _ready():
	shake= 3
	modulate.a= 0

func _gm_event_2_1():
	snd_play(30/* snd_break2 */)
	visible= 0
	instance_create(x - 2, y, 747/* obj_theartshard */)
	instance_create(x, y + 3, 747/* obj_theartshard */)
	instance_create(x + 2, y + 6, 747/* obj_theartshard */)
	instance_create(x + 8, y, 747/* obj_theartshard */)
	instance_create(x + 10, y + 3, 747/* obj_theartshard */)
	instance_create(x + 12, y + 6, 747/* obj_theartshard */)

func _process(delta: float):
	modulate.a+= 0.025
	x= xstart + random(shake) - random(shake)
	y= ystart + random(shake) - random(shake)

func _gm_event_7_10():
	sprite_index= 621/* spr_torheartbreak_again */
	x-= 2
	$Alarm1.start((40) / 30.0)
	shake= 0
	snd_play(31/* snd_break1 */)

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
