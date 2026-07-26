# Auto-converted from GameMaker: obj_battleblcon
extends Node2D

func _ready():
	z_index= obj_mainchara.z_index
	snd_play(29/* snd_b */)
	$Alarm0.start((15 + random(5)) / 30.0)
	GS.interact= 3
	if(scr_murderlv() >= 8 and GS.flag[27] == 0) sprite_index= 1053/* spr_exc_f */
	action_move_to(obj_mainchara.x, obj_mainchara.y - 11)

func _on_destroy():
	GS.flag[10]= 0
	GS.flag[11]= 0
	GS.flag[12]= 0
	GS.flag[13]= 0
	GS.entrance= 0
	obj_mainchara.z_index= -600
	battle= 1
	if(room == 220) battle= 2
	if(room == 221) battle= 2
	if(room == 222) battle= 2
	if(room == 225) battle= 2
	if(battle == 1 and not instance_exists(142/* obj_battler */))
	    instance_create(0, 0, 142/* obj_battler */)
	if(battle == 2 and not instance_exists(145/* obj_battlerstory */))
	    instance_create(0, 0, 145/* obj_battlerstory */)
	instance_destroy()

func _process_end(delta: float):
	action_move_to(obj_mainchara.x, obj_mainchara.y - 11)

func _gm_event_7_12():
	GS.interact= 0
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
