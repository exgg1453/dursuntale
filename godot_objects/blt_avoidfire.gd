# Auto-converted from GameMaker: blt_avoidfire
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	image_speed= 0.2
	velocity.y= 0
	gravity= 0.1 + random(0.2)
	gravity_direction= 250 + random(40)
	visible= 0

func _process_end(delta: float):
	if(distance_to_point(x, obj_heart.y) < 100)
	    velocity.x= 180 / (distance_to_point(obj_heart.x, y) + 10) - 1
	if(obj_heart.x > x) velocity.x= -velocity.x
	if(GS.turntimer < 1) instance_destroy()
	if(x < GS.idealborder[0]) instance_destroy()
	if(x > GS.idealborder[1]) instance_destroy()
	if(y > GS.idealborder[2]) visible= 1
	if(y > GS.idealborder[3]) instance_destroy()

func _gm_event_7_0():
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
