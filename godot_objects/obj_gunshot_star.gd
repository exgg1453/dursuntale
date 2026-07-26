# Auto-converted from GameMaker: obj_gunshot_star
extends Node2D

func _ready():
	siner= 0
	size= 0.5
	sineramt= 0
	sinerspeed= 16
	sinergrav= -2
	ang= 20
	form= 0
	image_speed= 0.5

func _process(delta: float):
	siner+= 15
	sineramt+= sinerspeed
	sinerspeed+= sinergrav
	rotation_degrees+= ang
	asiner= degtorad(siner)
	x= xstart + sin(asiner) * sineramt
	y= ystart + cos(asiner) * sineramt
	size= 1 + sinerspeed / 20
	if(size < 0.2) size= 0
	if(sinerspeed < 0) modulate.a-= 0.07
	scale.x= size
	scale.y= size
	if(sineramt <= 0.5) instance_destroy()

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
