# Auto-converted from GameMaker: obj_eyeshot_a
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	rotation_degrees= 0
	size= 0.1
	scale.x= size
	scale.y= size
	saved= 0
	active= 1
	memorymode= 0

func _process(delta: float):
	rotation_degrees+= 10
	if(size < 1) size+= 0.1
	scale.x= size
	scale.y= size

func _on_alarm_0_timeout():
	if(active == 1 and modulate.a > 0.3) event_inherited()

func _gm_event_7_15():
	if(saved == 0) instance_destroy()
	else  {
	    rotation_degrees= saved_angle
	    x= saved_x
	    y= saved_y
	    active= saved_active
	    speed= saved_speed
	    direction= saved_direction
	    size= saved_size
	    scale.x= saved_xscale
	    scale.y= saved_yscale
	    visible= saved_visible
	    if(saved_active == 0) instance_destroy()
	}

func _gm_event_7_14():
	saved_angle= rotation_degrees
	saved_x= x
	saved_y= y
	saved_active= active
	saved_speed= speed
	saved_direction= direction
	saved_size= size
	saved_xscale= scale.x
	saved_yscale= scale.y
	saved_visible= visible
	saved= 1
	if(saved_active == 0) instance_destroy()

func _gm_event_7_0():
	if(memorymode == 0) instance_destroy()
	if(memorymode == 1) {
	    active= 0
	    visible= 0
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
