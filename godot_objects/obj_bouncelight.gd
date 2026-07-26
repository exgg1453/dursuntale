# Auto-converted from GameMaker: obj_bouncelight
extends Node2D

func _ready():
	friction= 0.2
	gravity= 0.5
	gravity_direction= 270
	$Alarm0.start((1) / 30.0)
	initvelocity.x= 0

func _on_destroy():
	initvelocity.x= velocity.x

func _process(delta: float):
	rotation_degrees+= (velocity.x * 5 + initvelocity.x) / 2
	if(y > 400) instance_destroy()

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
