# Auto-converted from GameMaker: obj_sweat99
extends Node2D

func _ready():
	modulate.a= 0
	direction= random(180)
	speed= 4
	gravity= 0
	on= 0
	gravity_direction= 270
	$Alarm0.start((3) / 30.0)

func _gm_event_2_1():
	on= 3

func _on_destroy():
	on= 1

func _process(delta: float):
	if(on == 1) {
	    if(modulate.a < 1) modulate.a+= 0.1
	    else  on= 2
	    gravity= 0.1
	    $Alarm1.start((20) / 30.0)
	}
	if(on == 3) {
	    if(modulate.a > 0) modulate.a-= 0.04
	    if(modulate.a < 0.1) instance_destroy()
	}
	rotation_degrees= direction

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
