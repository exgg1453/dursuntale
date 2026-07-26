# Auto-converted from GameMaker: obj_mneo_body
extends Node2D

func _ready():
	siner= 0
	GS.faceemotion= 0
	burston= 1
	pause= 0
	fadewhite= 0
	whiteval= 0
	shake= 0
	xnow= x
	ynow= y

func _gm_event_7_10():
	shake= 1
	xnow= x
	ynow= y

func _on_outside_room():
	if(pause == 0) siner++
	else  siner= 0
	if(burston == 1) {
	    draw_sprite_ext(574/* spr_mneo_burst */, 0, x - 24, y + 18 + sin(siner / 3) * 1, -2, 2, sin(siner / 6) * 2, 16777215, abs(sin(siner * 0.3)) * 0.5 + 0.4)
	    draw_sprite_ext(574/* spr_mneo_burst */, 0, x + 28, y + 18 + sin(siner / 3) * 1, 2, 2, -sin(siner / 6) * 2, 16777215, abs(sin(siner * 0.3)) * 0.5 + 0.4)
	}
	draw_sprite_ext(575/* spr_mneo_legs */, 0, x, y + 84 + 112, 2, 2 - sin(siner / 3) * 0.05, 0, 16777215, 1)
	draw_sprite_ext(572/* spr_mneo_armr */, 0, x + 40 + sin(siner / 3) * 2, y + 40, 2, 2, sin(siner / 6) * 2, 16777215, 1)
	draw_sprite_ext(573/* spr_mneo_arml */, 0, x - 26 - sin(siner / 3) * 2, y + 40, 2, 2, -sin(siner / 6) * 2, 16777215, 1)
	draw_sprite_ext(571/* spr_mneo_body */, 0, x + 4, y + 36 + sin(siner / 3) * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(570/* spr_mneo_face */, GS.faceemotion, x, y + sin(siner / 3) * 3, 2, 2, 0, 16777215, 1)
	if(fadewhite == 1) {
	    z_index= -999999
	    whiteval+= 0.2
	    draw_set_alpha(whiteval)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    if(whiteval > 10) {
	        draw_set_alpha(-1 + whiteval / 10)
	        draw_set_color(0)
	        draw_rectangle(-10, -10, 999, 999, 0)
	    }
	    if(whiteval == 10 and GS.flag[425] == 1) snd_play(91/* snd_vaporized */)
	    draw_set_alpha(1)
	    if(whiteval >= 44) {
	        instance_create(0, 0, 148/* obj_persistentfader */)
	        room_goto(GS.currentroom)
	    }
	}
	if(shake == 1) {
	    x= xnow + random(2) - random(2)
	    y= ynow + random(2) - random(2)
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
