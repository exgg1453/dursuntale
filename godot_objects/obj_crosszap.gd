# Auto-converted from GameMaker: obj_crosszap
# GM parent: blt_parent
extends Node2D

func _ready():
	direction= point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10)
	speed= 5
	friction= 0.1
	exist= 75
	rotation_degrees= direction - 90
	dmg= 8

func _process(delta: float):
	exist--
	if(exist < 10) modulate.a-= 0.1
	if(exist < 0) instance_destroy()

func _on_alarm_0_timeout():
	scr_damagestandard(0, 2, 0, 0, 0)
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
