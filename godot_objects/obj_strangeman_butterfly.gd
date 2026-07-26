# Auto-converted from GameMaker: obj_strangeman_butterfly
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	king= 743
	if(instance_exists(538/* obj_strangeman_intro */)) king= 538
	if(instance_exists(535/* obj_butterflyhead */)) king= 535
	move_towards_point(king.x, king.y, 1)
	$Alarm0.start((10) / 30.0)
	image_speed= 0.2
	siner= 0
	dmg= 9

func _gm_event_2_6():
	$Alarm0.start((-1) / 30.0)
	speed= 6

func _on_destroy():
	if(is_instance_valid(king)) {
	    move_towards_point(king.x, king.y, 1 + random(2))
	    direction+= random(20) - random(20)
	    $Alarm0.start((15) / 30.0)
	} else  instance_destroy()

func _process(delta: float):
	rotation_degrees= direction
	x+= sin(siner / 2) * 2
	y+= cos(siner / 2) * 2
	siner+= random(2)

func _gm_event_7_0():
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
