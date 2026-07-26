# Auto-converted from GameMaker: obj_temleg
extends Node2D

func _ready():
	control= 0
	siner= 0
	move= 0
	height= 60
	dmg= 0

func _process(delta: float):
	if(control == 1) {
	    if(Input.is_action_pressed("move_right")) velocity.x+= 0.2
	    if(Input.is_action_pressed("move_left")) velocity.x-= 0.2
	    if(Input.is_action_pressed("move_down") and height > 4) {
	        height--
	        y++
	    }
	    if(Input.is_action_pressed("move_up")) {
	        height++
	        y--
	    }
	}
	siner-= velocity.x
	if(GS.turntimer < 1) instance_destroy()

func _gm_event_7_12():
	scr_damagestandard_x()

func _on_outside_room():
	draw_set_color(16777215)
	xadd= sin(siner / 4) * 4
	yadd= cos(siner / 4) * 4
	draw_rectangle(x + xadd, obj_maintem.y + obj_maintem.sprite_height - 8, x + 4 + xadd, y + height + yadd, 0)
	if(collision_rectangle(x + xadd, obj_maintem.y + obj_maintem.sprite_height - 8, x + 4 + xadd, y + height + yadd, 743, 0, 1))
	    event_user(2)
	draw_sprite(120/* spr_temfoot */, 0, x + xadd - 5, y + height + yadd)

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
