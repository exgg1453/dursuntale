# Auto-converted from GameMaker: blt_barkbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 7
	xx= (obj_heart.x - obj_heart.xprevious) * 30
	yy= (obj_heart.y - obj_heart.yprevious) * 30
	move_towards_point(obj_heart.x + xx - 8, obj_heart.y + yy, 7)

func _on_outside_room():
	draw_self_border()

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
