# Auto-converted from GameMaker: obj_the_end_really
extends Node2D

func _ready():
	death= 0
	if(file_exists("system_information_963")) death= 1
	type= 0
	dogamt= 0
	if(GS.flag[512] == 1) type= 1
	if(type == 0) noise= caster_load("music/intronoise.ogg")
	song= caster_load("music/musicbox.ogg")
	timer= 0
	photo_alpha= 0
	ini_open("undertale.ini")
	curf= ini_read_real("EndF", "EndF", 0)
	if(curf == 0) ini_write_real("EndF", "EndF", 1)
	ini_close()

func _on_outside_room():
	timer++
	if(type == 0) {
	    draw_sprite_ext(0/* spr_undertaletitle */, 0, 0, -60, 2, 2, 0, 16777215, 2)
	    if(timer == 1) caster_play(noise, 1, 1)
	}
	if(type == 1) {
	    if(photo_alpha <= 1) photo_alpha+= 0.04
	    draw_sprite_ext(2467/* spr_friendphoto */, 0, 140, 50, 2, 2, 0, 16777215, photo_alpha)
	    if(death == 1)
	        draw_sprite_ext(2468/* spr_charaphoto */, 0, 140, 50, 2, 2, 0, 16777215, photo_alpha)
	}
	if(timer >= 120) {
	    draw_set_color(16777215)
	    draw_set_font(2)
	    if(death == 1) draw_set_color(255)
	    if(type == 0) draw_text_transformed(205, 260, "THE END", 5, 4, 0)
	    if(type == 1) draw_text_transformed(205, 300, "THE END", 5, 4, 0)
	}
	if(timer >= 200 and dogamt == 0) {
	    dogamt= 1
	    if(death == 0) caster_loop(song, 0.9, 0.9)
	    if(death == 1) caster_loop(217, 1, 0.2)
	}
	if(timer >= 220 and death == 1) timer= 210
	if(timer >= 1320 and dogamt < 2) {
	    dogamt= 2
	    dog= instance_create(640, 380, 1363/* obj_npc_marker */)
	    dog.z_index= -4
	    if(type == 1) dog.y= 420
	    dog.image_speed= 0.2
	    dog.visible= 1
	    dog.sprite_index= 1520/* spr_tobdogl */
	    dog.velocity.x= -1
	    dog.scale.x= 2
	    dog.scale.y= 2
	}
	if(timer >= 1668 and dogamt < 3) {
	    dogamt= 3
	    dog.velocity.x= 0
	    dog.sprite_index= 1523/* spr_tobdogl_still */
	    dog.image_speed= 0.05
	}
	if(timer >= 3686 and dogamt < 4) {
	    dogamt= 4
	    dog.sprite_index= 85/* spr_sleepdog */
	    dog.y+= 8
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
