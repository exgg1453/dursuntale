# Auto-converted from GameMaker: obj_ct_fallobj
extends Node2D

func _ready():
	x= random(get_viewport_rect().size.x)
	gravity= 0.02
	velocity.y= 1
	modulate.a= 0.5
	rotspeed= choose(1, -1) * (2 + random(4))
	velocity.x= choose(1, -1) * (1 + random(1))
	siner= 0
	sinerfactor= choose(1, -1) * random(1)

func _process(delta: float):
	if(y > 250) instance_destroy()
	siner++
	x+= sin(siner / 5) * sinerfactor
	y+= cos(siner / 6) * sinerfactor
	rotation_degrees+= rotspeed

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
