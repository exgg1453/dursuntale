# Auto-converted from GameMaker: obj_fakeborderdraw
extends Node2D

func _ready():
	gr= 123981239812931
	drawngr= 0
	siner= 0
	rot= 0
	pattern= 0
	con= 0
	moved= 0
	xx= GS.idealborder[0]
	yy= GS.idealborder[2]
	factor= 0
	dmg= 0
	draedmode= 0

func _gm_event_1_0():
	if(draedmode == 0) sprite_delete(gr)

func _gm_event_2_4():
	con++

func _gm_event_7_5():
	if(draedmode == 0) sprite_delete(gr)

func _on_outside_room():
	if(draedmode == 0) {
	    if(drawngr == 1) sprite_delete(gr)
	    gr= sprite_create_from_screen_x(obj_lborder.x - 100, obj_uborder.y, obj_rborder.x - obj_lborder.x + 200, obj_dborder.y - obj_uborder.y + 8, 0, 0, (obj_rborder.x - obj_lborder.x) / 2 + 140, (obj_dborder.y - obj_uborder.y) / 2 + 4)
	    sprite_index= gr
	}
	op= 363
	draw_set_color(0)
	if(draedmode == 0) {
	    if(con < 6)
	        draw_rectangle(obj_lborder.x - 200, obj_uborder.y, obj_rborder.x + 280, obj_dborder.y + 8, 0)
	    if(con < 6)
	        draw_rectangle(0, GS.idealborder[2], 640, GS.idealborder[3] + 5, 0)
	}
	if(pattern == 1) {
	    if(moved == 0) {
	        xx= GS.idealborder[0] - 60
	        moved= 1
	    }
	    yy= obj_uborder.y
	    if(con == 0) {
	        siner= 0
	        factor= 20
	        if(draedmode == 0)
	            draw_sprite_ext(sprite_index, frame, xx + sprite_width / 2, yy + sprite_height / 2, 1, 1, 0, 16777215, 1)
	    }
	    if(xx >= -60 and con == 0) xx-= 10
	    if(xx <= -60 and con == 0) con= 1
	    if(con == 2) {
	        GS.border= 23
	        $Alarm4.start((60) / 30.0)
	        instance_create(obj_rborder.x + 10, obj_dborder.y - 122, 347/* obj_grosscupcake2 */)
	        con= 3
	    }
	    if(con == 3) {
	        siner= 0
	        if(draedmode == 0)
	            draw_sprite_ext(sprite_index, frame, xx + sprite_width / 2, yy + sprite_height / 2, 1, 1, 0, 16777215, 1)
	    }
	    if(con == 4) {
	        GS.border= 22
	        obj_purpleheart.ttype= 3
	        con= 5
	        gen= instance_create(0, 0, 352/* obj_spiderbulletgen */)
	        if(is_instance_valid(gen)) {
	            gen.dmg= dmg
	            if(obj_spiderb.turnamt == 5) gen.type= 13
	            if(obj_spiderb.turnamt == 10) {
	                gen.type= 14
	                obj_purpleheart.yadd2= 4
	            }
	            if(obj_spiderb.turnamt == 16) {
	                gen.type= 16
	                obj_purpleheart.yadd2= 5
	            }
	            gen.$Alarm0.start((60) / 30.0)
	        }
	        siner= 0
	        rotfactor= 5
	    }
	    if(con == 5) {
	        if(obj_purpleheart.yadd < 5)
	            obj_purpleheart.yadd+= 0.01
	        siner++
	        if(draedmode == 0)
	            draw_sprite_ext(sprite_index, frame, xx + sprite_width / 2, yy + sprite_height / 2, 1, 1, sin(siner / 10) * rotfactor, 16777215, 1)
	        if(GS.turntimer < 80 and rotfactor > 0) {
	            rotfactor-= 0.1
	            if(rotfactor == 0 and obj_spiderb.turnamt == 16) {
	                GS.turntimer= 370
	                con= 6
	                // obj_spiderbulletgen
	                with(352) instance_destroy()
	            }
	        }
	    }
	    if(con == 6) {
	        GS.border= 21
	        obj_heart.x= obj_purpleheart.x
	        obj_heart.y= obj_purpleheart.y
	        // obj_purpleheart
	        with(363) instance_destroy()
	        // obj_hideouscupcake
	        with(349) velocity.y= 4
	        // obj_vertspider
	        with(354) instance_destroy()
	        con= 7
	        $Alarm4.start((40) / 30.0)
	    }
	    if((con == 7 or con == 8) and obj_heart.y < obj_uborder.y + 20)
	        obj_heart.y= obj_uborder.y + 20
	    if(con == 8) {
	        // obj_hideouscupcake
	        with(349) instance_destroy()
	        obj_spiderb.con= 50
	        instance_destroy()
	    }
	    if(con == 1) {
	        xx++
	        if(xx >= 140 and not instance_exists(352/* obj_spiderbulletgen */)) {
	            // obj_spiderbulletgen
	            with(352) instance_destroy()
	        }
	        if(draedmode == 0)
	            draw_sprite_ext(sprite_index, frame, xx + sprite_width / 2, yy + sprite_height / 2 + sin(siner / 6) * factor, 1, 1, 0, 16777215, 1)
	        siner++
	        if(xx >= 160) {
	            xx= 160
	            factor-= 2
	            if(factor <= 1) {
	                factor= 0
	                con= 2
	            }
	        }
	    }
	}
	if(pattern == 2) {
	    siner++
	    if(draedmode == 0)
	        draw_sprite_ext(sprite_index, frame, xx + sprite_width / 2, yy + sprite_height / 2, 1, 1, sin(siner / 10) * 5 + rot, 16777215, 1)
	}
	drawngr= 1
	if(GS.mnfight != 2) instance_destroy()

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
