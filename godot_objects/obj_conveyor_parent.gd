# Auto-converted from GameMaker: obj_conveyor_parent
extends Node2D

func _gm_event_2_9():
	thin= 1
	mask_index= 1065

func _on_outside_room():
	if(scale.y > 1) {
	    i= 0
	    while(i < scale.y) {
	        draw_sprite_ext(sprite_index, frame, x, y + i * 20, 1, 1, 0, 16777215, modulate.a)
	        if(scale.x > 1) {
	            j= 0
	            while(j < scale.x) {
	                draw_sprite_ext(sprite_index, frame, x + j * 20, y + i * 20, 1, 1, 0, 16777215, modulate.a)
	                j++
	            }
	        }
	        i++
	    }
	}
	if(scale.x > 1 and scale.y == 1) {
	    j= 0
	    while(j < scale.x) {
	        draw_sprite_ext(sprite_index, frame, x + j * 20, y + i * 20, 1, 1, 0, 16777215, modulate.a)
	        j++
	    }
	}
	if(scale.x == 1 and scale.y == 1)
	    draw_sprite(sprite_index, frame, x, y)

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
