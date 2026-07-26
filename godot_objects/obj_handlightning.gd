# Auto-converted from GameMaker: obj_handlightning
extends Node2D

func _ready():
	visible= 0
	$Alarm0.start((1) / 30.0)
	type= 0
	modulate.a= 0
	timer= 0
	siner= random(360)
	direction= random(360)
	speed= 3 + random(1)
	friction= 0.1

func _on_destroy():
	if(type == 0) {
	    sprite_index= 2363/* spr_regstar */
	    scale.x= 0.1
	    scale.y= 0.1
	    rotation_degrees= random(360)
	}
	if(type == 1) {
	    sprite_index= 2375/* spr_handlightning */
	    scale.x= 0.1
	    scale.y= 1
	    rotation_degrees= direction
	}
	visible= 1
	modulate.a= 0

func _process(delta: float):
	modulate.a+= 0.3
	timer++
	siner++
	if(timer > 5) {
	    modulate.a-= 0.5
	    if(modulate.a < 0) instance_destroy()
	}
	image_blend= make_color_hsv(siner * 8, 150, 255)
	if(type == 0) {
	    rotation_degrees+= 12
	    scale.x+= 0.1
	    scale.y+= 0.1
	}
	if(type == 1) scale.x+= 0.1

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
