# Auto-converted from GameMaker: obj_spearafterimage2
extends Node2D

func _ready():
	color= 255
	alpha= 0.4
	angle= 0

func _on_outside_room():
	alpha-= 0.05
	if(alpha < 0.13) instance_destroy()
	rotation_degrees= angle
	image_blend= color
	scale.x= 2
	scale.y= 2
	modulate.a= alpha
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, angle, color, alpha)

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
