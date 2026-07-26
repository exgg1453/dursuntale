# Auto-converted from GameMaker: obj_floweynuke
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	velocity.y= 8
	velocity.x= 0
	$Alarm1.start((24) / 30.0)
	move_snap(40, 1)
	image_speed= 0.2
	fader= 0

func _gm_event_2_2():
	velocity.y= 24
	caster_stop(140)
	caster_play(140, 0.8, 1 + random(0.1))

func _gm_event_2_1():
	velocity.y= 0
	$Alarm2.start((8) / 30.0)

func _process(delta: float):
	if(fader == 1) {
	    modulate.a-= 0.2
	    if(modulate.a < 0.4) instance_destroy()
	}

func _gm_event_7_0():
	if(y > 400 and fader == 0) {
	    instance_create(x - 75, get_viewport_rect().size.y - 150, 1634/* obj_floweynukesplosion */)
	    fader= 1
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
