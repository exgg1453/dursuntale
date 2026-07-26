# Auto-converted from GameMaker: obj_frypan_impact
extends Node2D

func _ready():
	image_speed= 1
	ang= 6 * choose(1, -1)
	size= 2
	scale.x= 2
	scale.y= 2
	siner= 0
	form= 0
	crit= 0
	pansfx= caster_load("music/sfx_frypan.ogg")
	caster_play(pansfx, 1, 1)
	i= 0
	while(i < 8) {
	    g= instance_create(x, y, 730/* obj_frypan_star */)
	    g.direction= i * 360 / 8
	    g.image_blend= image_blend
	    i++
	}
	$Alarm6.start((70) / 30.0)
	$Alarm1.start((1) / 30.0)

func _gm_event_2_6():
	instance_destroy()

func _gm_event_2_1():
	// obj_frypan_star
	with(730) {
	    if(instance_exists(731/* obj_frypan_impact */))
	        image_blend= obj_frypan_impact.image_blend
	}
	if(crit == 1) snd_play(117/* snd_saber3 */)

func _process(delta: float):
	rotation_degrees+= ang
	if(form == 0) size+= 0.3
	if(size > 2.8) {
	    if(not instance_exists(184/* obj_shaker */)) instance_create(0, 0, 184/* obj_shaker */)
	    form= 1
	}
	if(form == 1) {
	    size-= 0.6
	    modulate.a-= 0.2
	}
	scale.x= size
	scale.y= size
	siner++

func _gm_event_7_15():
	image_blend= merge_color(16777215, 65535, 0.5)
	crit= 1

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
