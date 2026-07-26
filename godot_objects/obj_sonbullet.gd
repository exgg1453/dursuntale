# Auto-converted from GameMaker: obj_sonbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	modulate.a= 0
	off= 0
	dmg= 8

func _process(delta: float):
	if(modulate.a < 1 and off == 0)
	    modulate.a+= 0.1
	if(x < GS.idealborder[0] - 30) off= 1
	if(off == 1) modulate.a-= 0.05
	if(modulate.a < 0.1 and off == 1) instance_destroy()

func _on_alarm_0_timeout():
	if(modulate.a >= 1) scr_damagestandard(0, 3, 0, 0, 0)

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
