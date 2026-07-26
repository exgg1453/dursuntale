# Auto-converted from GameMaker: obj_iceconveyorbelt
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	stage= 0
	icex= 0
	image_speed= 0.334
	if(scr_murderlv() >= 7) $Alarm0.start((-1) / 30.0)
	if(GS.flag[7] == 1) $Alarm0.start((-1) / 30.0)

func _on_destroy():
	$Alarm0.start((160) / 30.0)
	stage= 1
	icex= -45

func _on_outside_room():
	draw_sprite(1304/* spr_silo2 */, 0, obj_silo1.x + 58, obj_silo1.y + 68)
	draw_sprite(sprite_index, frame, x, y)
	if(stage == 1) {
	    draw_sprite(1307/* spr_iceblock */, 0, x + icex, y - 30)
	    icex+= 0.5
	}

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
