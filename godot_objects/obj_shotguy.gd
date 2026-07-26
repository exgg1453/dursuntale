# Auto-converted from GameMaker: obj_shotguy
extends Node2D

func _ready():
	velocity.y= -2
	friction= -0.4
	snd_play(116/* snd_heartshot */)

func _process(delta: float):
	if(y < 0) instance_destroy()

func _on_alarm_0_timeout():
	// other
	with(-2) {
	    instance_create(x + 10, y + 10, 1241/* obj_blackbox_o_shatter */)
	    instance_destroy()
	}
	// obj_shootguy
	with(1244) event_user(4)
	instance_destroy()

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
