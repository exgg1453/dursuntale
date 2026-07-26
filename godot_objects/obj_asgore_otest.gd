# Auto-converted from GameMaker: obj_asgore_otest
extends Node2D

func _ready():
	image_speed= 0.2
	s= 0
	$Alarm0.start((60) / 30.0)

func _on_destroy():
	s++
	if(s == 1) sprite_index= 1900/* spr_asgore_l */
	if(s == 2) sprite_index= 1907/* spr_asgore_u */
	if(s == 3) sprite_index= 1904/* spr_asgore_d */
	if(s > 3) {
	    s= 0
	    sprite_index= 1901/* spr_asgore_r */
	}
	$Alarm0.start((60) / 30.0)

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
