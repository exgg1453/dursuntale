# Auto-converted from GameMaker: obj_doodlebug_body
extends Node2D

func _ready():
	siner= 0
	boat= 0
	fight= 0
	f_timer= 0
	pause= 0

func _gm_event_7_10():
	snd_stop(142)
	snd_play(142/* snd_shakerbreaker */)
	instance_create(x + 50, y + 50, 452/* obj_doodleball */)

func _on_outside_room():
	siner++
	draw_sprite_ext(581/* spr_doodleleg */, floor(siner / 6), x + 26, y + 84, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(579/* spr_doodlebug */, floor(siner / 6), x, y - sin(siner / 16) * 4, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(577/* spr_doodlearm */, floor(siner / 6), x - 16, y + 50 + sin(siner / 16) * 10, 2, 2, 0, 16777215, modulate.a)
	draw_sprite_ext(577/* spr_doodlearm */, floor(siner / 6), x + 106, y + 50 + sin(siner / 16) * 10, -2, 2, 0, 16777215, modulate.a)
	if(boat >= 1)
	    draw_sprite_ext(578/* spr_doodleboat */, floor(siner / 6), x, y - sin(siner / 16) * 4 + 20, 2, 2, 0, 16777215, modulate.a)
	if(boat == 2) {
	    if(x < 320) velocity.x= -5
	    else  velocity.x= 5
	}
	if(fight == 1) {
	    if(instance_number(453) > 1) {
	        if(f_timer == 0) event_user(0)
	        if(f_timer == 60) {
	            event_user(0)
	            f_timer= -1
	            fight= 0
	        }
	    } else  {
	        if(f_timer == 0) event_user(0)
	        if(f_timer == 10) event_user(0)
	        if(f_timer == 20) {
	            event_user(0)
	            f_timer= -1
	            fight= 0
	        }
	    }
	    f_timer++
	}
	if(x < -120) instance_destroy()
	if(x > 800) instance_destroy()

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
