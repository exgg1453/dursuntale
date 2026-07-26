# Auto-converted from GameMaker: obj_dogmissle
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	anchor= 1
	$Alarm0.start((4) / 30.0)
	scale.x= 2
	scale.y= 2
	off= 0
	dmg= 9

func _on_destroy():
	friction= -0.22 + random(0.1)
	move_towards_point(obj_heart.x + 8, obj_heart.y + 8, 2)
	direction+= random(30) - random(30)
	anchor= 0
	y= obj_amalgam_laserdog.y + 20
	x-= 9

func _on_outside_room():
	if(x < -10) instance_destroy()
	if(anchor == 1) {
	    x= obj_amalgam_laserdog.x + 34
	    y= obj_amalgam_laserdog.y + 16
	    off-= 2
	    draw_sprite_part_ext(sprite_index, 0, 0, 0, 0 - off, sprite_height, x + off * 2, y, 2, 2, 16777215, 1)
	}
	if(anchor == 0)
	    draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)

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
