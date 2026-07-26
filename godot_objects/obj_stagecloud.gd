# Auto-converted from GameMaker: obj_stagecloud
extends Node2D

func _ready():
	friction= 0.1
	velocity.x= 2 + random(2)
	scale.x= 2
	scale.y= 2
	modulate.a= 0.1
	timer= 0

func _process(delta: float):
	modulate.a+= 0.03
	timer++
	if(timer > 30) {
	    modulate.a-= 0.07
	    if(modulate.a < 0.1) instance_destroy()
	}

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
