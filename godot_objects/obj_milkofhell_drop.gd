# Auto-converted from GameMaker: obj_milkofhell_drop
extends Node2D

func _ready():
	velocity.x= random(3) * choose(1, -1)
	velocity.y= 4
	gravity= 0.3 + random(0.4)
	friction= 0.2

func _process(delta: float):
	if(y > view_yview[0] + 250) instance_destroy()

func _on_alarm_0_timeout():
	event_user(1)

func _gm_event_7_11():
	velocity.y= 0

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
