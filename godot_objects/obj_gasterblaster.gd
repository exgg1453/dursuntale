# Auto-converted from GameMaker: obj_gasterblaster
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	con= 1
	idealx= 200
	idealy= 200
	idealrot= 90
	scale.x= 1
	scale.y= 1
	image_speed= 0
	skip= 1
	pause= 8
	col_o= 0
	bt= 0
	btimer= 0
	fade= 1
	terminal= 10
	bb= 0
	bbsiner= 0
	innate_karma= 10
	// obj_sansb
	with(519) p_power= 1

func _gm_event_2_4():
	con++

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(con == 1 and skip == 0) {
	    x+= floor((idealx - x) / 3)
	    y+= floor((idealy - y) / 3)
	    if(x < idealx) x++
	    if(y < idealy) y++
	    if(x > idealx) x--
	    if(y > idealy) y--
	    if(abs(x - idealx) < 3) x= idealx
	    if(abs(y - idealy) < 3) y= idealy
	    if(abs(x - idealx) < 0.1 and abs(y - idealy) < 0.1) {
	        con= 2
	        $Alarm4.start((2) / 30.0)
	    }
	}
	if(con == 1 and skip == 1) {
	    x+= floor((idealx - x) / 3)
	    y+= floor((idealy - y) / 3)
	    if(x < idealx) x++
	    if(y < idealy) y++
	    if(x > idealx) x--
	    if(y > idealy) y--
	    if(abs(x - idealx) < 3) x= idealx
	    if(abs(y - idealy) < 3) y= idealy
	    rotation_degrees+= floor((idealrot - rotation_degrees) / 3)
	    if(rotation_degrees < idealrot)
	        rotation_degrees++
	    if(rotation_degrees > idealrot)
	        rotation_degrees--
	    if(abs(rotation_degrees - idealrot) < 3)
	        rotation_degrees= idealrot
	    if(abs(x - idealx) < 0.1 and abs(y - idealy) < 0.1 and abs(idealrot - rotation_degrees) < 0.01) {
	        con= 4
	        $Alarm4.start((pause) / 30.0)
	    }
	}
	if(con == 3) {
	    rotation_degrees+= floor((idealrot - rotation_degrees) / 3)
	    if(rotation_degrees < idealrot)
	        rotation_degrees++
	    if(rotation_degrees > idealrot)
	        rotation_degrees--
	    if(abs(rotation_degrees - idealrot) < 3)
	        rotation_degrees= idealrot
	    if(abs(idealrot - rotation_degrees) < 0.01) {
	        con= 4
	        $Alarm4.start((pause) / 30.0)
	    }
	}
	if(con == 5) {
	    con= 6
	    $Alarm4.start((4) / 30.0)
	}
	if(con == 6) frame++
	if(con == 7) {
	    if(frame == 4) frame= 5
	    else  {
	        if(frame == 5) frame= 4
	    }
	    direction= idealrot + 90
	    if(btimer == 0) {
	        // obj_sansb
	        with(519) p_beam= 1
	    }
	    if(btimer == 0 and scale.x >= 2) {
	        sh= instance_create(0, 0, 512/* obj_sans_shaker */)
	        sh.intensity= 5
	    }
	    btimer++
	    if(btimer < 5) {
	        speed++
	        bt+= floor(35 * scale.x / 4)
	    } else  speed+= 4
	    if(btimer > 5 + terminal) {
	        bt*= 0.8
	        fade-= 0.1
	        draw_set_alpha(fade)
	        if(bt <= 2) instance_destroy()
	    }
	    if(x < -sprite_width) speed= 0
	    if(x > get_viewport_rect().size.x + sprite_width) speed= 0
	    if(y > get_viewport_rect().size.y + sprite_height) speed= 0
	    if(x < -sprite_height) speed= 0
	    bbsiner++
	    bb= sin(bbsiner / 1.5) * bt / 4
	    xx= lengthdir_x(70, rotation_degrees - 90) * scale.x / 2
	    yy= lengthdir_y(70, rotation_degrees - 90) * scale.x / 2
	    rr= random(2) - random(2)
	    rr2= random(2) - random(2)
	    xxx= lengthdir_x(1000, rotation_degrees - 90)
	    yyy= lengthdir_y(1000, rotation_degrees - 90)
	    draw_set_color(16777215)
	    draw_line_width(x + xx + rr, y + yy + rr2, x + xxx + rr, y + yyy + rr2, bt + bb)
	    xxa= lengthdir_x(50, rotation_degrees - 90) * scale.x / 2
	    yya= lengthdir_y(50, rotation_degrees - 90) * scale.x / 2
	    xxb= lengthdir_x(60, rotation_degrees - 90) * scale.x / 2
	    yyb= lengthdir_y(60, rotation_degrees - 90) * scale.x / 2
	    draw_line_width(x + xx + rr, y + yy + rr2, x + xxa + rr, y + yya + rr2, bt / 2 + bb)
	    draw_line_width(x + xx + rr, y + yy + rr2, x + xxb + rr, y + yyb + rr2, bt / 1.25 + bb)
	    nx_factor= lengthdir_x(1, rotation_degrees)
	    ny_factor= lengthdir_y(1, rotation_degrees)
	    if(col_o == 1 and fade >= 0.8) {
	        cl= 0
	        while(cl < 4) {
	            if(collision_line(x + xx - nx_factor * bt / 2 * cl / 4, y + yy - ny_factor * bt / 2 * cl / 4, x + xxx - nx_factor * bt / 2 * cl / 4, y + yyy - ny_factor * bt / 2 * cl / 4, 743, 0, 1))
	                event_user(7)
	            cl++
	        }
	        cl= 0
	        while(cl < 4) {
	            if(collision_line(x + xx + nx_factor * bt / 2 * cl / 4, y + yy + ny_factor * bt / 2 * cl / 4, x + xxx + nx_factor * bt / 2 * cl / 4, y + yyy + ny_factor * bt / 2 * cl / 4, 743, 0, 1))
	                event_user(7)
	            cl++
	        }
	    }
	    if(col_o == 0) col_o= 1
	    draw_set_alpha(1)
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
