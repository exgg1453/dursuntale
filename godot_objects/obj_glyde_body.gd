# Auto-converted from GameMaker: obj_glyde_body
extends Node2D

func _ready():
	siner= 0
	dsiner= 0
	sh_timer= 0
	sh_speed= 1
	diff= 5
	sh= 0
	attackmode= 0
	$Alarm1.start((0) / 30.0)
	pause= 0

func _gm_event_2_1():
	bl= instance_create(x + 72 + gg * 8, y + gg * 10 - 8, 226/* obj_bigglydeshot */)
	if(GS.turntimer > 33) $Alarm1.start((32) / 30.0)

func _on_outside_room():
	if(pause == 1) {
	    siner= 0
	    draw_sprite_ext(237/* spr_glyde_hurt */, frame, x - 72, y - 24, 1, 1, 0, 16777215, 1)
	    x= xstart
	    y= ystart
	} else  {
	    dsiner++
	    siner+= cos(dsiner / 24) * 2
	    y= ystart + sin(siner / 12) * 8
	    g= sin(siner / 6)
	    gg= sin(siner / 12)
	    if(attackmode == 1) image_blend= 8421504
	    else  image_blend= 16777215
	    draw_sprite_ext(240/* spr_glyde_rightwing */, 0, x + 46, y + 106 + g * 2, 2, 1.7 - g * 0.3, 0, image_blend, 1)
	    draw_sprite_ext(238/* spr_glyde_body */, 0, x, y, 2, 2, 0, image_blend, 1)
	    draw_sprite_ext(239/* spr_glyde_leftwing */, 0, x + 82, y + 174, 1.95 - g * 0.05, 1.8 - g * 0.2, 0, image_blend, 1)
	    draw_sprite_ext(243/* spr_glyde_antenna */, 0, x + 54 + gg * 2, y + 4, 2, 2, 20 - gg * 20, 16777215, 1)
	    if(sh == 1) {
	        sh_timer+= sh_speed
	        if(sh_timer > 1) {
	            if(sh_timer >= 6)
	                draw_sprite_ext(241/* spr_glydeshot */, 0, x + 72 + gg * 8, y + gg * 10 - 8, 2, 2, 20 - gg * 20, 16777215, 1)
	            if(floor((sh_timer - 1) / 2) < 4)
	                draw_sprite_ext(246/* spr_glyde_blackflash_b */, floor((sh_timer - 1) / 2), x + 72 + gg * 8, y + gg * 10 - 8, 2, 2, 20 - gg * 20, 16777215, 1)
	            if(diff < 1) diff= 1
	            if(sh_timer >= 12) {
	                i= 0
	                while(i < diff) {
	                    bl= instance_create(x + 72 + gg * 8, y + gg * 10 - 8, 225/* obj_glydeshot */)
	                    bl.direction= 300 - (i + 1) / diff * 60 + random(1 / diff * 60)
	                    i++
	                }
	                sh_timer= -1
	            }
	        }
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
