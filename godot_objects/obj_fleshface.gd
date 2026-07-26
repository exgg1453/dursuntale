# Auto-converted from GameMaker: obj_fleshface
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	frozen= 0
	desperate= 1
	scr_floweybodysave()

func _on_outside_room():
	if(frozen == 0) siner+= 1.2
	if(desperate == 0) {
	    siner-= 0.2
	    draw_sprite_ext(sprite_index, frame, x, y + sin(siner / 2) * 3, 1, 1, 0, image_blend, 1)
	    draw_sprite_ext(2157/* spr_nostrils */, siner / 8, x + 32, y + 12 + sin(siner / 2) * 6, 1, 1, 0, image_blend, 1)
	}
	if(desperate == 1) {
	    draw_sprite_ext(sprite_index, frame, x, y + sin(siner / 2) * 3, 1, 1, 0, image_blend, 1)
	    draw_sprite_ext(2157/* spr_nostrils */, siner / 8, x + 32, y + 14 + sin(siner / 2) * 7, 1, 1, 0, image_blend, 1)
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
