# Auto-converted from GameMaker: obj_glowparticle_1
extends Node2D

func _ready():
	velocity.y= -1 - random(1)
	friction= 0.02
	direction+= random(20) - 10
	ap= 0
	modulate.a= 0
	size= 0.2 + random(0.4)
	scale.x= size
	scale.y= size

func _process(delta: float):
	if(ap == 0) modulate.a+= 0.25
	if(modulate.a > 0.6) ap= 1
	direction+= random(6) - 3
	speed+= random(0.04) - 0.02
	modulate.a-= 0.01
	if(modulate.a < 0.02) instance_destroy()

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
