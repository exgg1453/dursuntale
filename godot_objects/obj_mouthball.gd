# Auto-converted from GameMaker: obj_mouthball
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	siner= 0
	xprev3= x
	yprev3= y
	xprev2= x
	yprev2= y
	xprev4= xprev3
	yprev4= yprev3
	num= 5
	size= 0.8
	$Alarm0.start((1) / 30.0)
	$Alarm1.start((6) / 30.0)
	bounces= 0
	pb= 0
	maxer= 0
	visible= 0
	scale.x= maxer + sin(siner / 6) * 0.1
	scale.y= maxer + sin(siner / 6) * 0.1
	dt= instance_create(x, y, 1658/* obj_dentata_full */)
	instance_create(x, y, 1633/* obj_eyewarning */)
	// obj_flowey_master
	with(1585) caster_play(sfx_generate, 1, 1)
	image_blend= merge_color(32768, 16777215, 0.3)

func _gm_event_1_0():
	with(dt) instance_destroy()

func _gm_event_2_1():
	velocity.x= 13 * choose(1, -1)
	velocity.y= 13 * choose(-1)

func _on_destroy():
	mb= instance_create(x, y, 1632/* obj_mouthball_s */)
	mb.num= num - 1
	mb.parent= id
	mb.size= size - 0.05
	if(mb.num > 0) mb.$Alarm0.start((1) / 30.0)
	visible= 1

func _process_end(delta: float):
	dt.x= x
	dt.y= y

func _process(delta: float):
	if(maxer < 1.1) maxer+= 0.1
	scale.x= maxer + sin(siner / 6) * 0.1
	scale.y= maxer + sin(siner / 6) * 0.1
	xprev4= xprev3
	yprev4= yprev3
	xprev3= xprev2
	yprev3= yprev2
	xprev2= xprevious
	yprev2= yprevious
	siner++
	pb= bounces
	if(bounces < 7 and x > get_viewport_rect().size.x - 20 and velocity.x > 0) {
	    velocity.x= -velocity.x
	    bounces++
	}
	if(bounces < 7 and x < 20 and velocity.x < 0) {
	    velocity.x= -velocity.x
	    bounces++
	}
	if(bounces < 7 and velocity.y > 0 and y > get_viewport_rect().size.y - 20) {
	    velocity.y= -velocity.y
	    bounces++
	}
	if(bounces < 7 and velocity.y < 0 and y < 20) {
	    bounces++
	    velocity.y= -velocity.y
	}
	if(bounces > pb and not instance_exists(1582/* obj_vsflowey_shaker */)) {
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    snd_play(21/* snd_impact */)
	}
	if(x > get_viewport_rect().size.x + 300) event_user(7)
	if(x < -300) event_user(7)

func _gm_event_7_18():
	with(dt) instance_destroy()
	instance_destroy()

func _gm_event_7_17():
	with(mb) event_user(7)
	mb.num= num - 1
	event_user(8)

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
