# Auto-converted from GameMaker: obj_ebottfadein
extends Node2D

func _ready():
	x= 120
	y= 120
	timer= 0
	image_speed= 0
	scale.x= 2
	scale.y= 2
	modulate.a= 0
	n_timer= 0
	n_index= 0
	n_alpha= 0
	n_active= 0
	offer= 0
	draw_set_alpha(1)
	caster_stop(GS.endsong[7])
	s8= caster_play(GS.endsong[8], 1, 1)
	noise= caster_load("music/f_noise.ogg")
	noise= caster_loop(noise, 0, 1)
	GS.inbattle= 1

func _process(delta: float):
	timer++
	if(timer < 150 and modulate.a < 1)
	    modulate.a+= 0.02
	if(timer == 150) {
	    sepiaebott= instance_create(x, y, 1363/* obj_npc_marker */)
	    sepiaebott.scale.x= 2
	    sepiaebott.scale.y= 2
	    sepiaebott.image_speed= 0
	    sepiaebott.frame= 1
	    sepiaebott.sprite_index= sprite_index
	    sepiaebott.z_index= z_index + 10
	    sepiaebott.visible= 1
	}
	if(timer >= 150 and timer <= 250)
	    modulate.a-= 0.01
	if(timer >= 300 and timer <= 700) {
	    offer++
	    if(offer == 4) {
	        view_yview[0]++
	        offer= 0
	    }
	}
	if(timer == 560) n_active= 1
	n_index++

func _gm_event_7_10():
	i= 0
	while(i < 4) {
	    xx= view_xview[0]
	    yy= view_yview[0]
	    draw_sprite_ext(2206/* spr_noise */, floor(n_index / 2), xx - 10 + i * 200, -10 + yy, 2, 2, 0, 16777215, n_alpha)
	    draw_sprite_ext(2206/* spr_noise */, floor(n_index / 2), xx - 10 + i * 200, 190 + yy, 2, 2, 0, 16777215, n_alpha)
	    draw_sprite_ext(2206/* spr_noise */, floor(n_index / 2), xx - 10 + i * 200, 390 + yy, 2, 2, 0, 16777215, n_alpha)
	    i++
	}

func _on_outside_room():
	draw_set_alpha(1)
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, modulate.a)
	draw_set_font(2)
	draw_set_color(16777215)
	draw_text_transformed(180, 450, "THE END", 6, 10, 0)
	if(n_timer == 7) n_alpha= 0
	if(n_timer >= 8 and n_timer <= 16) {
	    n_alpha+= 0.25
	    if(n_alpha > 0.75) n_alpha= 0.75
	    event_user(0)
	}
	if(n_timer == 19) n_alpha= 0
	if(n_timer >= 24 and n_timer <= 30) {
	    n_alpha+= 0.25
	    if(n_alpha > 0.75) n_alpha= 0.75
	    event_user(0)
	}
	if(n_timer == 40) n_alpha= 0
	if(n_timer >= 60) {
	    if(n_alpha < 1) n_alpha+= 0.25
	    event_user(0)
	}
	if(n_timer >= 140) {
	    caster_free(-3)
	    get_tree().change_scene_to_file("res://godot_rooms/284.tscn")
	}
	caster_set_volume(s8, 1 - n_alpha)
	caster_set_volume(noise, n_alpha)
	audio_sound_gain(351, 0.9, 1)
	if(n_active == 1) n_timer++

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
