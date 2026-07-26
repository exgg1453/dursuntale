# Auto-converted from GameMaker: obj_bonestab
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	con= 0
	warning= 9
	dir= 0
	height= 25
	retain= 4
	cosm_y= 0
	cosm_x= 0
	racket= 3
	active= 0
	timer= 0
	$Alarm0.start((1) / 30.0)
	dir= choose(0, 2)
	innate_karma= 6

func _on_destroy():
	active= 1
	con= 1
	if(dir == 1 or dir == 3) sprite_index= 664/* spr_s_bonestab_h_tall */
	if(dir == 0 or dir == 2) sprite_index= 662/* spr_s_bonestab_v_wide */
	if(dir == 0 or dir == 2) x= GS.idealborder[0]
	if(dir == 3) x= GS.idealborder[0] - sprite_width
	if(dir == 1) x= GS.idealborder[1]
	if(dir == 0) y= GS.idealborder[3]
	if(dir == 1 or dir == 3) y= GS.idealborder[2]
	if(dir == 2) y= GS.idealborder[2] - sprite_height
	ideal_y= y
	ideal_x= x
	if(warning > 4) snd_play(29/* snd_b */)

func _on_outside_room():
	if(active == 1) {
	    warning--
	    if(warning > 0) {
	        if(dir == 0) {
	            wx= GS.idealborder[0] + 8
	            wx2= GS.idealborder[1] - 3
	            wy= GS.idealborder[3] - 3
	            wy2= GS.idealborder[3] - height
	        }
	        if(dir == 1) {
	            wx= GS.idealborder[1] - height
	            wx2= GS.idealborder[1] - 3
	            wy= GS.idealborder[2] + 8
	            wy2= GS.idealborder[3] - 3
	        }
	        if(dir == 2) {
	            wx= GS.idealborder[0] + 8
	            wx2= GS.idealborder[1] - 3
	            wy= GS.idealborder[2] + 6
	            wy2= GS.idealborder[2] + 5 + height
	        }
	        if(dir == 3) {
	            wx= GS.idealborder[0] + 5 + height
	            wx2= GS.idealborder[0] + 8
	            wy= GS.idealborder[2] + 8
	            wy2= GS.idealborder[3] - 3
	        }
	        draw_set_color(255)
	        draw_rectangle(wx, wy, wx2, wy2, 1)
	    } else  {
	        draw_self_border()
	        if(con == 1) con= 2
	    }
	}
	if(con == 2) {
	    if(timer == 0) snd_play(14/* snd_spearrise */)
	    if(timer >= 0 and timer <= 2) {
	        if(dir == 0) y-= floor(height / 3)
	        if(dir == 1) x-= floor(height / 3)
	        if(dir == 2) y+= floor(height / 3)
	        if(dir == 3) x+= floor(height / 3)
	    }
	    if(timer == 3) {
	        if(dir == 0) cosm_y-= floor(height / 5)
	        if(dir == 1) cosm_x-= floor(height / 5)
	        if(dir == 2) cosm_y+= floor(height / 5)
	        if(dir == 3) cosm_x+= floor(height / 5)
	    }
	    if(timer == 4) {
	        cosm_x= 0
	        cosm_y= 0
	    }
	    if(retain >= 0 and timer >= 4 and timer <= 8) {
	        rr= random(racket) - random(racket)
	        rr2= random(racket) - random(racket)
	        if(racket > 1) racket--
	        if(timer == 9) rr= 0
	        if(timer == 9) rr2= 0
	        if(dir == 0) {
	            y= ideal_y - height + rr
	            x= ideal_x + rr2
	        }
	        if(dir == 1) {
	            y= ideal_y + rr
	            x= ideal_x - height + rr2
	        }
	        if(dir == 2) {
	            y= ideal_y + height + rr
	            x= ideal_x + rr2
	        }
	        if(dir == 3) {
	            y= ideal_y + rr
	            x= ideal_x + height + rr2
	        }
	    }
	    if(timer >= 9 + retain) {
	        if(dir == 0) {
	            y+= floor(height / 4)
	            if(y > ideal_y) instance_destroy()
	        }
	        if(dir == 1) {
	            x+= floor(height / 4)
	            if(x > ideal_x) instance_destroy()
	        }
	        if(dir == 2) {
	            y-= floor(height / 4)
	            if(y < ideal_y) instance_destroy()
	        }
	        if(dir == 3) {
	            x-= floor(height / 4)
	            if(x < ideal_x) instance_destroy()
	        }
	    }
	    timer++
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
