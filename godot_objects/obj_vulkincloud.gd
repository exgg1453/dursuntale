# Auto-converted from GameMaker: obj_vulkincloud
extends Node2D

func _ready():
	size= 0.25
	rot= random(360)
	siner= 0
	velocity.y= -1
	gravity= 0.2
	gravity_direction= 90
	velocity.x= 2 - random(4)
	friction= 0.05
	siner= random(100)

func _on_outside_room():
	modulate.a-= 0.02
	if(modulate.a < 0.05) instance_destroy()
	rot+= 2
	size+= 0.07
	draw_sprite_ext(sprite_index, 9, x, y, size, size, rot, 16777215, modulate.a)
	siner++
	x+= sin(siner / 5) * 2

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
