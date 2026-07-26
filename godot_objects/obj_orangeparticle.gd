# Auto-converted from GameMaker: obj_orangeparticle
extends Node2D

func _ready():
	size= 0.4 + random(0.8)
	goalsize= 0.2 + random(1.4)
	modulate.a= 0.9
	gravity= -0.1 + random(0.1)
	velocity.x= 2 + random(-4)
	velocity.y= -1
	siner= random(360)
	rr= random(0.5) - 0.25
	vv= random(0.5) - 0.25
	gg= 2 + random(4)
	image_speed= 0.25
	frame= random(8)

func _process(delta: float):
	if(goalsize > size + 0.1) size+= 0.03
	if(goalsize < size - 0.1) size-= 0.03
	scale.x= size
	scale.y= size
	modulate.a-= 0.01
	if(modulate.a < 0.01) instance_destroy()
	siner++
	x+= sin(siner / gg) * rr
	y+= cos(siner / gg) * vv

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
