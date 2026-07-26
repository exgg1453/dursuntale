# Auto-converted from GameMaker: obj_gamemenu_fake
extends Node2D

func _ready():
	selected= 65
	name= "Flowey"
	naming= 3
	selected2= 0
	selected3= 0
	q= 0
	buffer= 0
	doom= 0
	obj_screen.messed= 1

func _on_outside_room():
	draw_set_color(16777215)
	draw_set_font(10)
	minutes= 9999
	seconds= 99
	if(seconds == 60) seconds= 0
	if(seconds < 10) seconds= "0" + string(seconds)
	draw_text(70, 60, name)
	draw_text(140, 60, "LV 9999")
	draw_text(210, 60, string(minutes) + ":" + string(seconds))
	draw_text(70, 80, "My World")
	if(selected3 == 0) draw_set_color(65535)
	else  draw_set_color(16777215)
	draw_text(85, 110, "Continue")
	if(selected3 == 1) draw_set_color(65535)
	else  draw_set_color(16777215)
	draw_text(175, 110, "Restart")
	if(Input.is_action_pressed("move_right") and selected3 == 0)
	    selected3= 1
	if(Input.is_action_pressed("move_left") and selected3 == 1)
	    selected3= 0
	buffer++
	if(keyboard_multicheck_pressed(0/* NOKEY */) and selected3 == 0 and buffer > 20) {
	    caster_stop(-3)
	    room_goto_next()
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */) and selected3 == 1 and buffer > 10)
	    selected3= 0

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
