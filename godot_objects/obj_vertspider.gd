# Auto-converted from GameMaker: obj_vertspider
# GM parent: obj_spiderbulletparent
extends Node2D

func _ready():
	op= 363
	y= op.yzero - op.yspace * 2 + op.yoff
	fakey= y
	xfactor= floor(random(op.xlen / 10)) * 22
	x= op.xmid - op.xlen + xfactor
	off= 1
	fakeyamt= 0
	fakeyoff= 0
	move= 1
	$Alarm0.start((2) / 30.0)

func _on_destroy():
	if(move == 1) {
	    velocity.x= choose(-1, 1)
	    if(obj_spiderb.turnamt == 10) velocity.x= choose(-1.5, 1.5)
	    if(obj_spiderb.turnamt == 16) velocity.x= choose(-1.5, 1.5)
	}

func _process(delta: float):
	fakeyoff+= op.yadd
	if(fakeyoff > op.yspace) {
	    fakeyoff= 0
	    fakeyamt++
	}
	y= fakey + fakeyoff + fakeyamt * op.yspace
	if(y > 400) instance_destroy()
	if(velocity.x > 0 and x > obj_rborder.x - 6) {
	    x-= velocity.x
	    velocity.x= -velocity.x
	}
	if(velocity.x < 0 and x < obj_lborder.x + 6) {
	    x-= velocity.x
	    velocity.x= -velocity.x
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
