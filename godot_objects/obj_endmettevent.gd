# Auto-converted from GameMaker: obj_endmettevent
extends Node2D

func _ready():
	legx= 0
	legrot_r= 0
	legrot_l= 0
	bodyy= 0
	con= 0
	army= 0
	siner= 0
	leg= 0
	timer= 0
	active= 0
	main_timer= -70
	bpants= instance_create(210, 35, 1363/* obj_npc_marker */)
	bpants.sprite_index= 2457/* spr_bpants_bush */
	bpants.image_speed= 0
	bpants.visible= 1
	bpants.z_index= 1010
	dtable= instance_create(80, 60, 1363/* obj_npc_marker */)
	dtable.sprite_index= 2456/* spr_djtable */
	dtable.image_speed= 0.25
	dtable.visible= 1
	dtable.z_index= 1010
	napsta= instance_create(98, 30, 1363/* obj_npc_marker */)
	napsta.sprite_index= 1129/* spr_napstablook_d_headphone */
	napsta.image_speed= 0.25
	napsta.visible= 1
	napsta.z_index= 1011
	shyren= instance_create(70, 20, 1363/* obj_npc_marker */)
	shyren.sprite_index= 2455/* spr_shyren_overworld_sing */
	shyren.image_speed= 0.1
	shyren.visible= 1
	shyren.z_index= 1021
	$Alarm5.start((5) / 30.0)
	caster_stop(GS.endsong[3])
	caster_play(GS.endsong[5], 1, 1)
	GS.inbattle= 0

func _gm_event_2_5():
	instance_create(shyren.x + 11, shyren.y + 11, 1695/* obj_tinymusicnote */)
	$Alarm5.start((8) / 30.0)

func _on_outside_room():
	siner++
	army= sin(siner / 4) * 1.5
	x+= cos(siner / 6)
	draw_set_alpha(0.2)
	draw_set_color(0)
	draw_rectangle(-10, 100, 330, 0, 0)
	draw_set_alpha(1)
	draw_set_alpha(0.2)
	draw_set_color(0)
	draw_rectangle(-10, 80, 330, 0, 0)
	draw_set_alpha(1)
	if(leg == 0) draw_sprite(2459/* spr_mett_justwheel */, 0, x, y + sprite_height)
	if(leg == 1) {
	    draw_sprite_ext(2460/* spr_mett_justleg */, 0, x + 3 + legx, y + 17, 1, 1, legrot_r, 16777215, 1)
	    draw_sprite_ext(2460/* spr_mett_justleg */, 0, x - 2 + legx, y + 17, -1, 1, legrot_l, 16777215, 1)
	    legx= sin(siner / 4)
	}
	draw_sprite_ext(2458/* spr_mett_justarm */, 0, x + 13, y + 9 + army + bodyy, 1, 1, 0, 16777215, 1)
	draw_sprite_ext(2458/* spr_mett_justarm */, 0, x - 12, y + 9 - army + bodyy, -1, 1, 0, 16777215, 1)
	draw_sprite(sprite_index, floor(siner / 6), x, y + bodyy)
	if(active == 1) timer++
	if(timer >= 5 and timer <= 35 and bodyy < 13)
	    bodyy+= 0.5
	if(timer >= 80) {
	    leg= 1
	    if(bodyy > -15) bodyy-= 0.5
	}
	if(timer >= 120 and timer <= 126)
	    legrot_l-= 8
	if(timer >= 132 and timer <= 138)
	    legrot_l+= 8
	if(timer >= 146 and timer <= 152)
	    legrot_r+= 8
	if(timer >= 158 and timer <= 164)
	    legrot_r-= 8
	if(timer == 170) timer= 119
	main_timer++
	if(main_timer >= 40 and main_timer <= 160) {
	    tile_layer_shift(900, -1, 0)
	    tile_layer_shift(890, 1, 0)
	}
	if(main_timer == 180) active= 1
	shyren.y+= sin(siner / 4)
	if(main_timer < 0) {
	    if(view_yview[0] > 0) view_yview[0]-= 4
	    else  view_yview[0]= 0
	}
	if(main_timer == 90) {
	    t1= instance_create(20, 160, 1689/* obj_creditsword */)
	    t1.text= "METTATON"
	    t1.text2= "by Toby"
	}
	if(main_timer == 250) t1.fader= 1
	if(main_timer == 260) {
	    t2= instance_create(20, 160, 1689/* obj_creditsword */)
	    t2.text= "SPECIAL INSPIRATION"
	    t2.text2= "Bob Sparker, Sarah, and JN Wiedle"
	}
	if(main_timer == 430) t2.fader= 1
	if(main_timer > 450) {
	    view_yview[0]+= 4
	    if(view_yview[0] > 240) {
	        GS.cast_type= 3
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
