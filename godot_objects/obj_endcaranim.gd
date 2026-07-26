# Auto-converted from GameMaker: obj_endcaranim
extends Node2D

func _ready():
	cary= 0
	car_index= 0
	siner= 0
	image_speed= 0.5
	bgx= 0
	x= -150
	velocity.x= 2
	sans= instance_create(-420, 100, 1363/* obj_npc_marker */)
	sans.sprite_index= 2447/* spr_sans_trike */
	sans.image_speed= 0.5
	sans.visible= 1
	sans.velocity.x= 2
	birb= scr_marker(-100, 10, 1596)
	birb.z_index= 1100000
	birb.velocity.x= 2
	birb.image_speed= 0.2
	birb.scale.x= -1
	timer= 0
	td= 0
	caster_play(429, 1, 1)
	GS.inbattle= 0

func _on_outside_room():
	siner++
	cary= sin(siner / 2)
	background_x[1]-= 0.25
	background_x[0]-= 0.1
	draw_sprite(2445/* spr_papcar_back */, frame, x - 20, y + 8 + cary)
	draw_sprite(2443/* spr_papcar_shadow */, floor(siner / 2), x - 20, y + 8)
	draw_sprite_part(sprite_index, floor(frame), 0, 0, sprite_width, 34, x, y)
	draw_sprite(2444/* spr_papcar_tires */, floor(siner / 2), x - 20, y + 8)
	draw_sprite(2442/* spr_papcar_chassis */, frame, x - 20, y + 8 + cary)
	if(timer < 5) {
	    if(view_yview[0] > 0) view_yview[0]-= 3
	    else  view_yview[0]= 0
	}
	bgx-= 4
	tile_layer_shift(1000000, -4, 0)
	if(bgx <= -320) {
	    tile_layer_shift(1000000, 320, 0)
	    bgx+= 320
	}
	if(x >= 0 and td == 0) {
	    t1= instance_create(20, 150, 1689/* obj_creditsword */)
	    t1.text= "PAPYRUS"
	    t1.text2= "by Toby&Temmie"
	    td= 1
	}
	if(x >= xstart and timer < 170) {
	    x= xstart
	    velocity.x= 0
	}
	if(sans.x > 0 and td == 1) {
	    t2= instance_create(180, 150, 1689/* obj_creditsword */)
	    t2.text= "SANS"
	    t2.text2= "by Toby"
	    td= 2
	}
	if(sans.x >= x) {
	    sans.sprite_index= 2448/* spr_sans_trike_wink */
	    if(timer < 60) sans.velocity.x= 0
	    else  sans.velocity.x= 2
	    timer++
	}
	if(sans.x > x + 40) {
	    if(td == 2) {
	        t1.fader= 1
	        t2.fader= 1
	        t3= instance_create(20, 150, 1689/* obj_creditsword */)
	        t3.text= "SPECIAL INSPIRATION"
	        t3.text2= "JN Wiedle"
	        td= 3
	    }
	    sans.sprite_index= 2447/* spr_sans_trike */
	    if(sans.y > 60) sans.y-= 3
	    else  sprite_index= 1308/* spr_papyrus_mad1 */
	}
	if(timer == 200) {
	    gravity_direction= 355
	    gravity= 0.3
	    velocity.x= -3
	}
	if(timer > 200) siner++
	if(timer > 240 and td == 3) {
	    t3.fader= 1
	    td= 4
	}
	if(timer >= 260) {
	    view_yview[0]+= 4
	    if(view_yview[0] >= 200) {
	        GS.cast_type= 1
	        get_tree().change_scene_to_file("res://godot_rooms/278.tscn")
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
