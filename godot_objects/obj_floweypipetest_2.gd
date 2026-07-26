# Auto-converted from GameMaker: obj_floweypipetest_2
# GM parent: obj_floweybodyparent
extends Node2D

func _ready():
	siner= 0
	op= 180
	magicfactor= 332
	magicfactor2= 608
	magicfactor3= 1062
	flash= 0
	blend2= 16777215
	frozen= 0
	scr_floweybodysave()

func _on_outside_room():
	if(frozen == 0) siner++
	if(flash == 0) {
	    image_blend= 16777215
	    blend2= 16777215
	}
	if(flash == 1) {
	    draw_set_alpha(sin(siner / 3) / 2)
	    draw_ellipse_color(x - 85, y + 40, x + 85, y - 40, 16711680, 0, 0)
	    draw_set_alpha(1)
	    image_blend= make_color_rgb(120 - sin(siner / 3) / 2 * 100, 120 - sin(siner / 3) / 2 * 100, 255)
	}
	if(flash == 2) {
	    draw_set_alpha(sin(siner / 3) / 2)
	    draw_ellipse_color(x - 105 + op, y + 40, x + 85 + op, y - 40, 16711935, 0, 0)
	    draw_set_alpha(1)
	    blend2= make_color_rgb(230, 100 - sin(siner / 3) * 100, 200)
	}
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(67)) {
	        if(flash == 0) flash= 2
	        else  {
	            flash= 0
	            blend2= 8421504
	        }
	    }
	    if(Input.is_action_pressed("ui_cancel")) {
	        if(flash == 0) flash= 1
	        else  {
	            flash= 0
	            image_blend= 8421504
	        }
	    }
	}
	i= 0
	while(i < 13) {
	    offx= x + sin((i - 49) / 3) * 85
	    offy= y + cos((i - 3) / 2.2) * 40 + cos((i + siner) / 6) * 8
	    offs= sin((siner + i * 4) / 6) * 2
	    if(offs > 1) offs= (offs - 1) / 3
	    else  offs= 0
	    offv= i * -12 - 330
	    if(i > 5) offv= i * -20 - 310
	    if(i > 7) offv= i * -22 - 310
	    if(GS.soul_rescue < 3)
	        draw_sprite_ext(sprite_index, frame, offx, offy, 1 + offs, 1 + offs - sin(i / 5) * 0.3, offv, image_blend, 1)
	    else 
	        draw_sprite_ext(sprite_index, frame, offx, offy, 1, 1, offv, 8421504, 1)
	    i++
	}
	i= 0
	while(i < 13) {
	    offx2= x - sin((i - 49) / 3) * 85 + op
	    offy2= y + cos((i - 3) / 2.2) * 40 + cos((i + siner) / 6) * 8
	    offs2= sin((siner + i * 4) / 6) * 2
	    if(offs2 > 1) offs2= (offs2 - 1) / 3
	    else  offs2= 0
	    offv2= i * 12 + magicfactor
	    if(i > 5) offv2= i * 30 + magicfactor2
	    if(i > 7) offv2= i * 20 + magicfactor3
	    if(GS.soul_rescue < 4)
	        draw_sprite_ext(sprite_index, frame, offx2, offy2, -1 - offs2, 1 + offs2 - sin(i / 5) * 0.3, offv2, blend2, 1)
	    else 
	        draw_sprite_ext(sprite_index, frame, offx2, offy2, -1, 1, offv2, 8421504, 1)
	    i++
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
