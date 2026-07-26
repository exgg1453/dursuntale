# Auto-converted from GameMaker: obj_zzz
extends Node2D

func _ready():
	image_speed= 0.1
	modulate.a= 0.2
	stage= 0
	friction= 0.01
	velocity.y= -1
	velocity.x= random(1) - 0.5

func _process(delta: float):
	stage++
	if(stage < 40 and modulate.a < 1)
	    modulate.a+= 0.05
	if(stage > 50) {
	    modulate.a-= 0.05
	    if(modulate.a <= 0) instance_destroy()
	}
	x+= sin(stage / 8) * 0.5
	if(frame >= 2) image_speed= 0

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
