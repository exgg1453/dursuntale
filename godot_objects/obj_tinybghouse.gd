# Auto-converted from GameMaker: obj_tinybghouse
extends Node2D

func _ready():
	image_speed= 0
	man= 0
	$Alarm0.start((5) / 30.0)

func _gm_event_2_2():
	instance_create(x + 7, y + 12, 969/* obj_tinybgman */)

func _gm_event_2_1():
	frame= 1
	$Alarm2.start((30) / 30.0)

func _on_destroy():
	$Alarm0.start((30) / 30.0)
	instance_create(x + 13, y + 2, 971/* obj_tinybgpuff */)

func _process(delta: float):
	if(view_xview[0] < x and man == 0) {
	    $Alarm1.start((300 + random(90)) / 30.0)
	    man= 1
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
