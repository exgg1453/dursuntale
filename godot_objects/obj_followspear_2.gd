# Auto-converted from GameMaker: obj_followspear_2
extends Node2D

func _ready():
	rotspeed= 38
	modulate.a= 0
	offsetdir= point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8)
	rotation_degrees= offsetdir + 20
	direction= offsetdir
	speed= 4
	friction= 0.2
	dmg= 11
	deactivate= 0
	timer= 0
	fade= 0

func _process(delta: float):
	modulate.a+= 0.05
	rotation_degrees-= rotspeed
	if(rotspeed > 0) rotspeed-= 2
	if(rotspeed == 0 and speed < 1) {
	    timer++
	    if(timer == 5) {
	        speed= 8
	        friction= -0.3
	        direction= rotation_degrees
	        rotation_degrees= direction
	    }
	}
	if(fade == 1 and speed >= 7) {
	    timer++
	    if(timer >= 22) deactivate= 1
	}
	xoff= lengthdir_x(25, direction)
	yoff= lengthdir_y(25, direction)
	if(rotspeed == 0 and deactivate == 0 and collision_line(x - xoff / 2, y - yoff / 2, x + xoff, y + yoff, 743, 1, 0)) {
	    if(GS.hp > 1) {
	        scr_damagestandard_x()
	        if(GS.hp <= 0) GS.hp= 1
	    } else  GS.hp= 0
	}
	if(deactivate == 1) {
	    modulate.a-= 0.25
	    if(modulate.a <= 0) instance_destroy()
	}
	if(GS.turntimer < 1) instance_destroy()

func _gm_event_7_0():
	instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)

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
