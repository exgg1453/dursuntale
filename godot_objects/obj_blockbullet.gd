# Auto-converted from GameMaker: obj_blockbullet
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	site= choose(0, 1, 2, 3)
	down= 0
	image_speed= 0
	countdown= instance_number(object_index)
	if(countdown <= 1) frame= 1
	speedmod= 1
	alphoid= 0
	modulate.a= 0
	object0= 263
	dmg= 7

func _on_destroy():
	if(site == 0) {
	    x= object0.x - 300
	    y= object0.y
	}
	if(site == 1) {
	    x= object0.x + 300
	    y= object0.y
	}
	if(site == 2) {
	    x= object0.x
	    y= object0.y + 300
	}
	if(site == 3) {
	    x= object0.x
	    y= object0.y - 300
	}
	move_towards_point(object0.x, object0.y, 8 * speedmod)

func _process(delta: float):
	if(down == 1) {
	    countdown--
	    down= 0
	}
	if(countdown <= 1) frame= 1
	if(alphoid < 1) alphoid+= 0.2
	modulate.a= alphoid

func _on_outside_room():
	if(velocity.x > 0)
	    draw_sprite_ext(134/* spr_bullet_test_l */, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	if(velocity.x < 0)
	    draw_sprite_ext(135/* spr_bullet_test_r */, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	if(velocity.y > 0)
	    draw_sprite_ext(137/* spr_bullet_test_d */, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	if(velocity.y < 0)
	    draw_sprite_ext(136/* spr_bullet_test_u */, frame, x, y, 1, 1, 0, 16777215, modulate.a)

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
