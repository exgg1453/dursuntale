# Auto-converted from GameMaker: blt_crybullet2
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	gravity= 0.5
	gravity_direction= 90
	velocity.x= random(6) - 2
	velocity.y= 2
	friction= 0.2
	scale.x= random(0.4) + 0.8
	scale.y= scale.x
	dmg= 0
	disappear= 0
	outside= 0

func _process(delta: float):
	rotation_degrees= direction + 90
	if(disappear == 1) {
	    modulate.a-= 0.08
	    if(modulate.a < 0.1) instance_destroy()
	}

func _on_alarm_0_timeout():
	disappear= 1

func _gm_event_7_0():
	outside++
	if(outside > 450) instance_destroy()

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
