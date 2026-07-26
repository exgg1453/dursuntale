# Auto-converted from GameMaker: obj_hotland_bottomedge
extends Node2D

func _ready():
	siner= 0

func _on_outside_room():
	siner++
	if(scale.x >= 0) {
	    i= 0
	    while(i < scale.x) {
	        if(i == 0) draw_sprite(908/* spr_hotland_leftedge */, siner / 2, x, y)
	        else  {
	            if(i == scale.x - 1)
	                draw_sprite(911/* spr_hotland_rightedge */, siner / 2, x + i * 20, y)
	            else  draw_sprite(907/* spr_hotland_bottomedge */, siner / 2, x + i * 20, y)
	        }
	        i++
	    }
	    draw_set_color(0)
	    if(room == 171)
	        draw_sprite_ext(906/* spr_singleblackpixel */, 0, x, y + 19, 20 * scale.x, 1, 0, 16777215, 1)
	} else  {
	    draw_sprite(911/* spr_hotland_rightedge */, siner / 2, x - 20, y)
	    i= 1
	    while(i < -scale.x) {
	        draw_sprite(907/* spr_hotland_bottomedge */, siner / 2, x - i * 20 - 20, y)
	        i++
	    }
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
