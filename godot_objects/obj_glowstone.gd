# Auto-converted from GameMaker: obj_glowstone
extends Node2D

func _ready():
	rr= 0
	modulate.a= 0.1
	siner= 0
	gl= 0

func _on_outside_room():
	if(instance_exists(1098/* obj_darknesspuzzle */))
	    gl= obj_darknesspuzzle.glowamt
	else  gl= 0
	draw_set_circle_precision(12)
	if(gl > 0.1) {
	    gl2= gl + sin(siner / 10) / 6
	    modulate.a= obj_darknesspuzzle.glowamt
	    draw_set_color(16711935)
	    draw_set_alpha(gl2 / 3)
	    draw_circle(x + 10, y + 10, gl2 * 15, 0)
	    draw_set_alpha(gl2 / 3)
	    draw_circle(x + 10, y + 10, gl2 * 20, 0)
	    draw_set_alpha(gl2 / 3)
	    draw_circle(x + 10, y + 10, gl2 * 25, 0)
	    draw_set_alpha(gl2 / 3)
	    draw_circle(x + 10, y + 10, gl2 * 30, 0)
	}
	siner++
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, gl)
	draw_set_alpha(1)

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
