# Auto-converted from GameMaker: obj_wizardbody
extends Node2D

func _ready():
	siner= 0
	height= 0
	$Alarm0.start((4) / 30.0)
	pause= 0
	offx= 70
	pp= 0
	exist= 0

func _on_destroy():
	if(exist < 10) {
	    $Alarm0.start((5) / 30.0)
	    instance_create(offx + x + 46 + random(18), y - 10 + som * 4 - random(6), 367/* obj_orbsprinkle */)
	    instance_create(offx + x - 66 + random(18), y + som * 4 - random(6), 367/* obj_orbsprinkle */)
	}
	if(exist >= 10) {
	    $Alarm0.start((5) / 30.0)
	    if(parent.stare2 == 0)
	        instance_create(offx + x + 46 + random(18), y - 10 + som * 4 - random(6), 367/* obj_orbsprinkle */)
	    if(parent.stare1 == 0)
	        instance_create(offx + x - 66 + random(18), y + som * 4 - random(6), 367/* obj_orbsprinkle */)
	}

func _on_outside_room():
	sam= sin(siner / 5)
	sim= cos(siner / 5)
	som= sin(siner / 2.5)
	draw_sprite_ext(442/* spr_wizard_boot */, 0, offx + x - 23 - sin(siner / 5) * 5, y + 80 - sin(siner / 5) * 6, 2, 2, -40 - sin(siner / 5) * 10, 16777215, 1)
	draw_sprite_ext(442/* spr_wizard_boot */, 0, offx + x + 19 + sin(siner / 5) * 5, y + 80 - sin(siner / 5) * 6, -2, 2, 40 + sin(siner / 5) * 10, 16777215, 1)
	draw_sprite_ext(444/* spr_wizard_lapel */, 0, offx + x - 2, y + 52 + sam, 2, 2, -sam * 10, 16777215, 1)
	draw_sprite_ext(444/* spr_wizard_lapel */, 0, offx + x - 2, y + 52 + sam, -2, 2, sam * 10, 16777215, 1)
	draw_sprite_ext(443/* spr_wizard_dress */, 0, offx + x - 34, y + 52 + sam, 2, 1.8 - sam * 0.2, 0, 16777215, 1)
	if(pause == 0)
	    draw_sprite_ext(445/* spr_wizard_head */, 0, offx + x - 6 + sam, y + 2 + sam * 8, 2, 2, 0, 16777215, 1)
	if(pause == 1)
	    draw_sprite_ext(446/* spr_wizard_headhurt */, 0, offx + x - 6 + sam, y + 2 + sam * 8, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(447/* spr_wizard_hat */, 0, offx + x + 2 + sim, y + 4 + sam * 10, 2, 2, 0, 16777215, 1)
	exist++
	if(exist < 10) {
	    if(pause == 0) orbspr= 438
	    if(pause == 1) orbspr= 439
	    draw_sprite_ext(orbspr, siner / 3, offx + x - 44, y + 16 + som * 2, -2, -2, 0, 16777215, 1)
	    draw_sprite_ext(orbspr, siner / 3, offx + x + 70, y + 6 + som * 5, -2, -2, 0, 16777215, 1)
	}
	if(exist >= 10) {
	    if(pause == 0) orbspr= 438
	    if(pause == 1) orbspr= 439
	    if(parent.stare1 == 0)
	        draw_sprite_ext(orbspr, siner / 3, offx + x - 44, y + 16 + som * 2, -2, -2, 0, 16777215, 1)
	    else 
	        draw_sprite_ext(orbspr, siner / exist, offx + x - 44, y + 16 + som * 2 / exist, -2, -2, 0, 16777215, 1)
	    if(parent.stare2 == 0)
	        draw_sprite_ext(orbspr, siner / 3, offx + x + 70, y + 6 + som * 5, -2, -2, 0, 16777215, 1)
	    else 
	        draw_sprite_ext(orbspr, siner / exist, offx + x + 70, y + 6 + som * 5 / exist, -2, -2, 0, 16777215, 1)
	}
	siner++
	if(pause == 1) {
	    alarm[0]++
	    siner= 0
	    x= parent.x + 2
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
