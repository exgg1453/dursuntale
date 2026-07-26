# Auto-converted from GameMaker: obj_fx_waver
extends Node2D

func _ready():
	sprite_index= 836/* spr_st */
	a= 0
	b= 38.25
	c= 7
	d= 6
	e= 200
	script= 0
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	sprite_index= 836/* spr_st */

func _gm_event_7_0():
	if(script == 0) script_execute(28/* scr_fx_waver */, b, c, d, e)

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
