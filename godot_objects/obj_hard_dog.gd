# Auto-converted from GameMaker: obj_hard_dog
extends Node2D

func _ready():
	image_speed= 0
	scale.x= 2
	scale.y= 2

func _process(delta: float):
	if(GS.flag[20] == 1) sprite_index= 833/* spr_tobdogl_talk_eyeclose */
	if(GS.flag[20] == 2) sprite_index= 834/* spr_tobdogl_talk */

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
