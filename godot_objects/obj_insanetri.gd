# Auto-converted from GameMaker: obj_insanetri
extends Node2D

func _ready():
	targetx= 100
	targety= 100
	h= 100
	w= 100
	no= 16

func _on_outside_room():
	draw_set_color(16777215)
	repeat(no) 
	    draw_triangle(targetx + random(w), targety + random(h), targetx + random(w), targety + random(h), targetx + random(w), targety + random(h), 1)

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
