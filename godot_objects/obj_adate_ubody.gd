# Auto-converted from GameMaker: obj_adate_ubody
extends Node2D

func _ready():
	anim= 0
	set= 0

func _on_outside_room():
	anim+= 0.2
	draw_sprite_ext(807/* spr_adate_ubody */, floor(anim), x, y + 78, 2, 2, 0, 16777215, 1)
	if(set == 0)
	    draw_sprite_ext(808/* spr_adate_uface */, GS.facechoice, x, y, 2, 2, 0, 16777215, 1)
	if(set == 1)
	    draw_sprite_ext(809/* spr_adate_uface_2 */, GS.facechoice, x, y, 2, 2, 0, 16777215, 1)

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
