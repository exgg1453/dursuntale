# Auto-converted from GameMaker: blt_flybullet
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	dmg= 0
	image_speed= 0.5
	move_towards_point(obj_heart.x + 2, obj_heart.y + 2, 2.5)
	$Alarm0.start((30) / 30.0)
	$Alarm1.start((45) / 30.0)

func _gm_event_2_1():
	$Alarm0.start((30) / 30.0)
	$Alarm1.start((45) / 30.0)
	move_towards_point(obj_heart.x + 2, obj_heart.y + 2, 3)

func _on_destroy():
	speed= 0

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
