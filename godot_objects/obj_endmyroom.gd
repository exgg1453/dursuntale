# Auto-converted from GameMaker: obj_endmyroom
extends Node2D

func _ready():
	timer= -30
	death= 0
	if(file_exists("system_information_963")) death= 1
	doreground= instance_create(x, y, 1363/* obj_npc_marker */)
	doreground.sprite_index= 2464/* spr_myroom_doreground */
	doreground.visible= 1
	doreground.z_index= 500
	fix= 0
	frame= 0
	image_speed= 0
	dooropen= caster_load("music/end/dooropen.ogg")
	crickets= caster_load("music/end/crickets.ogg")
	doorclose= caster_load("music/end/doorclose.ogg")
	caster_loop(crickets, 1, 0.9)
	GS.inbattle= 0

func _process(delta: float):
	timer++
	if(timer == 60) {
	    caster_play(dooropen, 0.6, 1)
	    frame= 1
	    tor= instance_create(34, 86, 1363/* obj_npc_marker */)
	    tor.sprite_index= 2462/* spr_toriel_r_holdthing */
	    tor.image_speed= 0
	    tor.visible= 1
	    tor.z_index= 1000
	    bl= merge_color(8421504, 8388608, 0.5)
	    bl2= merge_color(bl, 16777215, 0.4)
	    tor.image_blend= bl2
	    pie= instance_create(tor.x + 18, tor.y + 24, 1363/* obj_npc_marker */)
	    pie.sprite_index= 1162/* spr_pieslice */
	    pie.image_blend= bl2
	    pie.visible= 1
	    pie.z_index= 999
	}
	if(timer == 150) {
	    tor.image_speed= 0.1
	    tor.velocity.x= 1
	    pie.velocity.x= 1
	}
	if(timer == 240) {
	    tor.frame= 0
	    tor.image_speed= 0
	    tor.velocity.x= 0
	    pie.velocity.x= 0
	}
	if(timer == 290) {
	    tor.sprite_index= 2463/* spr_toriel_r_placething */
	    pie.x= tor.x + 28
	    pie.y= tor.y + 40
	}
	if(timer == 330) tor.sprite_index= 1107/* spr_toriel_r */
	if(timer == 390) {
	    tor.velocity.x= -1
	    tor.image_speed= 0.1
	}
	if(timer == 410) {
	    tor.velocity.x= 0
	    tor.image_speed= 0
	    tor.frame= 0
	}
	if(timer == 460) {
	    tor.velocity.x= -1
	    tor.image_speed= 0.1
	    tor.sprite_index= 1108/* spr_toriel_l */
	}
	if(timer == 530) {
	    tor.velocity.x= 0
	    tor.image_speed= 0
	    tor.frame= 0
	}
	if(timer == 560) tor.sprite_index= 1107/* spr_toriel_r */
	if(timer == 640 and death == 0) {
	    caster_play(doorclose, 0.8, 1)
	    caster_stop(crickets)
	    z_index= -9000
	}
	if(timer == 760 and death == 0) get_tree().change_scene_to_file("res://godot_rooms/286.tscn")
	if(timer == 640 and death == 1) {
	    tor.visible= 0
	    caster_play(doorclose, 0.8, 1)
	    caster_stop(crickets)
	    frame= 0
	}
	if(timer == 760 and death == 1) {
	    charaface= scr_marker(228, 101, 652)
	    eyeflash= scr_marker(234, 109, 632)
	    eyeflash.z_index= -2
	    eyeflash.image_speed= 0.25
	    caster_play(327, 1, 0.5)
	}
	if(death == 1 and timer >= 760 and is_instance_valid(eyeflash) and eyeflash.frame >= 5) {
	    with(eyeflash) instance_destroy()
	}
	if(death == 1 and timer == 850) {
	    z_index= -9999
	    caster_play(349, 1, 0.75)
	}
	if(death == 1 and timer == 1150) {
	    caster_free(-3)
	    get_tree().change_scene_to_file("res://godot_rooms/286.tscn")
	}

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(timer >= 640 and death == 0) {
	    z_index= -90000
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
	}
	if(death == 1 and timer >= 850) {
	    z_index= -90000
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
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
