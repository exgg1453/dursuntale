# Auto-converted from GameMaker: obj_orbsprinkle
extends Node2D

func _ready():
	sprink= 0
	alpha= 1
	velocity.y= -1
	gravity= -0.2
	sprank= 0

func _process(delta: float):
	sprank++
	if(sprank > 14) alpha-= 0.08
	if(sprink == 0) {
	    modulate.a= alpha * 0.8
	    sprink= 1
	} else  {
	    modulate.a= alpha
	    sprink= 0
	}
	if(alpha < 0.05) instance_destroy()

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
