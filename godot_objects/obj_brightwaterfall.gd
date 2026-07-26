# Auto-converted from GameMaker: obj_brightwaterfall
extends Node2D

func _ready():
	siner= 0

func _on_outside_room():
	siner++
	if(scale.x == 1) draw_sprite(961/* spr_waterfall_singletop */, siner / 5, x, y)
	if(scale.x > 1) {
	    draw_sprite(965/* spr_waterfall_bright_lt */, siner / 5, x, y)
	    i= 1
	    while(i < scale.x + 1) {
	        if(i < scale.x) {
	            draw_sprite(963/* spr_waterfall_bright_mt */, siner / 5, x + i * 20, y)
	            i++
	        } else  {
	            draw_sprite(964/* spr_waterfall_bright_rt */, siner / 5, x + i * 20 - 20, y)
	            break
	        }
	    }
	}
	if(scale.y > 1 and scale.x == 1) {
	    i= 1
	    while(i <= scale.y) {
	        draw_sprite(968/* spr_waterfall_bright_mm */, siner / 5, x, y + i * 20)
	        i++
	    }
	}
	if(scale.y > 1 and scale.x > 1) {
	    j= 1
	    while(j <= scale.y) {
	        if(j < scale.y)
	            draw_sprite(966/* spr_waterfall_bright_lm */, siner / 5, x, y + j * 20)
	        if(j == scale.y)
	            draw_sprite(971/* spr_waterfall_bright_bl */, siner / 5, x, y + j * 20 - 20)
	        i= 1
	        while(i <= scale.x) {
	            if(j < scale.y) {
	                if(i == scale.x)
	                    draw_sprite(967/* spr_waterfall_bright_rm */, siner / 5, x + i * 20 - 20, y + j * 20)
	                else 
	                    draw_sprite(968/* spr_waterfall_bright_mm */, siner / 5, x + i * 20, y + j * 20)
	            }
	            if(j == scale.y) {
	                if(i == scale.x)
	                    draw_sprite(970/* spr_waterfall_bright_br */, siner / 5, x + i * 20 - 20, y + j * 20 - 20)
	                else 
	                    draw_sprite(969/* spr_waterfall_bright_bm */, siner / 5, x + i * 20, y + j * 20 - 20)
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
