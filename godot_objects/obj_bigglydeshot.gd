# Auto-converted from GameMaker: obj_bigglydeshot
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	siner= 0
	modulate.a= 0.5
	scale.x= 0
	scale.y= 0
	aa= choose(2, -2)
	direction= 300 - random(60)
	$Alarm8.start((20) / 30.0)
	breaking= 0
	talpha= 0
	tab= 0
	phrase= choose("COOL", "VIBIN", "RAD", "NICEY", "SPICEY", "SWEET", "SICK")
	dmg= 9
	if(instance_exists(228/* obj_glydeb */))
	    dmg= GS.monsteratk[obj_glydeb.myself]

func _gm_event_2_8():
	move_towards_point(obj_heart.x + 8, obj_heart.y + 8, 9)
	i= 0
	while(i < 5) {
	    gl= instance_create(x, y, 225/* obj_glydeshot */)
	    if(is_instance_valid(gl))
	        gl.direction= direction - 28 + i * 14
	    i++
	}
	i= 0
	while(i < 5) {
	    gl= instance_create(x, y, 225/* obj_glydeshot */)
	    if(is_instance_valid(gl)) {
	        gl.direction= direction - 28 + i * 14
	        gl.speed-= 1.5
	    }
	    i++
	}
	i= 0
	while(i < 5) {
	    gl= instance_create(x, y, 225/* obj_glydeshot */)
	    if(is_instance_valid(gl)) {
	        gl.direction= direction - 28 + i * 14
	        gl.speed-= 3
	    }
	    i++
	}
	// obj_glydeshot
	with(225) friction= 0

func _on_alarm_0_timeout():
	if(modulate.a >= 0.95) scr_damagestandard(0, 0, 0, 0, 0)

func _on_outside_room():
	siner++
	if(speed > 0) rotation_degrees+= aa
	if(breaking == 0) {
	    draw_sprite_ext(241/* spr_glydeshot */, 0, x, y, scale.x, scale.y, rotation_degrees, image_blend, 0.7 + sin(siner / 3))
	    draw_sprite_ext(241/* spr_glydeshot */, 1, x, y, scale.x, scale.y, rotation_degrees + 45, image_blend, -sin(siner / 3) + 0.7)
	}
	if(scale.x < 10) {
	    x+= sin(siner) * scale.x / 2
	    y+= cos(siner) * scale.x / 2
	    if(modulate.a < 1) modulate.a+= 0.05
	    scale.x+= 0.5
	    scale.y+= 0.5
	}
	if(y > GS.idealborder[3] - 20 and breaking == 0) {
	    breaking= 1
	    snd_play(142/* snd_shakerbreaker */)
	}
	if(breaking == 1)
	    draw_sprite_ext(241/* spr_glydeshot */, 0, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(breaking == 1) {
	    speed= 0
	    tab+= 0.1
	    if(talpha < 1) talpha+= 0.2
	    modulate.a-= 0.05
	    scale.x+= 0.5
	    scale.y+= 0.5
	    true_tab= 0
	    if(talpha >= 1) true_tab= tab - 0.5
	    draw_set_color(255)
	    draw_set_font(1)
	    draw_set_alpha(talpha - true_tab)
	    draw_text_transformed(x - 20 - talpha * 40 + random(2) - random(2), y - 10 + random(2) - random(2) - 10 - talpha * 10, phrase, talpha * 2, talpha * 2, 1 + talpha)
	    draw_set_alpha(1)
	    if(modulate.a < -1) instance_destroy()
	}
	if(GS.turntimer < 1) instance_destroy()

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
