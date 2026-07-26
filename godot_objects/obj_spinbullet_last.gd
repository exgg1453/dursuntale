# Auto-converted from GameMaker: obj_spinbullet_last
extends Node2D

func _ready():
	image_speed= 0.5
	secrettrick= 0
	wht= 0

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(secrettrick == 1) {
	    z_index= -1
	    wht+= 0.01
	    draw_set_alpha(wht)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
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
