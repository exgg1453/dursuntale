# Auto-converted from GameMaker: obj_swordtwinkle
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	gravity= 0.05 + random(0.1)
	gravity_direction= 180 - random(40) + random(40)
	velocity.y= 1 + random(1) - random(2)
	if(x < get_viewport_rect().size.x / 2) gravity*= -1
	fade= 0
	$Alarm0.start((40) / 30.0)

func _on_destroy():
	fade= 1

func _process(delta: float):
	if(fade == 1) {
	    modulate.a-= 0.05
	    if(modulate.a < 0.05) instance_destroy()
	}

func _on_alarm_0_timeout():
	event_user(7)

func _gm_event_7_0():
	instance_destroy()

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
