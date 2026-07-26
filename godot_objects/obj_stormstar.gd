# Auto-converted from GameMaker: obj_stormstar
extends Node2D

func _ready():
	con= 1
	$Alarm4.start((14 + random(10)) / 30.0)
	image_speed= 0
	direction= 215
	speed= 14 + random(6)
	counter= 0
	siner= 0
	scale.x= 1
	scale.y= 1
	xx= x
	yy= y
	xxx= x
	yyy= y
	xxxx= x
	yyyy= y
	xxxxx= x
	yyyyy= y
	oo= 0
	big= 0
	$Alarm1.start((1) / 30.0)
	aa= 0
	h_mode= 1

func _gm_event_2_4():
	con++

func _gm_event_2_1():
	if(big == 1) {
	    scale.x= 2
	    scale.y= 2
	    aa= 2
	    speed= 8
	    counter= -28
	}

func _process(delta: float):
	siner++
	if(counter < 20)
	    image_blend= make_color_hsv(siner * 12, 100, 244)
	if(con == 2) {
	    if(counter > 20) {
	        image_speed= 0.5
	        image_blend= 16777215
	    }
	    counter++
	    if(counter >= 30) event_user(3)
	}
	if(con == 3) {
	    if(big == 0) {
	        modulate.a-= 0.05
	        scale.x+= 0.1
	        scale.y+= 0.1
	    }
	    if(big == 1) {
	        aa= 0
	        modulate.a-= 0.05
	        scale.x+= 0.2
	        scale.y+= 0.2
	    }
	}
	if(con == 4) instance_destroy()

func _gm_event_7_13():
	image_speed= 0.5
	image_blend= 16777215
	con= 3
	$Alarm4.start((20) / 30.0)
	image_speed= 0
	speed= 0
	dir= random(360)
	if(big == 0) {
	    if(h_mode == 0) {
	        i= 0
	        while(i < 7) {
	            star= instance_create(x, y, 579/* obj_regstar_blt */)
	            star.h_mode= h_mode
	            star.friction= -0.2
	            star.speed= 1.4
	            star.direction= dir + 51.4285714285714 * i
	            i++
	        }
	        // obj_stormstar_gen
	        with(580) event_user(1)
	    }
	    if(h_mode == 1) {
	        i= 0
	        while(i < 7) {
	            star= instance_create(x, y, 579/* obj_regstar_blt */)
	            star.h_mode= h_mode
	            star.friction= -0.25
	            star.speed= 1.5
	            star.direction= dir + 51.4285714285714 * i
	            i++
	        }
	        // obj_stormstar_gen
	        with(580) event_user(1)
	    }
	}
	if(big == 1) {
	    // obj_stormstar_gen
	    with(580) event_user(2)
	    i= 0
	    while(i < 20) {
	        star= instance_create(x, y, 579/* obj_regstar_blt */)
	        star.friction= -0.3
	        star.speed= 1.6
	        star.direction= dir + 22.5 * i
	        star.h_mode= h_mode
	        i++
	    }
	    dir+= 9
	    i= 0
	    while(i < 20) {
	        star= instance_create(x, y, 579/* obj_regstar_blt */)
	        star.friction= -0.24
	        star.speed= 0.8
	        star.direction= dir + 22.5 * i
	        star.h_mode= h_mode
	        i++
	    }
	    i= 0
	    while(i < 20) {
	        star= instance_create(x, y, 579/* obj_regstar_blt */)
	        star.friction= -0.18
	        star.speed= 0.2
	        star.direction= dir + 18 * i
	        star.h_mode= h_mode
	        i++
	    }
	}
	ex= instance_create(x, y, 578/* obj_explodestar */)
	ex.sprite_index= sprite_index
	ex.frame= frame
	ex.image_blend= image_blend
	ex.image_speed= image_speed
	ex.aa= aa
	ex.big= big
	ex.z_index= z_index
	ex.modulate.a= modulate.a
	ex.rotation_degrees= rotation_degrees
	instance_destroy()

func _on_outside_room():
	xxxxx= xxxx
	yyyyy= yyyy
	xxxx= xxx
	yyyy= yyy
	xxx= xx
	yyy= yy
	xx= xprevious
	yy= yprevious
	draw_sprite_ext(sprite_index, 1, xxxxx, yyyyy, scale.x, scale.y, rotation_degrees, image_blend, modulate.a - 0.65)
	draw_sprite_ext(sprite_index, 1, xxx, yyy, scale.x, scale.y, rotation_degrees, image_blend, modulate.a - 0.5)
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(big == 1) {
	    draw_set_circle_precision(16)
	    draw_set_color(image_blend)
	    if(oo == 0) oo= 1
	    else  oo= 0
	    if(oo == 0) draw_set_alpha(0.25 - 1 - modulate.a)
	    if(oo == 1) draw_set_alpha(0.5 - 1 - modulate.a)
	    draw_circle(x, y, 200 + oo * 20, 0)
	    draw_set_alpha(1)
	}
	if(aa > 0) rotation_degrees+= aa

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
