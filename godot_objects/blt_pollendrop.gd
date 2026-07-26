# Auto-converted from GameMaker: blt_pollendrop
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	velocity.x= 1.5
	gravity= 0.02
	gravity_direction= 270
	$Alarm0.start((10) / 30.0)
	velocity.y= 1.2
	script_execute(122/* scr_edge */, 20, 6)

func _on_destroy():
	velocity.x= -velocity.x
	$Alarm0.start((20) / 30.0)

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
