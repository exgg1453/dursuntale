# Auto-converted from GameMaker: obj_megaflybullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0.2
	move_towards_point(obj_heart.x - 2, obj_heart.y - 2, 3)
	$Alarm0.start((8) / 30.0)
	$Alarm1.start((24) / 30.0)
	siner= 0
	$Alarm2.start((80) / 30.0)
	sineron= 1

func _gm_event_2_2():
	instance_destroy()

func _gm_event_2_1():
	move_towards_point(obj_heart.x - 4, obj_heart.y - 4, 5)
	$Alarm1.start((90) / 30.0)
	sineron= 0

func _on_destroy():
	speed= 0

func _process(delta: float):
	if(sineron == 1) {
	    siner++
	    x+= sin(siner / 4)
	    y+= cos(siner / 2) / 2
	}

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)

func _on_outside_room():
	draw_self_border()

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
