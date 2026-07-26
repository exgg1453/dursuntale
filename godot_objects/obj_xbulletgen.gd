# Auto-converted from GameMaker: obj_xbulletgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((37) / 30.0)

func _gm_event_2_2():
	xx= get_viewport_rect().size.x / 2 + choose(140, -140)
	xbul= instance_create(xx, obj_heart.y, 315/* obj_xbullet */)
	$Alarm2.start((36) / 30.0)

func _gm_event_2_1():
	xx= get_viewport_rect().size.x / 2 + choose(140, -140)
	xbul= instance_create(xx, random(GS.idealborder[2] + c_borderheight(0)) + 20, 315/* obj_xbullet */)
	$Alarm1.start((4) / 30.0)

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
