# Auto-converted from GameMaker: obj_insanesq
extends Node2D

func _ready():
	targetx= x + 10
	targety= y
	h= 80
	w= 70
	no= 12

func _on_outside_room():
	repeat(no)  {
	    draw_set_color(16777215)
	    draw_rectangle(targetx + random(w), targety + random(h), targetx + random(w), targety + random(h), 0)
	    draw_set_color(0)
	    draw_rectangle(targetx + random(w), targety + random(h), targetx + random(w), targety + random(h), 0)
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
