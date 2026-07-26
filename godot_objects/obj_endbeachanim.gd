# Auto-converted from GameMaker: obj_endbeachanim
extends Node2D

func _ready():
	alphys= instance_create(44, 52, 1363/* obj_npc_marker */)
	alphys.image_speed= 0.2
	alphys.sprite_index= 2432/* spr_alphys_gameboy */
	alphys.visible= 1
	alphys.z_index= z_index + 1
	headsprite= 2439
	head_index= 0
	headx= 0
	heady= 0
	image_speed= 0
	con= 0
	timer= -120
	active= 1
	shuffle= 0
	x--
	frame= 1
	crack= 0
	ctime= 0
	caster_play(GS.endsong[3], 1, 1)
	GS.inbattle= 0
	o= scr_marker(18, 175, 2428)
	o.z_index= 200000
	o.image_speed= 0.1
	r= scr_marker(113, 145, 2427)
	r.z_index= 200000
	r.image_speed= 0.25
	l= scr_marker(23, 131, 2426)
	l.z_index= 200000
	l.image_speed= 0.2

func _on_destroy():
	instance_create(x + 18, y + 13, 1697/* obj_beachdebris */)
	$Alarm0.start((8) / 30.0)
	if(crack == 0) crack= 1
	ctime++
	if(ctime > 5) crack= 2
	if(ctime > 10) crack= 3

func _on_outside_room():
	if(crack > 0)
	    draw_sprite(2430/* spr_crackedbeach */, crack - 1, x + 18, y + 13)
	draw_sprite(sprite_index, floor(frame), floor(x), floor(y))
	draw_sprite(headsprite, head_index, floor(x + headx), floor(y - 23 + heady))
	if(active == 1) timer++
	if(view_xview[0] >= 0 and timer < 20)
	    view_xview[0]-= 2
	if(timer == 0) {
	    t1= instance_create(168, 15, 1689/* obj_creditsword */)
	    t1.text= "UNDYNE"
	    t1.text2= "Design by Toby#Armor by Temmie#Fashion help:#JN Wiedle & Gigi DG"
	    t2= instance_create(168, 150, 1689/* obj_creditsword */)
	    t2.text= "ALPHYS"
	    t2.text2= "Design by Toby"
	}
	if(timer == 5) shuffle= 1
	if(timer == 25) shuffle= 0
	if(timer == 65) shuffle= 1
	if(timer == 85) shuffle= 0
	if(timer == 125) shuffle= 1
	if(timer == 145) shuffle= 0
	if(shuffle == 1) {
	    x-= 0.5
	    frame+= 0.2
	}
	if(timer == 170) head_index= 1
	if(timer == 191 or timer == 193) headx++
	if(timer == 210 or timer == 212) headx--
	if(timer == 214 or timer == 216) {
	    head_index= 2
	    headx--
	    heady++
	}
	if(timer == 216) {
	    heart= instance_create(x - 5, y - 10, 1363/* obj_npc_marker */)
	    heart.image_speed= 0.25
	    heart.visible= 1
	    heart.sprite_index= 2429/* spr_tinygayheart */
	    heart.velocity.y= -0.5
	    alphys.frame= 0
	    alphys.image_speed= 0
	}
	if(timer == 226) alphys.sprite_index= 2435/* spr_alphys_turnred */
	if(timer > 226 and timer < 246)
	    heart.modulate.a-= 0.05
	if(timer == 247) {
	    with(heart) instance_destroy()
	}
	if(timer == 246 or timer == 248) {
	    head_index= 1
	    heady--
	    headx++
	}
	if(timer >= 268 and timer <= 300) {
	    head_index= 3
	    if(alphys.frame < 16)
	        alphys.frame+= 0.5
	}
	if(timer == 320) {
	    alphys.sprite_index= 2434/* spr_alphys_shock_fall */
	    alphys.x-= 2
	}
	if(timer == 321) alphys.x-= 2
	if(timer == 322) alphys.x-= 2
	if(timer == 323) alphys.x-= 2
	if(timer == 324) alphys.x--
	if(timer == 325) alphys.x--
	if(timer == 326) alphys.x--
	if(timer == 327) alphys.x--
	if(timer >= 320 and timer <= 370)
	    draw_sprite(2433/* spr_alphys_maxdamage */, 0, alphys.x - 20, alphys.y - 20)
	if(timer == 370) {
	    headsprite= 2440
	    sprite_index= 2436/* spr_undyne_torso_tap */
	    siner= 0
	}
	if(timer >= 370 and timer <= 440) {
	    siner++
	    heady= sin(siner / 2) * 0.8
	    frame+= 0.25
	    head_index+= 0.25
	}
	if(timer == 440) {
	    frame= 0
	    headsprite= 2441
	    sprite_index= 2438/* spr_undyne_torso_hit */
	    $Alarm0.start((8) / 30.0)
	}
	if(timer >= 440) {
	    with(t1) fader= 1
	    with(t2) fader= 1
	    siner++
	    heady= sin(siner / 2) * 1.2 + 0.6
	    frame+= 0.25
	    head_index+= 0.25
	}
	if(timer >= 500) {
	    view_xview[0]+= 4
	    if(view_xview[0] >= 160) {
	        GS.cast_type= 2
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
