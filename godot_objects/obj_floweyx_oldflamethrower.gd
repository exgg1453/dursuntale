# Auto-converted from GameMaker: obj_floweyx_oldflamethrower
extends Node2D

func _ready():
	y= 160
	scale.x= 0.05
	velocity.y= 5
	rotation_degrees= point_direction(x, y, obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8)
	if(rotation_degrees > 312) rotation_degrees= 312
	if(rotation_degrees < 240) rotation_degrees= 240
	$Alarm0.start((50) / 30.0)
	num= 0
	anchor= 0
	xanchor= 0
	yanchor= 0
	side= 0
	if(x > 440) side= 1
	con= 0

func _on_destroy():
	if(num < 6) {
	    xx= lengthdir_x(165, rotation_degrees)
	    yy= lengthdir_y(165, rotation_degrees)
	    fl= instance_create(x + xx, y + yy, 1643/* obj_floweyx_flame */)
	    fl.direction= rotation_degrees
	    $Alarm0.start((3) / 30.0)
	    num++
	} else  {
	    $Alarm0.start((50) / 30.0)
	    num= 0
	}

func _process(delta: float):
	if(y > 190 and con == 0) {
	    con= 1
	    velocity.y= 0
	    yanchor= y
	    xanchor= x
	    anchor= 1
	}
	if(con == 1 and scale.x < 1)
	    scale.x+= 0.05
	rotation_degrees= point_direction(x, y, obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8)
	if(side == 0) {
	    if(rotation_degrees > 312) rotation_degrees= 312
	    if(rotation_degrees < 260) rotation_degrees= 260
	}
	if(side == 1) {
	    if(rotation_degrees < 225) rotation_degrees= 225
	    if(rotation_degrees > 280) rotation_degrees= 280
	}
	if(con == 3) {
	    velocity.y= -5
	    $Alarm0.start((-1) / 30.0)
	    if(scale.x > 0.1) scale.x-= 0.1
	    if(y <= 150) instance_destroy()
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
