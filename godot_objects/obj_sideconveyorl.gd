# Auto-converted from GameMaker: obj_sideconveyorl
# GM parent: obj_conveyor_parent
extends Node2D

func _ready():
	scale.x= 29
	sprite_index= 1831/* spr_conveyorbelt_r_blue */
	image_speed= -1
	i= 0
	j= 0

func _on_alarm_0_timeout():
	if(GS.interact == 0) obj_mainchara.x-= 3

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
