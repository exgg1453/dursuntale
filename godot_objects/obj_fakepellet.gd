# Auto-converted from GameMaker: obj_fakepellet
extends Node2D

func _ready():
	image_speed= 0.5
	attackyou= 0

func _on_destroy():
	action_move("000010000", 0)

func _process(delta: float):
	if(attackyou == 1) {
	    move_towards_point(obj_fakeheart.xstart, obj_fakeheart.ystart, 0.1)
	    z_index= -500
	    attackyou= 2
	    friction= -0.004
	}

func _on_alarm_0_timeout():
	obj_floweybattle1.$Alarm9.start((2) / 30.0)
	obj_fakepellet.x= -800

func _gm_event_7_0():
	queue_free()

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
