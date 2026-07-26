# Auto-converted from GameMaker: obj_sidedam
# GM parent: obj_asgorebulparent
extends Node2D

func _ready():
	con= 0
	side= 0
	len= 50
	wait= 40
	eo= 0

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(side == 0) {
	    if(con == 0) {
	        con= 1
	        $Alarm4.start((wait) / 30.0)
	    }
	    if(con < 2) {
	        if(eo == 0) draw_set_color(255)
	        if(eo == 1) {
	            draw_set_color(65535)
	            snd_play(119/* snd_credit_s */)
	        }
	        if(eo == 2) draw_set_color(0)
	        draw_sprite(522/* spr_exclamationpoint */, eo, GS.idealborder[0] + 12, GS.idealborder[2] + 40)
	        eo++
	        if(eo > 2) eo= 0
	        draw_set_color(255)
	        draw_rectangle(GS.idealborder[0] + 5, GS.idealborder[2] + 5, GS.idealborder[0] + len, GS.idealborder[3] - 5, 1)
	        draw_rectangle(GS.idealborder[0] + 6, GS.idealborder[2] + 6, GS.idealborder[0] + len - 1, GS.idealborder[3] - 4, 1)
	    }
	    if(con == 2) {
	        con= 3
	        snd_play(30/* snd_break2 */)
	        $Alarm4.start((14) / 30.0)
	    }
	    if(con == 3) {
	        repeat(4) 
	            instance_create(GS.idealborder[0] + random(len - 6) - 6, 0, 471/* obj_sided_fire */)
	    }
	    if(con == 4) instance_destroy()
	}
	if(side == 1) {
	    if(con == 0) {
	        con= 1
	        $Alarm4.start((wait) / 30.0)
	    }
	    if(con < 2) {
	        if(eo == 0) draw_set_color(255)
	        if(eo == 1) {
	            draw_set_color(65535)
	            snd_play(119/* snd_credit_s */)
	        }
	        if(eo == 2) draw_set_color(0)
	        draw_sprite(522/* spr_exclamationpoint */, eo, GS.idealborder[1] - 38, GS.idealborder[2] + 40)
	        eo++
	        if(eo > 2) eo= 0
	        draw_rectangle(GS.idealborder[1] - 5, GS.idealborder[2] + 5, GS.idealborder[1] - len, GS.idealborder[3] - 5, 1)
	        draw_rectangle(GS.idealborder[1] - 4, GS.idealborder[2] + 4, GS.idealborder[1] - len + 1, GS.idealborder[3] - 4, 1)
	    }
	    if(con == 2) {
	        con= 3
	        snd_play(30/* snd_break2 */)
	        $Alarm4.start((14) / 30.0)
	    }
	    if(con == 3) {
	        repeat(4) 
	            instance_create(GS.idealborder[1] - random(len + 6) - 8, 0, 471/* obj_sided_fire */)
	    }
	    if(con == 4) instance_destroy()
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
