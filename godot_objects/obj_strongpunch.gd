# Auto-converted from GameMaker: obj_strongpunch
extends Node2D

func _ready():
	image_speed= 0.5
	snd_play(46/* snd_punchstrong */)
	scr_shake(3, 3, 2)
	if(GS.weapon == 25) sprite_index= 762/* spr_hyperfoot */
	crit= 0

func _process(delta: float):
	x-= 2
	y-= 2
	x+= random(4)
	y+= random(4)

func _gm_event_7_15():
	crit= 1
	image_blend= merge_color(65535, 16777215, 0.5)
	snd_play(117/* snd_saber3 */)

func _gm_event_7_7():
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
