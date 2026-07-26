# Auto-converted from GameMaker: blt_laser
extends Node2D

func _ready():
	mydirection= GS.bulletvariable[0]
	mydirectionalspeed= GS.bulletvariable[1]
	twdsX= GS.bulletvariable[2]
	twdsY= GS.bulletvariable[3]
	owngravity= GS.bulletvariable[4]
	owngravity_direction= GS.bulletvariable[5]
	friction= GS.bulletvariable[6]
	twdsXspeed= GS.bulletvariable[7]
	twdsYspeed= GS.bulletvariable[8]
	gravityincrement= 0
	action_set_motion(mydirection, mydirectionalspeed)
	if(sprite_index == 157) image_speed= 0

func _process(delta: float):
	if(GS.turntimer < 1) instance_destroy()
	gravityincrement++

func _gm_event_7_0():
	queue_free()

func _on_outside_room():
	draw_set_color(255)
	twdsXspeed+= owngravity * gravityincrement
	if(collision_line(x, y, twdsX, twdsY, 743, 0, 1))
	    draw_set_color(32768)
	if(collision_line(x, y, twdsX + twdsXspeed, twdsY + twdsYspeed, 743, 0, 1))
	    draw_set_color(32768)
	draw_triangle(x, y, twdsX, twdsY, twdsX + twdsXspeed, twdsY + twdsYspeed, 0)
	twdsX+= twdsXspeed
	twdsY+= twdsYspeed

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
