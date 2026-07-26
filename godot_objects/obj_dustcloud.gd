# Auto-converted from GameMaker: obj_dustcloud
extends Node2D

func _ready():
	tim= random(1) + 0.7
	scale.x= tim
	scale.y= tim
	image_speed= 0.25
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	friction= 0.8
	direction= random(360)
	if(rightside < 0.75) direction= 180
	if(rightside > 1.25) direction= 0
	if(topside > 1.25 and rightside > 1.25) direction= 45
	if(topside > 1.25 and rightside > 0.75 and rightside < 1.25)
	    direction= 90
	if(topside > 1.25 and rightside < 0.75) direction= 135
	if(topside < 0.75 and rightside > 1.25) direction= 315
	if(topside < 0.75 and rightside > 0.75 and rightside < 1.25)
	    direction= 270
	if(topside < 0.75 and rightside < 0.75) direction= 235
	direction= -direction
	speed= 8

func _process(delta: float):
	modulate.a-= 0.03

func _gm_event_7_7():
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
