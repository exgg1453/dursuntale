# Auto-converted from GameMaker: obj_sorrybody
extends Node2D

func _ready():
	siner= 0
	freeze= 0
	intense= 0
	back= 0
	tailsiner= 0
	tailtype= 1
	extend= 1.5
	shimmy= 0
	ch= -1
	madech= 0
	ch_color= 16777215
	ch_color2= 16777215
	o_o= 0
	madetrash= 0
	madetrash_b= 0
	armtype= 0
	hat= random(60)
	GS.faceemotion= 0
	GS.flag[20]= 0
	tail_t= 0
	diff= 3
	pause= 0

func _gm_event_7_11():
	if(ch == 1 and obj_heart.x == obj_heart.xprevious and obj_heart.y == obj_heart.yprevious)
	    scr_damagestandard_x()
	if(ch == 0 and (obj_heart.x != obj_heart.xprevious or obj_heart.y != obj_heart.yprevious))
	    scr_damagestandard_x()

func _on_outside_room():
	if(pause == 1) {
	    draw_sprite_ext(582/* spr_sorry_body */, 0, x, y + 64, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x - 2, y + 128, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x + 2, y + 128, -2, 2, 0, 16777215, 1)
	    if(GS.flag[20] == 0) {
	        draw_sprite_ext(588/* spr_sorryarm */, 0, x - 44, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(588/* spr_sorryarm */, 0, x + 46, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    draw_sprite_ext(586/* spr_sorry_head */, 0, x, y, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(585/* spr_sorry_face */, GS.faceemotion, x, y + 12, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x - 32, y - 22, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x + 32, y - 22, -2, 2, 0, 16777215, 1)
	    draw_sprite_ext(595/* spr_sorryhat */, hat, x, y - 20, 2, 2, 0, 16777215, 1)
	    if(GS.flag[20] == 1) {
	        draw_sprite_ext(592/* spr_sorryarm_headgrab */, 0, x - 44, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(592/* spr_sorryarm_headgrab */, 0, x + 46, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    if(GS.flag[20] == 2) {
	        draw_sprite_ext(589/* spr_sorryarm_behind */, 0, x - 44, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(589/* spr_sorryarm_behind */, 0, x + 46, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    if(GS.flag[20] >= 3) {
	        draw_sprite_ext(589/* spr_sorryarm_behind */, 0, x - 44, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(591/* spr_sorryarm_drawing */, GS.flag[20], x + 52, y + 28, -2, 2, 0, 16777215, 1)
	    }
	}
	if(freeze == 0 and back == 0 and pause == 0) {
	    siner++
	    if(intense == 1) siner++
	    draw_sprite_ext(597/* spr_sorrytail */, 0, x + sin(siner / 12) * 46, y + 88, sin(siner / 12) * 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(582/* spr_sorry_body */, 0, x, y + 64 + sin(siner / 6) * 2, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x - 2 - sin(siner / 6) * 2, y + 128, 2, 2 + cos(siner / 3) * 0.1, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x + 2 + sin(siner / 6) * 2, y + 128, -2, 2 + cos(siner / 3) * 0.1, 0, 16777215, 1)
	    if(GS.flag[20] == 0) {
	        draw_sprite_ext(588/* spr_sorryarm */, GS.flag[20], x - 44 + sin(siner / 3) * 2, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(588/* spr_sorryarm */, GS.flag[20], x + 46 - sin(siner / 3) * 2, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    draw_sprite_ext(586/* spr_sorry_head */, 0, x, y + sin(siner / 6) * 3, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(585/* spr_sorry_face */, GS.faceemotion, x, y + 12 + sin(siner / 6) * 4, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x - 32, y - 22 + sin(siner / 6) * 1, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x + 32, y - 22 + sin(siner / 6) * 1, -2, 2, 0, 16777215, 1)
	    draw_sprite_ext(595/* spr_sorryhat */, hat, x, y - 20 + sin(siner / 6) * 5, 2, 2, 0, 16777215, 1)
	    if(GS.flag[20] == 1) {
	        draw_sprite_ext(592/* spr_sorryarm_headgrab */, GS.flag[20], x - 44 + sin(siner / 3) * 2, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(592/* spr_sorryarm_headgrab */, GS.flag[20], x + 46 - sin(siner / 3) * 2, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    if(GS.flag[20] == 2) {
	        draw_sprite_ext(589/* spr_sorryarm_behind */, GS.flag[20], x - 44 + sin(siner / 3) * 2, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(589/* spr_sorryarm_behind */, GS.flag[20], x + 46 - sin(siner / 3) * 2, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    if(GS.flag[20] >= 3) {
	        draw_sprite_ext(589/* spr_sorryarm_behind */, GS.flag[20], x - 44 + sin(siner / 3) * 2, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(591/* spr_sorryarm_drawing */, GS.flag[20], x + 52 - sin(siner / 3) * 2, y + 28, -2, 2, 0, 16777215, 1)
	    }
	}
	if(back == 1) {
	    tailsiner+= 1 + tail_t
	    siner++
	    if(intense == 1) siner++
	    if(armtype == 0) {
	        draw_sprite_ext(588/* spr_sorryarm */, 0, x - 44 + sin(siner / 3) * 2, y + 32, 2, 2, 0, 16777215, 1)
	        draw_sprite_ext(588/* spr_sorryarm */, 0, x + 46 - sin(siner / 3) * 2, y + 32, -2, 2, 0, 16777215, 1)
	    }
	    if(armtype == 1) {
	        arm_a= sin(siner / 8) * 22
	        armspr= 590
	        if(arm_a <= -16) {
	            armspr= 593
	            if(madetrash == 0) {
	                madetrash= 1
	                repeat(diff) 
	                    instance_create(x - 54 + arm_a, y + 32 + 8 + arm_a, 456/* obj_sorry_trashball */)
	                if(instance_exists(458/* obj_sosorry */) and obj_sosorry.myplot >= 5) {
	                    // obj_sorry_trashball
	                    with(456) stop= -1
	                }
	            }
	        }
	        if(arm_a > 0) madetrash= 0
	        draw_sprite_ext(armspr, 0, x - 20 + arm_a, y + 32 + 20 + arm_a, 2, 2, -sin(siner / 4) * 15, 16777215, 1)
	        arm_b= sin((24 + siner) / 8) * 22
	        armspr= 590
	        if(arm_b <= -16) {
	            armspr= 593
	            if(madetrash_b == 0) {
	                madetrash_b= 1
	                repeat(diff) 
	                    instance_create(x + 54 - arm_b, y + 32 + 8 + arm_b, 456/* obj_sorry_trashball */)
	                if(instance_exists(458/* obj_sosorry */) and obj_sosorry.myplot >= 5) {
	                    // obj_sorry_trashball
	                    with(456) stop= -1
	                }
	            }
	        }
	        if(arm_b > 0) madetrash_b= 0
	        draw_sprite_ext(armspr, 0, x + 22 - arm_b, y + 32 + 20 + arm_b, -2, 2, sin((12 + siner) / 4) * 15, 16777215, 1)
	    }
	    draw_sprite_ext(595/* spr_sorryhat */, hat, x, y - 20 + sin(siner / 6) * 5, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(587/* spr_sorry_headback */, 0, x, y + sin(siner / 6) * 3, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x - 2 - sin(siner / 6) * 2, y + 128, 2, 2 + cos(siner / 3) * 0.1, 0, 16777215, 1)
	    draw_sprite_ext(596/* spr_sorryleg */, 0, x + 2 + sin(siner / 6) * 2, y + 128, -2, 2 + cos(siner / 3) * 0.1, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x - 32, y - 22 + sin(siner / 6) * 1, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(594/* spr_sorryear_l */, 0, x + 32, y - 22 + sin(siner / 6) * 1, -2, 2, 0, 16777215, 1)
	    draw_sprite_ext(583/* spr_sorry_bodyback */, 0, x, y + 64 + sin(siner / 6) * 2, 2, 2, 0, 16777215, 1)
	    if(tailtype == 0) {
	        minpull= sin(tailsiner / 12) * 1.7
	        if(minpull > 0) minpull+= 0.3
	        if(minpull < 0) minpull-= 0.3
	        i= 0
	        while(i < 16) {
	            if(minpull >= 0) g= -1
	            if(minpull < 0) g= 1
	            draw_sprite_ext(598/* spr_sorrytail_curveback */, 0, x + sin(tailsiner / 12) * 40, y + 82 + sin(siner / 6) * 2, minpull + i * 0.04 * g, 2, 0, 16777215, 1)
	            i++
	        }
	    }
	    if(tailtype == 1) {
	        rot= sin(tailsiner / 12) * 80
	        cut= 1
	        if(rot >= 46 or rot <= -46) cut= 0.5
	        if(rot >= 49 or rot <= -49) cut= 0.25
	        if(rot >= 52 or rot <= -52) cut= 0
	        add= (extend - abs(sin(tailsiner / 12)) * extend) * cut
	        if(abs(rot) < 58) {
	            draw_sprite_ext(599/* spr_sorrytail_vert */, 0, x, y + 42 - add * 15, 2 - add / 4, 2 + add, sin(tailsiner / 12) * 80, ch_color, 1)
	            if(collision_line(x, y + 42 - add * 15, x + lengthdir_x(130 + 60 * add, rot - 90), y + 42 - add * 15 + lengthdir_y(130 + 60 * add, rot - 90), 743, 0, 1))
	                event_user(1)
	            if(collision_line(x - 2, y + 42 - add * 15, x + lengthdir_x(130 + 60 * add, rot - 90) - 2, y + 42 - add * 15 + lengthdir_y(130 + 60 * add, rot - 90), 743, 0, 1))
	                event_user(1)
	            if(collision_line(x + 2, y + 42 - add * 15, x + lengthdir_x(130 + 60 * add, rot - 90) + 2, y + 42 - add * 15 + lengthdir_y(130 + 60 * add, rot - 90), 743, 0, 1))
	                event_user(1)
	            madech= 0
	        }
	        if(rot >= 58) {
	            if(madech == 0) {
	                madech= 1
	                if(ch == 0) ch= choose(1, 1, 0)
	                else  {
	                    if(ch == 1) ch= choose(0, 0, 1)
	                    else  ch= choose(0, 1)
	                }
	                if(ch == 0) ch_color= 16754964
	                else  ch_color= 4235519
	            }
	            if(ch == 0)
	                ch_color2= merge_color(16777215, 16754964, abs(sin(siner / 2)))
	            if(ch == 1)
	                ch_color2= merge_color(16777215, 4235519, abs(sin(siner / 2)))
	            draw_sprite_ext(598/* spr_sorrytail_curveback */, 0, x + sin(tailsiner / 12) * 44, y + 80, 2, 2, sin(tailsiner / 12) * 60 - 60, ch_color2, 1)
	        }
	        if(rot <= -58) {
	            if(madech == 0) {
	                madech= 1
	                if(ch == 0) ch= choose(1, 1, 0)
	                else  {
	                    if(ch == 1) ch= choose(0, 0, 1)
	                    else  ch= choose(0, 1)
	                }
	                if(ch == 0) ch_color= 16754964
	                else  ch_color= 4235519
	            }
	            if(ch == 0)
	                ch_color2= merge_color(16777215, 16754964, abs(sin(siner / 2)))
	            if(ch == 1)
	                ch_color2= merge_color(16777215, 4235519, abs(sin(siner / 2)))
	            draw_sprite_ext(598/* spr_sorrytail_curveback */, 0, x + sin(tailsiner / 12) * 44, y + 80, -2, 2, sin(tailsiner / 12) * 60 + 60, ch_color2, 1)
	        }
	    }
	    if(o_o == 0) o_o= 1
	    else  o_o= 0
	}
	if(shimmy == 1) x+= cos(siner / 12) * 6

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
