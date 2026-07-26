# Auto-converted from GameMaker: obj_highspider
extends Node2D

func _ready():
	con= 0
	image_speed= 0

func _gm_event_2_5():
	speed= 0

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(0)
	draw_line(x + 4, y - 1, x + 4, -2)
	draw_set_color(16777215)
	draw_line(x + 5, y - 1, x + 5, -2)
	draw_set_color(0)
	draw_line(x + 6, y - 1, x + 6, -2)
	if(obj_mainchara.x > x - 50 and GS.interact == 0) {
	    velocity.y= -3
	    image_speed= 0.25
	}
	if(y < -30) instance_destroy()

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
