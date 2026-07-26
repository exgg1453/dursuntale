# Auto-converted from GameMaker: obj_floweyfly_burst
extends Node2D

func _ready():
	scale.x= 0.5
	scale.y= 0.5
	rotation_degrees= random(360)
	modulate.a= 1
	aa= random(6) - random(6)
	velocity.x= random(1) - random(1)
	velocity.y= random(1) - random(1)
	image_speed= 0
	frame= random(40)
	if(audio_is_playing(110)) snd_stop(110)
	snd_play(110/* snd_swallow */)

func _process(delta: float):
	scale.x+= 0.25
	scale.y+= 0.25
	rotation_degrees+= aa
	modulate.a-= 0.2
	if(modulate.a <= 0.1) instance_destroy()

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
