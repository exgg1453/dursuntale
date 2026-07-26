# Auto-converted from GameMaker: obj_spearbullet_follow
extends Node2D

func _ready():
	rotspeed= 32
	x= obj_heart.x - 4 + random(8)
	y= obj_heart.y - 4 + random(8)
	modulate.a= 0
	snd_play(13/* snd_spearappear */)
	offsetdir= point_direction(x, y, obj_heart.x, obj_heart.y)
	x+= lengthdir_x(140, offsetdir)
	y+= lengthdir_y(140, offsetdir)
	direction= offsetdir
	speed= 4
	friction= 0.2
	dmg= 7
	deactivate= 0
	if(instance_exists(282/* obj_undyne_ex */)) dmg= 11

func _process(delta: float):
	modulate.a+= 0.05
	rotation_degrees-= rotspeed
	if(rotspeed > 0) rotspeed--
	if(rotspeed == 0 and speed < 1) {
	    snd_play(20/* snd_arrow */)
	    move_towards_point(obj_heart.x + 10, obj_heart.y + 10, 3)
	    friction= -0.3
	    rotation_degrees= direction
	}
	xoff= lengthdir_x(25, direction)
	yoff= lengthdir_y(25, direction)
	if(rotspeed == 0 and deactivate == 0 and collision_line(x - xoff / 2, y - yoff / 2, x + xoff, y + yoff, 743, 1, 0))
	    scr_damagestandard_x()
	if(deactivate == 1) {
	    modulate.a-= 0.1
	    if(modulate.a <= 0) instance_destroy()
	}

func _gm_event_7_0():
	instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)
	if(rotspeed == 0) {
	    xoff= lengthdir_x(25, direction)
	    yoff= lengthdir_y(25, direction)
	    draw_line(x - xoff / 2, y - yoff / 2, x + xoff, y + yoff)
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
