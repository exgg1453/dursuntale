# Auto-converted from GameMaker: obj_donutbullet
# GM parent: obj_spiderbullet
extends Node2D

func _on_destroy():
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(op.type == 0)
	        y= op.yzero + (choice - 1) * op.yspace
	    if(side == 0) {
	        x= op.xmid - op.xlen * 2
	        velocity.x= speedfactor
	    }
	    if(side == 1) {
	        x= op.xmid + op.xlen * 2
	        velocity.x= -speedfactor
	    }
	    if(choice == 1) velocity.y= abs(velocity.x) / 2
	    if(choice == 3) velocity.y= -abs(velocity.x) / 2
	} else  instance_destroy()
	visible= 1

func _process(delta: float):
	if(instance_exists(363/* obj_purpleheart */)) {
	    op= 363
	    if(velocity.x > 0 and x > op.xmid + op.xlen * 2)
	        instance_destroy()
	    if(velocity.x < 0 and x < op.xmid - op.xlen * 2)
	        instance_destroy()
	    if(scale.y < 1) scale.y+= 0.1
	    if(velocity.y > 0 and y > op.yzero + (op.yamt - 1) * op.yspace + 10) {
	        y-= velocity.y
	        velocity.y= -velocity.y
	        scale.y= 0.6
	    }
	    if(velocity.y < 0 and y < op.yzero - 10) {
	        y-= velocity.y
	        velocity.y= -velocity.y
	        scale.y= 0.6
	    }
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
