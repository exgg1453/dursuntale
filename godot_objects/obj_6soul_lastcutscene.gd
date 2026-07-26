# Auto-converted from GameMaker: obj_6soul_lastcutscene
extends Node2D

func _ready():
	x= get_viewport_rect().size.x / 2
	y= get_viewport_rect().size.y / 2 - 60
	radius= 170
	siner= 0
	sinerspeed= 0
	con= 0
	counter= 0
	con= 0

func _on_outside_room():
	counter+= sinerspeed
	siner++
	radius+= sin(siner / 6) * 2
	if(con == 1) sinerspeed+= 0.25
	i= 0
	while(i < 6) {
	    draw_sprite(sprite_index, i, x + lengthdir_x(radius, counter + i / 6 * 360), y + lengthdir_y(radius, counter + i / 6 * 360))
	    i++
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
