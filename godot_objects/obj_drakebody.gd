# Auto-converted from GameMaker: obj_drakebody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.1
	scale.x= 2
	scale.y= 2

func _on_outside_room():
	if(instance_exists(254/* obj_drakehead */)) {
	    draw_sprite_ext(209/* spr_snowdrake_legs */, 0, x, y, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(208/* spr_snowdrake_body */, 0, x, y + (obj_drakehead.y - ystart) / 3, 2, 2, 0, 16777215, 1)
	} else  {
	    draw_sprite_ext(209/* spr_snowdrake_legs */, 0, x, y, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(208/* spr_snowdrake_body */, 0, x, y, 2, 2, 0, 16777215, 1)
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
