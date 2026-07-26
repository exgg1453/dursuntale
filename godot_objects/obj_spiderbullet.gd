# Auto-converted from GameMaker: obj_spiderbullet
# GM parent: obj_spiderbulletparent
extends Node2D

func _ready():
	velocity.x= 0
	speedfactor= 6
	choice= 1
	if(instance_exists(363/* obj_purpleheart */))
	    choice= ceil(random(obj_purpleheart.yamt))
	side= choose(0, 1)
	$Alarm0.start((1) / 30.0)
	visible= 0
	dmg= 0

func _on_destroy():
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(op.type == 0)
	        y= op.yzero + (choice - 1) * op.yspace
	    if(side == 0) {
	        x= op.xmid - op.xlen * 2 - 40
	        velocity.x= speedfactor
	    }
	    if(side == 1) {
	        x= op.xmid + op.xlen * 2 + 40
	        velocity.x= -speedfactor
	    }
	} else  instance_destroy()
	visible= 1

func _process(delta: float):
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(velocity.x > 0 and x > op.xmid + op.xlen * 2)
	        instance_destroy()
	    if(velocity.x < 0 and x < op.xmid - op.xlen * 2)
	        instance_destroy()
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
