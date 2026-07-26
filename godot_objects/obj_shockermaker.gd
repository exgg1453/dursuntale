# Auto-converted from GameMaker: obj_shockermaker
extends Node2D

func _ready():
	z_index= obj_heart.z_index + 1

func _on_outside_room():
	dirface= point_direction(x, y, obj_heart.x + 5, obj_heart.y + 5)
	diramt= point_distance(x, y, obj_heart.x + 5, obj_heart.y + 5)
	imax= 20
	i= 0
	while(i < imax) {
	    draw_sprite_ext(348/* spr_shockpart */, random(10), x + lengthdir_x(diramt, dirface) * i / imax + random(12), y + lengthdir_y(diramt, dirface) * i / imax + random(12), 1, 1, dirface, 16777215, 1)
	    i++
	}
	draw_sprite(347/* spr_shockfinal */, random(5), obj_heart.x - 5, obj_heart.y - 5)
	obj_heart.x+= random(2) - 1
	obj_heart.y+= random(2) - 1

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
