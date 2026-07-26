# Auto-converted from GameMaker: obj_spritecheck
extends Node2D

func _ready():
	GS.awfultest= 0
	ricardo= 0
	gg= 0

func _on_outside_room():
	GS.awfultest++
	if(sprite_exists(GS.awfultest)) {
	    ir= 0
	    while(ir < 40) {
	        draw_sprite_ext(floor(GS.awfultest), ir, ir * 2 + 1, ir * 2 + 1, 2, 2, 0, 16777215, 1)
	        ir++
	    }
	} else  ricardo= GS.awfultest
	draw_set_font(1)
	draw_set_color(16754964)
	draw_text(100, 400, ricardo)
	draw_sprite(305/* spr_undynex_face_damage */, 0, 200, 200)

func _gm_event_9_32():
	room_goto_next()

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
