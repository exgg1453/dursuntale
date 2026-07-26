# Auto-converted from GameMaker: obj_introlast
extends Node2D

func _ready():
	h= 10
	go= 0
	$Alarm0.start((150) / 30.0)
	$Alarm2.start((20) / 30.0)
	visible= 0

func _gm_event_2_2():
	visible= 1

func _on_destroy():
	go= 1

func _on_outside_room():
	draw_sprite_part(sprite_index, frame, 0, sprite_height - h + 100, 320, sprite_height - h, 0, 30)
	if(go == 1) h++
	if(h > 240) h--

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
