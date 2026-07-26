# Auto-converted from GameMaker: obj_maintem
extends Node2D

func _ready():
	dmg= 10
	height= 86
	length= 65
	leg1= instance_create(x + 20, y + height, 663/* obj_temleg */)
	leg2= instance_create(x + 30, y + height, 663/* obj_temleg */)
	leg2.siner= 6.28318530717959
	leg3= instance_create(x + 40 + length, y + height, 663/* obj_temleg */)
	leg4= instance_create(x + 50 + length, y + height, 663/* obj_temleg */)
	leg4.siner= 6.28318530717959
	leg3.length= 20
	leg4.length= 20
	obj_temleg.height= height
	obj_temleg.dmg= dmg - 3
	control= 0
	adjustspeed= 0.15
	siner= 0

func _process(delta: float):
	adjust= 0
	if(control == 1) {
	    if(Input.is_action_pressed("move_right")) velocity.x+= 0.2
	    if(Input.is_action_pressed("move_left")) velocity.x-= 0.2
	    if(Input.is_action_pressed("move_down") and height > 4) {
	        height--
	        y++
	    }
	    if(Input.is_action_pressed("move_up")) {
	        height++
	        y--
	    }
	    if(Input.is_action_pressed("ui_accept")) {
	        length++
	        leg3.x++
	        leg4.x++
	    }
	    if(Input.is_key_pressed(16)) {
	        length--
	        leg3.x--
	        leg4.x--
	    }
	} else  {
	    if(obj_heart.x + obj_heart.sprite_width / 2 <= (leg1.x + leg4.x) / 2) {
	        adjust= 1
	        velocity.x-= adjustspeed
	        leg1.velocity.x-= adjustspeed
	        leg2.velocity.x-= adjustspeed
	        leg3.velocity.x-= adjustspeed
	        leg4.velocity.x-= adjustspeed
	    }
	    if(obj_heart.x + obj_heart.sprite_width / 2 >= (leg1.x + leg4.x) / 2) {
	        adjust= 1
	        velocity.x+= adjustspeed
	        leg1.velocity.x+= adjustspeed
	        leg2.velocity.x+= adjustspeed
	        leg3.velocity.x+= adjustspeed
	        leg4.velocity.x+= adjustspeed
	    }
	    siner++
	    hadd= sin(siner / 10) * 0.1
	    if(abs(velocity.x) < 0.4) {
	        siner++
	        hadd*= 1.5
	    }
	    velocity.x+= hadd
	    leg1.velocity.x+= hadd
	    leg2.velocity.x+= hadd
	    leg3.velocity.x+= hadd
	    leg4.velocity.x+= hadd
	}
	if(GS.turntimer < 1) {
	    instance_destroy()
	    GS.mnfight= 3
	}
	if(collision_rectangle(x + 13, y + 36, x + 50 + length, y + 63, 743, 0, 1))
	    event_user(2)

func _gm_event_7_12():
	scr_damagestandard_x()

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(16777215)
	draw_rectangle(x + 48, y + 36, x + 50 + length, y + 62, 0)
	draw_sprite(119/* spr_temback */, frame, x + sprite_width + length, y)

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
