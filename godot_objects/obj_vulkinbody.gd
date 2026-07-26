# Auto-converted from GameMaker: obj_vulkinbody
extends Node2D

func _ready():
	siner= 0
	$Alarm0.start((10) / 30.0)
	pause= 0
	face= 387

func _on_destroy():
	if(pause == 0) instance_create(x + 50, y + 4, 335/* obj_vulkincloud */)
	$Alarm0.start((15) / 30.0)

func _on_outside_room():
	siner++
	if(pause == 1) {
	    siner= 0
	    face= 388
	    x= parent.x
	}
	if(pause == 2) siner= 0
	draw_sprite_ext(385/* spr_vulkinfeetback */, 0, x + 2 + cos(siner / 6) * 2, y + 102 + sin(siner / 6) * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(386/* spr_vulkinlava */, siner / 8, x + 42, y + 10, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(face, siner / 15, x + 26 + 18 + sin(siner / 12) * 7, y + 50, 2 - abs(sin(siner / 12)) * 0.2, 2, 0, 16777215, 1)
	draw_sprite_ext(384/* spr_vulkinfeetfront */, 0, x + 2 + sin(siner / 6) * 2, y + 102 + cos(siner / 6) * 2, 2, 2, 0, 16777215, 1)

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
