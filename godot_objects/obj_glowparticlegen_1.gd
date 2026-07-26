# Auto-converted from GameMaker: obj_glowparticlegen_1
extends Node2D

func _ready():
	$Alarm0.start((random(12)) / 30.0)

func _on_destroy():
	if(x > view_xview[0] - 100 and x < view_xview[0] + view_wview[0] + 100 and y > view_yview[0] - 100 and y < view_yview[0] + view_hview[0] + 100)
	    instance_create(x + random(60) - 20, y - 15, 114/* obj_glowparticle_1 */)
	$Alarm0.start((10) / 30.0)

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
