# Auto-converted from GameMaker: obj_floweyx_flamethrower
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	y= 160
	scale.x= 0.05
	velocity.y= 5
	snd_play(121/* snd_elecdoor_open */)
	rotation_degrees= point_direction(x, y, obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8)
	on= 0
	if(rotation_degrees > 312) rotation_degrees= 312
	if(rotation_degrees < 240) rotation_degrees= 240
	extend= 0
	image_speed= 0
	$Alarm1.start((8) / 30.0)
	rotation_degrees= 270
	num= 0
	anchor= 0
	xanchor= 0
	yanchor= 0
	side= 0
	if(x > 440) side= 1
	con= 0
	done= 0

func _gm_event_2_1():
	extend= 1

func _on_destroy():
	if(num < 7) {
	    if(side == 0 and on == 0) rotation_degrees+= 8
	    if(side == 1 and on == 0) rotation_degrees-= 8
	    if(side == 0 and on == 1) rotation_degrees-= 8
	    if(side == 1 and on == 1) rotation_degrees+= 8
	    xx= lengthdir_x(165, rotation_degrees)
	    yy= lengthdir_y(165, rotation_degrees)
	    fl= instance_create(x + xx, y + yy, 1643/* obj_floweyx_flame */)
	    fl.direction= rotation_degrees
	    fl.speed= 7
	    $Alarm0.start((2) / 30.0)
	    num++
	} else  {
	    if(on == 0) on= 1
	    else  on= 0
	    $Alarm0.start((30) / 30.0)
	    num= 0
	}

func _process(delta: float):
	if(extend == 1 and frame < 8)
	    frame++
	if(extend == 2 and frame > 0)
	    frame--
	if(y > 190 and con == 0) {
	    con= 1
	    velocity.y= 0
	    yanchor= y
	    xanchor= x
	    anchor= 1
	}
	if(done == 0) {
	    if(scale.x < 1) scale.x+= 0.1
	    else  {
	        done= 1
	        con= 2
	        $Alarm0.start((1) / 30.0)
	        if(side == 1) $Alarm0.start((25) / 30.0)
	    }
	}
	if(con == 2) {
	    if(side == 0) {
	    }
	    if(side == 1) {
	    }
	}
	if(con == 3) {
	    if(extend != 2) snd_play(120/* snd_elecdoor_close */)
	    extend= 2
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
