# Auto-converted from GameMaker: blt_shinebullet
extends Node2D

func _ready():
	image_speed= 0.2
	dmg= 5
	scale= 1.5

func _process(delta: float):
	scale-= 0.03
	scale.x= scale
	scale.y= scale
	if(scale < 0.1) instance_destroy()
	if(GS.turntimer < 1) instance_destroy()

func _on_alarm_0_timeout():
	scr_damagestandard_x()
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
