# Auto-converted from GameMaker: obj_followspeargen_2
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	type= 1
	fade= 0
	if(type == 0) {
	    curang= 0
	    ang= 45
	    num= 4
	    rate= 20
	    rr= 150
	}
	if(type == 1) {
	    curang= 0
	    ang= 10
	    num= 6
	    rate= 20
	    rr= 180
	    fade= 1
	}
	if(type == 2) {
	    curang= 0
	    ang= 12
	    num= 1
	    rate= 2
	    rr= 140
	    siner= 0
	}
	if(type == 3) {
	    curang= 0
	    ang= 22.5
	    num= 8
	    rate= 20
	    rr= 150
	}

func _on_destroy():
	i= 0
	while(i < num) {
	    hx= obj_heart.x + 8 + lengthdir_x(rr, curang + i / num * 360)
	    hy= obj_heart.y + 8 + lengthdir_y(rr, curang + i / num * 360)
	    spear[i]= instance_create(hx, hy, 280/* obj_followspear_2 */)
	    spear[i].fade= fade
	    i++
	}
	if(type == 1 and rate > 10) rate--
	if(type == 0 or type == 3) curang+= ang
	if(type == 1) curang+= 10 + choose(10, 20, 30)
	$Alarm0.start((rate) / 30.0)
	if(type == 2) {
	    siner++
	    ang= sin(siner / 16) * 16
	    if(abs(ang) < 2) {
	        if(ang < 0) ang= -2
	        if(ang > 0) ang= 2
	    }
	    curang+= ang
	}

func _process(delta: float):
	if(GS.turntimer < 3) {
	    // obj_followspear_2
	    with(280) deactivate= 1
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
