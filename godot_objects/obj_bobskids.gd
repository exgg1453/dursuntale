# Auto-converted from GameMaker: obj_bobskids
extends Node2D

func _ready():
	siner= 0
	siner2= 0
	siner3= 0
	siner4= 0
	parent= 0
	outer= 0
	outersin= 0
	scale.x= 2
	scale.y= 2

func _process(delta: float):
	x= parent.x + sin(siner / 4) * (60 + outer)
	y= parent.y + cos(siner / 4) * (60 + outer)
	siner4++
	siner+= (sin(siner4 / 12) + 1.5) / 5
	outersin++
	outer= sin(outersin / 12) * 20
	gg= collision_rectangle(x - sprite_width / 2 + 2, y + 4, x + sprite_width / 2 - 2, y - 4, 739, 0, 1)
	if(gg != -4) {
	    with(gg) instance_destroy()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	// other
	with(-2) instance_destroy()
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
