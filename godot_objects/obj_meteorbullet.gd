# Auto-converted from GameMaker: obj_meteorbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	velocity.x= 5
	velocity.y= 5
	direction-= 15 - random(30)
	instance_create(x + 5, y + 5, 373/* obj_meteorshine */)
	modulate.a= 0.1
	dmg= 8

func _process(delta: float):
	if(x > 650 or y > 490) instance_destroy()
	if(modulate.a < 1) modulate.a+= 0.2

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)
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
