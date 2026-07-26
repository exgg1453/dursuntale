# Auto-converted from GameMaker: obj_mettleg_l
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	xinit= x
	anim= 0
	on= 1
	xm= 0
	s= 0
	sf= 30
	sp= 6
	velocity.y= 3
	$Alarm0.start((1) / 30.0)
	visible= 0
	c= 0

func _on_destroy():
	s= sp * 3.14159265358979 / 2
	if(c == 0) {
	    xinit-= sin(s / sp) * sf
	    x= xinit + sin(s / sp) * sf
	}
	if(c == 1) {
	    xinit-= cos(s / sp) * sf
	    x= xinit + cos(s / sp) * sf
	}
	if(c == 2) {
	    s= -sp * 3.14159265358979 / 2
	    xinit+= sin(s / sp) * sf
	    x= xinit + sin(s / sp) * sf
	    c= 0
	}
	visible= 1

func _on_alarm_0_timeout():
	event_user(11)

func _on_outside_room():
	anim+= 0.25
	if(on == 0) image_blend= 16777215
	if(on == 1) image_blend= 65535
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	if(collision_rectangle(x, y + 1, x + sprite_width - 5, y + 20, 739, 0, 1)) {
	    g= collision_rectangle(x, y + 1, x + sprite_width - 5, y + 20, 739, 0, 1)
	    with(g) instance_destroy()
	    if(instance_exists(402/* obj_ratingsmaster */)) {
	        snd_play(110/* snd_swallow */)
	        GS.ratings+= 5
	    }
	    if(on == 0) on= 1
	    else  on= 0
	}
	if(on == 1) {
	    s--
	    if(c == 0) x= xinit + sin(s / sp) * sf
	    if(c == 1) x= xinit + cos(s / sp) * sf
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
