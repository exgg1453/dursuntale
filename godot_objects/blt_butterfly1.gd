# Auto-converted from GameMaker: blt_butterfly1
# GM parent: blt_parent
extends Node2D

func _ready():
	angle= 0
	angleadd= 0
	speed= 2
	dmg= 0
	image_speed= 0.25
	visible= 0
	$Alarm9.start((1) / 30.0)

func _gm_event_2_9():
	visible= 1

func _process(delta: float):
	rotation_degrees= angle
	direction= angle
	angle+= 3
	if(GS.turntimer <= 4) {
	    if(GS.mnfight == 2) GS.mnfight= 3
	    instance_destroy()
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
