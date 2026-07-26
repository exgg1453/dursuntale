# Auto-converted from GameMaker: obj_vertcroissant
# GM parent: obj_spiderbullet
extends Node2D

func _ready():
	velocity.x= 0
	speedfactor= 6
	choice= 1
	if(instance_exists(363/* obj_purpleheart */)) {
	    xfactor= floor(random(obj_purpleheart.xlen * 2) / 8) * 8
	    x= obj_purpleheart.xmid - obj_purpleheart.xlen + xfactor
	}
	$Alarm0.start((1) / 30.0)
	visible= 0

func _on_destroy():
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    y= op.yzero + (op.yamt + 1) * op.yspace
	    velocity.y= -speedfactor
	} else  instance_destroy()
	visible= 1

func _process(delta: float):
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(velocity.y > 0 and y > 400) instance_destroy()
	    rotation_degrees+= 8
	    velocity.y+= 0.3
	} else  instance_destroy()

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
