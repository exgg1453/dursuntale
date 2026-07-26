# Auto-converted from GameMaker: obj_statuedrop
extends Node2D

func _ready():
	gravity= 0.4
	velocity.y= 2
	gravity_direction= 270

func _process(delta: float):
	if(instance_exists(1157/* obj_musicstatue */) and y > obj_musicstatue.y + 100)
	    instance_destroy()

func _on_alarm_0_timeout():
	repeat(2)  instance_create(x, y + 5, 1150/* obj_statueplink */)
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
