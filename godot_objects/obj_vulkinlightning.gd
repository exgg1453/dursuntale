# Auto-converted from GameMaker: obj_vulkinlightning
# GM parent: blt_parent
extends Node2D

func _ready():
	direction= 0
	$Alarm0.start((1) / 30.0)
	speed= 1
	friction= -0.15
	if(GS.firingrate > 9) friction= -0.1
	if(GS.firingrate > 12) friction= -0.07
	dmg= 7

func _on_destroy():
	rotation_degrees= direction

func _on_alarm_0_timeout():
	if(GS.sp < 8) GS.sp+= 2
	scr_damagestandard_x()
	instance_destroy()

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
