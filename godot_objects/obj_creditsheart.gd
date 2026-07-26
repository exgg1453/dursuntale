# Auto-converted from GameMaker: obj_creditsheart
extends Node2D

func _ready():
	image_speed= 0

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(Input.is_action_pressed("move_right")) x+= 4
	if(Input.is_action_pressed("move_up")) y-= 4
	if(Input.is_action_pressed("move_down")) y+= 4
	if(Input.is_action_pressed("move_left")) x-= 4
	if(x > 624) x= 624
	if(x < 0) x= 0
	if(y > 464) y= 464
	if(y < 0) y= 0

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
