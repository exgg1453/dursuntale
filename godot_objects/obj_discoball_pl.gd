# Auto-converted from GameMaker: obj_discoball_pl
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	diff= 0
	$Alarm0.start((1) / 30.0)
	active= 0
	type= 0
	bb= 0
	rottimer= 0
	swaptimer= 0
	soundtimer= 0

func _on_destroy():
	if(diff == 0) {
	    laserno= 0
	    maxlaser= 5
	    laser[0]= 1
	    laser[1]= 1
	    laser[2]= 2
	    laser[3]= 1
	    laser[4]= 1
	    laserdist= 72
	    rotspeed= 2
	    rottimer= 80
	    rot= 20
	}
	if(diff == 1) {
	    laserno= 0
	    maxlaser= 5
	    laser[0]= 1
	    laser[1]= 1
	    laser[2]= 1
	    laser[3]= 2
	    laser[4]= 1
	    laserdist= 72
	    rotspeed= 4
	    rot= 0
	}
	if(diff == 2) {
	    laserno= 0
	    maxlaser= 4
	    laser[0]= 1
	    laser[1]= 1
	    laser[2]= 2
	    laser[3]= 1
	    laser[4]= 1
	    laserdist= 90
	    rotspeed= 4.75
	    rot= 0
	}
	active= 1

func _on_alarm_0_timeout():
	// other
	with(-2) instance_destroy()
	if(type == 0) type= 1
	else  type= 0
	swaptimer= 3
	sprite_index= 532/* spr_discoball_invert_pl */
	if(soundtimer < 0) {
	    snd_play(106/* snd_noise */)
	    soundtimer= 2
	}
	if(instance_exists(402/* obj_ratingsmaster */))
	    GS.ratings+= 5

func _on_outside_room():
	soundtimer--
	swaptimer--
	if(swaptimer < 0) sprite_index= 531/* spr_discoball_pl */
	if(active == 1) {
	    i= 0
	    while(i < maxlaser) {
	        xx= x + lengthdir_x(160, rot + laserdist * i) + 20
	        if(xx > GS.idealborder[1]) xx= GS.idealborder[1]
	        if(xx < GS.idealborder[0]) xx= GS.idealborder[0]
	        yy= y + lengthdir_y(160, rot + laserdist * i) + 30
	        if(yy > GS.idealborder[3]) yy= GS.idealborder[3]
	        if(yy < GS.idealborder[2]) yy= GS.idealborder[2]
	        if(laser[i] == 1) {
	            if(type == 0) {
	                draw_set_color(16754964)
	                bb= 1
	            } else  {
	                draw_set_color(16777215)
	                bb= 0
	            }
	        } else  {
	            if(type == 0) {
	                draw_set_color(16777215)
	                bb= 0
	            } else  {
	                draw_set_color(16754964)
	                bb= 1
	            }
	        }
	        if(yy > GS.idealborder[2]) {
	            draw_line_width(x + 20, y + 30, xx, yy, 3)
	            if(collision_line(x + 20, y + 30, xx, yy, 743, 1, 1)) {
	                if(bb == 0) event_user(11)
	                if(bb == 1 and (abs(obj_heart.xprevious - obj_heart.x) > 0.01 or abs(obj_heart.yprevious - obj_heart.y) > 0.01))
	                    event_user(11)
	            }
	        } else  {
	            if(laserno > 0) {
	                laser[i]= choose(1, 2, 3)
	                if(i > 0 and laser[i] == 3) {
	                    if(laser[i - 1] == 1) laser[i]= 2
	                    else  laser[i]= 1
	                }
	                if(i == 0 and laser[i] == 3) {
	                    if(laser[maxlaser - 1] == 1) laser[i]= 2
	                    else  laser[i]= 1
	                }
	            }
	        }
	        i++
	    }
	    rottimer--
	    if(rottimer < 0) rot-= rotspeed
	    if(rot < -180) {
	        laserno++
	        rot+= 360
	    }
	}
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
