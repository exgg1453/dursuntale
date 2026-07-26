# Auto-converted from GameMaker: obj_labfog
extends Node2D

func _ready():
	xx= 0
	yy= 0
	xxspeed= 0.5
	yyspeed= 0.25
	modulate.a= 0.25
	sprite_index= 2142/* spr_labfog */
	if(room == 260) modulate.a= 0.6
	if(room == 258) modulate.a= 1
	if(GS.flag[490] == 1) modulate.a= 0

func _gm_event_7_5():
	caster_free(fansfx)
	if(room == 260) caster_resume(GS.currentsong)

func _gm_event_7_4():
	fansfx= caster_load("music/deeploop2.ogg")
	if(GS.flag[490] == 1) {
	    if(room == 260) caster_loop(fansfx, 0.5, 3)
	    if(room == 258) caster_loop(fansfx, 0.3, 3)
	}
	if(room == 260) caster_pause(GS.currentsong)

func _on_outside_room():
	xx+= xxspeed
	yy+= yyspeed
	if(xx > view_xview[0] + 200)
	    xx-= sprite_width
	if(xx < view_xview[0] - 200)
	    xx+= sprite_width
	if(yy > view_yview[0] + 200)
	    yy-= sprite_height
	if(yy < view_yview[0] - 200)
	    yy+= sprite_height
	draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx - sprite_width, yy - sprite_height, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx + sprite_width, yy - sprite_height, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx - sprite_width, yy + sprite_height, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx + sprite_width, yy + sprite_height, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx + sprite_width, yy, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx - sprite_width, yy, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx, yy + sprite_height, 1, 1, 0, 16777215, modulate.a)
	draw_sprite_ext(sprite_index, 0, xx, yy - sprite_height, 1, 1, 0, 16777215, modulate.a)
	if(modulate.a == 1 and instance_exists(1570/* obj_mainchara */))
	    draw_sprite_ext(obj_mainchara.sprite_index, obj_mainchara.frame, obj_mainchara.x, obj_mainchara.y, 1, 1, 0, 0, 0.3)

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
