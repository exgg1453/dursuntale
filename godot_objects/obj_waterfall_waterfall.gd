# Auto-converted from GameMaker: obj_waterfall_waterfall
extends Node2D

func _ready():
	siner= 0
	if(room == 87) z_index= 950000

func _on_outside_room():
	siner++
	if(scale.x == 1) draw_sprite(961/* spr_waterfall_singletop */, siner / 5, x, y)
	if(scale.x > 1) {
	    draw_sprite(960/* spr_waterfall_topleft */, siner / 5, x, y)
	    i= 1
	    while(i < scale.x + 1) {
	        if(i < scale.x) {
	            draw_sprite(959/* spr_waterfall_midtop */, siner / 5, x + i * 20, y)
	            i++
	        } else  {
	            draw_sprite(962/* spr_waterfall_topright */, siner / 5, x + i * 20 - 20, y)
	            break
	        }
	    }
	}
	if(scale.y > 1 and scale.x == 1) {
	    i= 1
	    while(i <= scale.y) {
	        draw_sprite(957/* spr_waterfall_midmid */, siner / 5, x, y + i * 20)
	        i++
	    }
	}
	if(scale.y > 1 and scale.x > 1) {
	    j= 1
	    while(j <= scale.y) {
	        if(j < scale.y)
	            draw_sprite(956/* spr_waterfall_midleft */, siner / 5, x, y + j * 20)
	        if(j == scale.y)
	            draw_sprite(953/* spr_waterfall_bottomleft */, siner / 5, x, y + j * 20 - 20)
	        i= 1
	        while(i <= scale.x) {
	            if(j < scale.y) {
	                if(i == scale.x)
	                    draw_sprite(958/* spr_waterfall_midright */, siner / 5, x + i * 20 - 20, y + j * 20)
	                else 
	                    draw_sprite(957/* spr_waterfall_midmid */, siner / 5, x + i * 20, y + j * 20)
	            }
	            if(j == scale.y) {
	                if(i == scale.x)
	                    draw_sprite(955/* spr_waterfall_bottomright */, siner / 5, x + i * 20 - 20, y + j * 20 - 20)
	                else 
	                    draw_sprite(954/* spr_waterfall_bottommid */, siner / 5, x + i * 20, y + j * 20 - 20)
	            }
	            i++
	        }
	        j++
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
