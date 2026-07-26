# Auto-converted from GameMaker: obj_introfader
extends Node2D

func _ready():
	scale.x= get_viewport_rect().size.x
	scale.y= 70
	action_move_to(obj_introimage.x, obj_introimage.y)
	modulate.a= 0
	tspeed= 0.1
	over= 0

func _gm_event_2_3():
	modulate.a-= 0.1
	if(modulate.a <= 0.2) instance_destroy()
	$Alarm3.start((2) / 30.0)

func _gm_event_2_2():
	$Alarm3.start((2) / 30.0)
	obj_introimage.frame++

func _process(delta: float):
	if(modulate.a <= 0.9 and over == 0)
	    modulate.a+= tspeed
	if(modulate.a > 0.9 and over == 0) {
	    over= 1
	    $Alarm2.start((4) / 30.0)
	}

func _gm_event_7_5():
	queue_free()

func _gm_event_7_4():
	queue_free()

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
