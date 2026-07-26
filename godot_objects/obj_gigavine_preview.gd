# Auto-converted from GameMaker: obj_gigavine_preview
extends Node2D

func _ready():
	visible= 1
	onoff= 0
	nowtime= 0
	maxtime= 7
	xx= obj_vsflowey_heart.x + 8
	yy= obj_vsflowey_heart.y + 8
	direction= point_direction(x, y, xx, yy)
	rotation_degrees= direction
	memorymode= 0
	active= 1
	saved= 0
	snd_play(163/* mus_sfx_a_target */)

func _gm_event_7_15():
	if(saved == 0) instance_destroy()
	else  {
	    nowtime= save_nowtime
	    active= save_active
	    visible= save_visible
	}

func _gm_event_7_14():
	save_nowtime= nowtime
	save_active= active
	save_visible= visible
	if(save_visible == 0) instance_destroy()
	saved= 1

func _on_outside_room():
	if(active == 1) {
	    onoff++
	    if(onoff > 2) onoff= 0
	    if(onoff == 0) draw_set_color(255)
	    if(onoff == 1) draw_set_color(4235519)
	    if(onoff == 2) draw_set_color(65535)
	    xxl= lengthdir_x(600, direction)
	    yyl= lengthdir_y(600, direction)
	    draw_line_width(x - 8, y, x + xxl - 8, y + yyl, 2)
	    draw_line_width(x + 8, y, x + xxl + 8, y + yyl, 2)
	    nowtime++
	    if(nowtime > maxtime) {
	        rotation_degrees= direction
	        gv= instance_create(x, y, 1637/* obj_gigavine */)
	        gv.memorymode= memorymode
	        gv.rotation_degrees= rotation_degrees
	        if(memorymode == 0) instance_destroy()
	        else  {
	            active= 0
	            visible= 0
	        }
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
