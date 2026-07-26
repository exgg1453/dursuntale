# Auto-converted from GameMaker: obj_true_antiwaver
extends Node2D

func _ready():
	siner= 0

func _on_outside_room():
	siner++
	i= 0
	while(i < 8) {
	    draw_set_alpha((sin(siner / 12) * 0.5 + 0.5) * (1 - i / 8))
	    draw_set_color(0)
	    draw_rectangle(x, y + 16 - i * 5, x + 20 * scale.x, y + 20 - i * 5, 0)
	    draw_set_alpha(1)
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
