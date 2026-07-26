# Auto-converted from GameMaker: obj_textdrawtest
extends Node2D

func _ready():
	active= 0
	$Alarm0.start((12) / 30.0)

func _on_destroy():
	active= 1

func _on_outside_room():
	if(active == 1) {
	    draw_set_color(16777215)
	    draw_set_alpha(1)
	    draw_set_font(2)
	    draw_text(x, y, obj_songwriter.newstring)
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
