# Auto-converted from GameMaker: obj_jarfly
extends Node2D

func _ready():
	siner= 0
	velocity.x= 1 - random(2)
	velocity.y= 1 - random(2)
	modulate.a= 0
	siner= random(12)
	scale.x= 2
	scale.y= 2

func _process(delta: float):
	x+= sin(siner / 4) / 2
	y+= cos(siner / 4) / 2
	siner++
	if(instance_exists(305/* obj_flyjar */)) {
	    modulate.a= obj_flyjar.modulate.a
	    if(x > obj_flyjar.bbox_right) {
	        x-= 4
	        if(velocity.x > 0) velocity.x= -velocity.x
	    }
	    if(x < obj_flyjar.bbox_left) {
	        x+= 4
	        if(velocity.x < 0) velocity.x= -velocity.x
	    }
	    if(y < obj_flyjar.bbox_top) {
	        y+= 4
	        if(velocity.y < 0) velocity.y= -velocity.y
	    }
	    if(y > obj_flyjar.bbox_bottom) {
	        y-= 4
	        if(velocity.y > 0) velocity.y= -velocity.y
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
