# Auto-converted from GameMaker: obj_adate_body
extends Node2D

func _ready():
	anim= 0
	aa= 0
	item= 0
	GS.faceemotion= 0
	GS.flag[20]= 0
	shake= 0
	$Alarm3.start((1) / 30.0)
	set= 0
	pause= 0

func _gm_event_2_3():
	$Alarm3.start((8) / 30.0)
	if(shake > 0) instance_create(x, y - 120, 317/* obj_sweat99 */)

func _on_outside_room():
	shaker= random(shake) - random(shake)
	draw_sprite_ext(805/* spr_adate_body */, 0, x + shaker, y, 2, 2, 0, 16777215, modulate.a)
	if(set == 0)
	    draw_sprite_ext(803/* spr_adate_head */, GS.faceemotion, x + shaker, y, 2, 2, 0, 16777215, modulate.a)
	if(set == 1)
	    draw_sprite_ext(804/* spr_adate_head_2 */, GS.faceemotion, x + shaker, y, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(806/* spr_adate_arm */, GS.flag[20], x - 8 + shaker, y, 2, 2, 0, 16777215, modulate.a)
	if(item == 1)
	    draw_sprite_ext(802/* spr_adate_item */, aa, x, y + 68, 2, 2, 0, 16777215, modulate.a)
	$Alarm3.start((10) / 30.0)

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
