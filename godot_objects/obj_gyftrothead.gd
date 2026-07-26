# Auto-converted from GameMaker: obj_gyftrothead
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	$Alarm2.start((random(60) + 40) / 30.0)
	scale.x= 2
	scale.y= 2
	$Alarm1.start((45) / 30.0)
	instance_create(x + 50, y + 96, 238/* obj_gyftrotmouth */)
	image_speed= 0

func _gm_event_1_0():
	if(instance_exists(238/* obj_gyftrotmouth */)) {
	    // obj_gyftrotmouth
	    with(238) instance_destroy()
	}

func _gm_event_2_4():
	velocity.x= 0
	$Alarm1.start((40 + random(20)) / 30.0)
	if(instance_exists(238/* obj_gyftrotmouth */))
	    obj_gyftrotmouth.velocity.x= velocity.x

func _gm_event_2_3():
	frame= 0
	$Alarm2.start((60 + random(60)) / 30.0)

func _gm_event_2_2():
	frame= 1
	$Alarm3.start((8) / 30.0)

func _gm_event_2_1():
	if(x > xstart + 8) velocity.x= -1
	else  velocity.x= 1
	if(instance_exists(238/* obj_gyftrotmouth */))
	    obj_gyftrotmouth.velocity.x= velocity.x
	$Alarm4.start((8 + random(10)) / 30.0)

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
