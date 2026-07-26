# Auto-converted from GameMaker: obj_bringitinguys
extends Node2D

func _ready():
	shake= 0
	guy= instance_create(-200, 300, 318/* obj_barabody */)
	guy.velocity.x= 8
	talk[0]= 0
	guy2= scr_marker(-140, 400, 161)
	guy2.z_index= guy.z_index - 1
	guy2.frame= 2
	guy2.velocity.x= 7
	talk[1]= 0
	guy3= instance_create(-220, 180, 362/* obj_spiderb_body */)
	guy3.z_index= guy.z_index + 1
	guy3.velocity.x= 9
	talk[2]= 0
	guy4= scr_marker(80, get_viewport_rect().size.y + 650, 224)
	guy4.scale.x= 2
	guy4.scale.y= 2
	guy4.z_index= guy.z_index + 2
	guy4.frame= 0
	guy4.velocity.y= -7
	guy_r= instance_create(get_viewport_rect().size.x, 280, 336/* obj_vulkinbody */)
	guy_r.parent= object_index
	guy_r.$Alarm0.start((-1) / 30.0)
	guy_r.velocity.x= -7
	talk_r[0]= 0
	guy_r2= scr_marker(get_viewport_rect().size.x + 40, 360, 314)
	guy_r2.scale.x= 2
	guy_r2.scale.y= 2
	guy_r2.velocity.x= -9
	talk_r[1]= 0
	guy_r3= scr_marker(get_viewport_rect().size.x + 50, 200, 269)
	guy_r3.scale.x= 2
	guy_r3.scale.y= 2
	guy_r3.velocity.x= -6
	guy_r3.z_index= guy_r.z_index + 2
	talk_r[2]= 0
	guy_r4= scr_marker(get_viewport_rect().size.x + 60, 100, 207)
	guy_r4.scale.x= 2
	guy_r4.scale.y= 2
	guy_r4.velocity.x= -5
	guy_r4.z_index= guy_r3.z_index + 1
	guy.x-= 700
	guy2.x-= 700
	guy3.x-= 700
	guy4.x= 80
	$Alarm1.start((110) / 30.0)
	$Alarm0.start((190) / 30.0)
	$Alarm2.start((30) / 30.0)

func _gm_event_2_2():
	if(GS.hp < GS.maxhp) {
	    GS.hp++
	    snd_play(155/* snd_heal_c */)
	}
	$Alarm2.start((12) / 30.0)

func _gm_event_2_1():
	talk_r[0]= 0
	talk_r[1]= 0
	talk_r[2]= 0
	talk_r[3]= 0

func _on_destroy():
	talk[0]= 0
	talk[1]= 0
	talk[2]= 0
	talk[3]= 0

func _gm_event_7_11():
	guy_r3.sprite_index= 268/* spr_shyren_hide */
	guy_r2.sprite_index= 316/* spr_mkid_battle_shock */
	guy_r.face= 388
	shake= 1

func _gm_event_7_10():
	guy.pause= 2
	guy_r.pause= 2
	guy3.pauser= 1
	talk[0]= 0
	talk[1]= 0
	talk[2]= 0
	talk[3]= 0
	talk_r[0]= 0
	talk_r[1]= 0
	talk_r[2]= 0
	talk_r[3]= 0
	sh[0]= guy
	sh[1]= guy2
	sh[2]= guy3
	sh[3]= guy4
	sh[4]= guy_r
	sh[5]= guy_r2
	sh[6]= guy_r3
	sh[7]= guy_r4
	i= 0
	while(i < 8) {
	    shx[i]= sh[i].x
	    shy[i]= sh[i].y
	    i++
	}

func _on_outside_room():
	if(guy.x > -32) {
	    guy.x= -34
	    guy.velocity.x= 0
	    talk[0]= 1
	}
	if(talk[0] == 1 and shake == 0) {
	    draw_sprite(19/* spr_blconsm_shrt */, 0, guy.x + 190, guy.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy.x + 220, guy.y + 10, "You can#do it!")
	}
	if(guy2.x > -24) {
	    guy2.x= -24
	    guy2.velocity.x= 0
	    talk[1]= 1
	}
	if(talk[1] == 1 and shake == 0) {
	    draw_sprite(19/* spr_blconsm_shrt */, 0, guy2.x + 90, guy2.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy2.x + 120, guy2.y + 10, "Ribbit.")
	}
	if(guy3.x > -24) {
	    guy3.x= -24
	    guy3.velocity.x= 0
	    talk[2]= 1
	}
	if(talk[2] == 1 and shake == 0) {
	    draw_sprite(19/* spr_blconsm_shrt */, 0, guy3.x + 130, guy3.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy3.x + 160, guy3.y + 10, "You\'ve#GOT to#win!")
	}
	if(guy4.y < get_viewport_rect().size.y - 60) {
	    guy4.y= get_viewport_rect().size.y - 60
	    guy4.velocity.y= 0
	}
	if(guy_r.x < get_viewport_rect().size.x - 80) {
	    guy_r.x= get_viewport_rect().size.x - 80
	    guy_r.velocity.x= 0
	    talk_r[0]= 1
	}
	if(talk_r[0] == 1 and shake == 0) {
	    draw_sprite(21/* spr_blconsm2_shrt */, 0, guy_r.x - 113, guy_r.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy_r.x - 88, guy_r.y + 10, "We\'re#with you#too!")
	}
	if(guy_r2.x < get_viewport_rect().size.x - 90) {
	    guy_r2.x= get_viewport_rect().size.x - 90
	    guy_r2.velocity.x= 0
	    talk_r[1]= 1
	}
	if(talk_r[1] == 1 and shake == 0) {
	    draw_sprite(21/* spr_blconsm2_shrt */, 0, guy_r2.x - 113, guy_r2.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy_r2.x - 88, guy_r2.y + 10, "C\'mon,#you got#this!")
	}
	if(guy_r3.x < get_viewport_rect().size.x - 90) {
	    guy_r3.x= get_viewport_rect().size.x - 90
	    guy_r3.velocity.x= 0
	    talk_r[2]= 1
	}
	if(talk_r[2] == 1 and shake == 0) {
	    draw_sprite(21/* spr_blconsm2_shrt */, 0, guy_r3.x - 113, guy_r3.y)
	    draw_set_font(4)
	    draw_set_color(0)
	    draw_text(guy_r3.x - 88, guy_r3.y + 10, "La la#la la!")
	}
	if(guy_r4.x < get_viewport_rect().size.x - 90) {
	    guy_r4.x= get_viewport_rect().size.x - 90
	    guy_r4.velocity.x= 0
	}
	if(shake > 0) {
	    shake+= 0.02
	    i= 0
	    while(i < 8) {
	        sh[i].x= shx[i] + random(shake) - random(shake)
	        sh[i].y= shy[i] + random(shake) - random(shake)
	        i++
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
