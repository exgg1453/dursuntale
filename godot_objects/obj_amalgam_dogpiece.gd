# Auto-converted from GameMaker: obj_amalgam_dogpiece
extends Node2D

func _ready():
	if(not instance_exists(1557/* obj_amalgam_dogevent */)) instance_destroy()
	else  {
	    image_speed= 0
	    aa= random(2) - random(2)
	    x= obj_amalgam_dogevent.x - random(400) + random(90)
	    y= obj_amalgam_dogevent.y - random(70) + random(40)
	    siner= random(40)
	    con= 0
	    ss= 12 + random(4)
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    siner++
	    y+= sin(siner / ss) / 3
	    rotation_degrees+= aa
	}
	if(con == 1) {
	    xx= x
	    yy= y
	    newx= obj_amalgam_dogevent.dx
	    newy= obj_amalgam_dogevent.dy
	    tox= (newx - x) / 10
	    toy= (newy - y) / 10
	    con= 2
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 2) {
	    x+= tox
	    y+= toy
	}
	if(con == 3) instance_destroy()

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
